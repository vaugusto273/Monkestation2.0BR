// caveirinha codes mais fodas

// Sinais
#define COMSIG_TURF_JUMP_ENDED_HERE "turf_jump_ended_here"      //from datum/element/jump/end_jump(): (jumper)
#define COMSIG_ELEMENT_JUMP_STARTED "element_jump_started"
#define COMSIG_ELEMENT_JUMP_ENDED "element_jump_ended"
#define COMSIG_KB_LIVING_JUMP_DOWN "keybind_living_jump_down"
#define COMSIG_KB_LIVING_JUMP_UP "keybind_living_jump_up"
#define COMSIG_LIVING_SET_JUMP_COMPONENT "living_set_jump_component"

// Outros bagulho
#define JUMP_COMPONENT "jump_component"
#define SFX_JUMP "jump"
#define JUMP_COMPONENT_COOLDOWN "jump_component_cooldown"
#define MOB_JUMP_LAYER 4.05

///Time to max out a charged jump
#define MAX_JUMP_CHARGE_TIME 0.4 SECONDS
#define JUMP_CHARGE_DURATION_MULT 1.2
#define JUMP_CHARGE_HEIGHT_MULT 2

/datum/component/jump
	dupe_mode = COMPONENT_DUPE_UNIQUE_PASSARGS
	///air time
	var/jump_duration
	///time between jumps
	var/jump_cooldown
	///how much stamina jumping takes
	var/stamina_cost
	///the how high the jumper visually jumps
	var/jump_height
	///the sound of the jump
	var/jump_sound
	///Special jump behavior flags
	var/jump_flags
	///allow_pass_flags flags applied to the jumper on jump
	var/jumper_allow_pass_flags
	///When the jump started. Only relevant for charged jumps
	var/jump_start_time = null

/datum/component/jump/Initialize(_jump_duration, _jump_cooldown, _stamina_cost, _jump_height, _jump_sound, _jump_flags, _jumper_allow_pass_flags)
	. = ..()
	if(!isliving(parent))
		return COMPONENT_INCOMPATIBLE
	set_vars(_jump_duration, _jump_cooldown, _stamina_cost, _jump_height, _jump_sound, _jump_flags, _jumper_allow_pass_flags)

/datum/component/jump/UnregisterFromParent()
	UnregisterSignal(parent, list(COMSIG_KB_LIVING_JUMP_DOWN, COMSIG_MOB_THROW))

/datum/component/jump/InheritComponent(datum/component/new_component, original_component, _jump_duration, _jump_cooldown, _stamina_cost, _jump_height, _jump_sound, _jump_flags, _jumper_allow_pass_flags)
	set_vars(_jump_duration, _jump_cooldown, _stamina_cost, _jump_height, _jump_sound, _jump_flags, _jumper_allow_pass_flags)

///Actually sets the jump vars
/datum/component/jump/proc/set_vars(_jump_duration = 0.5 SECONDS, _jump_cooldown = 1 SECONDS, _stamina_cost = 100, _jump_height = 16, _jump_sound = null, _jump_flags = null, _jumper_allow_pass_flags = PASSTABLE|PASSMOB|LETPASSTHROW)
	jump_duration = _jump_duration
	jump_cooldown = _jump_cooldown
	stamina_cost = _stamina_cost
	jump_height = _jump_height
	jump_sound = _jump_sound
	jump_flags = _jump_flags
	jumper_allow_pass_flags = _jumper_allow_pass_flags

	UnregisterSignal(parent, list(COMSIG_KB_LIVING_JUMP_DOWN))
	if(jump_flags)
		RegisterSignal(parent, COMSIG_KB_LIVING_JUMP_DOWN, PROC_REF(charge_jump))
		RegisterSignal(parent, COMSIG_KB_LIVING_JUMP_UP, PROC_REF(start_jump))
	else
		RegisterSignal(parent, COMSIG_KB_LIVING_JUMP_DOWN, PROC_REF(start_jump))

///Starts charging the jump
/datum/component/jump/proc/charge_jump(mob/living/jumper)
	jump_start_time = world.timeofday

///handles pre-jump checks and setup of additional jump behavior.
/datum/component/jump/proc/start_jump(mob/living/jumper)

	SIGNAL_HANDLER

	if(TIMER_COOLDOWN_CHECK(jumper, JUMP_COMPONENT_COOLDOWN))
		return
	if(jumper.buckled)
		return
	if(jumper.incapacitated())
		return

	if(stamina_cost && (jumper.stamina.loss < -stamina_cost))
		if(issilicon(jumper))
			to_chat(jumper, span_warning("Your leg servos do not allow you to jump!"))
			return
		to_chat(jumper, span_warning("Catch your breath!"))
		return

	do_jump(jumper)
	jumper.stamina.adjust(-stamina_cost)
	//Forces all who ride to jump alongside the jumper.
	for(var/mob/buckled_mob in jumper.buckled_mobs)
		do_jump(buckled_mob)

///Performs the jump
/datum/component/jump/proc/do_jump(mob/living/jumper)

	var/effective_jump_duration = jump_duration
	var/effective_jump_height = jump_height
	var/effective_jumper_allow_pass_flags = jumper_allow_pass_flags
	if(jump_start_time)
		var/charge_time = min(abs((world.timeofday - jump_start_time) / (MAX_JUMP_CHARGE_TIME)), 1)
		effective_jump_duration = LERP(jump_duration, jump_duration * JUMP_CHARGE_DURATION_MULT, charge_time)
		effective_jump_height = LERP(jump_height, jump_height * JUMP_CHARGE_HEIGHT_MULT, charge_time)
		if(charge_time == 1)
			effective_jumper_allow_pass_flags |= (PASSMOB|PASSTABLE|LETPASSTHROW)
		jump_start_time = null

	if(jump_sound)
		playsound(jumper, jump_sound, 65)

	var/original_layer = jumper.layer
	var/original_pass_flags = jumper.pass_flags

	SEND_SIGNAL(jumper, COMSIG_ELEMENT_JUMP_STARTED, effective_jump_height, effective_jump_duration)
	jumper.pass_flags |= effective_jumper_allow_pass_flags
	ADD_TRAIT(jumper, TRAIT_SILENT_FOOTSTEPS, JUMP_COMPONENT)

	animate(jumper, pixel_z = jumper.pixel_z + effective_jump_height, layer = max(MOB_JUMP_LAYER, original_layer), time = effective_jump_duration / 2, easing = CIRCULAR_EASING|EASE_OUT, flags = ANIMATION_END_NOW|ANIMATION_PARALLEL)
	animate(pixel_z = jumper.pixel_z - effective_jump_height, layer = original_layer, time = effective_jump_duration / 2, easing = CIRCULAR_EASING|EASE_IN)
	addtimer(CALLBACK(src, PROC_REF(end_jump), jumper, original_pass_flags), effective_jump_duration)

	TIMER_COOLDOWN_START(jumper, JUMP_COMPONENT_COOLDOWN, jump_cooldown)

///Ends the jump
/datum/component/jump/proc/end_jump(mob/living/jumper, original_pass_flags)
	jumper.remove_filter(JUMP_COMPONENT)
	jumper.pass_flags = original_pass_flags
	jumper.remove_traits(list(TRAIT_SILENT_FOOTSTEPS), JUMP_COMPONENT)
	SEND_SIGNAL(jumper, COMSIG_ELEMENT_JUMP_ENDED, TRUE, 1.5, 2)
	SEND_SIGNAL(jumper.loc, COMSIG_TURF_JUMP_ENDED_HERE, jumper)
	UnregisterSignal(jumper, COMSIG_MOB_THROW)


/// ADICIONA ESSA MERDA AO PLAYER

///Sets up the jump component for the mob. Proc args can be altered so different mobs have different 'default' jump settings
/mob/living/proc/set_jump_component(duration = 0.5 SECONDS, cooldown = 1 SECONDS, cost = 100, height = 16, sound = null, flags = null, jump_pass_flags = PASSTABLE|PASSMOB|LETPASSTHROW)
	var/list/arg_list = list(duration, cooldown, cost, height, sound, flags, jump_pass_flags)
	if(SEND_SIGNAL(src, COMSIG_LIVING_SET_JUMP_COMPONENT, arg_list))
		duration = arg_list[1]
		cooldown = arg_list[2]
		cost = arg_list[3]
		height = arg_list[4]
		sound = arg_list[5]
		flags = arg_list[6]
		jump_pass_flags = arg_list[7]

	var/gravity = has_gravity()
	if(gravity < 1) //low grav
		duration *= 2.5 - gravity
		cooldown *= 2 - gravity
		cost *= gravity * 0.5
		height *= 2 - gravity
		if(gravity <= 0.75)
			jump_pass_flags |= PASSTABLE
	else if(gravity > 1) //high grav
		duration *= gravity * 0.5
		cooldown *= gravity
		cost *= gravity
		height *= gravity * 0.5

	AddComponent(/datum/component/jump, _jump_duration = duration, _jump_cooldown = cooldown, _stamina_cost = cost, _jump_height = height, _jump_sound = sound, _jump_flags = flags, _jumper_allow_pass_flags = jump_pass_flags)

/datum/keybinding/living/attempt_jump
	hotkey_keys = list("I")
	name = "attempt_jump"
	full_name = "Jump"
	description = "Espero que essa bosta funcione"
	keybind_signal = COMSIG_KB_LIVING_JUMP_DOWN

/datum/keybinding/living/attempt_jump/up(client/user)
	SEND_SIGNAL(user.mob, COMSIG_KB_LIVING_JUMP_UP)  // Sinal enviado ao SOLTAR a tecla
	return TRUE

/mob/living/carbon/Initialize(mapload)
	. = ..()
	set_jump_component()