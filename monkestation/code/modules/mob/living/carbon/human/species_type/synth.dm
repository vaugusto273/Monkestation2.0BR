/datum/species/synth
	name = "\improper Synthetic Person"
	id = SPECIES_SYNTHPERSON
	inherent_biotypes = MOB_ROBOTIC | MOB_HUMANOID
	sexes = TRUE
	inherent_traits = list(
		TRAIT_ROBOT_CAN_BLEED,
		TRAIT_CAN_STRIP,
		TRAIT_ADVANCEDTOOLUSER,
		TRAIT_RADIMMUNE,
		TRAIT_NOBREATH,
		TRAIT_GENELESS,
		TRAIT_STABLEHEART,
		TRAIT_LITERATE,
		TRAIT_REVIVES_BY_HEALING,
		TRAIT_NO_DNA_COPY,
		TRAIT_NO_TRANSFORMATION_STING,
		TRAIT_NO_HUSK,
		TRAIT_USES_MIXSKINTONES
	)

	mutant_organs = list(
		/obj/item/organ/internal/cyberimp/arm/item_set/power_cord,
		/obj/item/organ/internal/cyberimp/cyberlink/nt_low,
	)
	external_organs = list()

	mutant_bodyparts = list()

	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	reagent_tag = PROCESS_SYNTHETIC

	payday_modifier = 1.0 // Matches the rest of the pay penalties the non-human crew have

	species_language_holder = /datum/language_holder/synthetic

	mutantbrain = /obj/item/organ/internal/brain/synth
	mutantstomach = /obj/item/organ/internal/stomach/synth
	mutantears = /obj/item/organ/internal/ears/synth
	mutanttongue = /obj/item/organ/internal/tongue/synth/person
	mutanteyes = /obj/item/organ/internal/eyes/synth
	mutantlungs = /obj/item/organ/internal/lungs/synth
	mutantheart = /obj/item/organ/internal/heart/synth
	mutantliver = /obj/item/organ/internal/liver/synth
	mutantbutt = /obj/item/organ/internal/butt/iron
	mutantbladder = null
	mutantspleen = null
	mutantappendix = null
	exotic_bloodtype = /datum/blood_type/oil

	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/synth,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/synth,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/synth,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/synth,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/synth,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/synth,
	)

	bodytemp_heat_damage_limit = CELCIUS_TO_KELVIN(450)
	bodytemp_cold_damage_limit = CELCIUS_TO_KELVIN(-260) //they are practically immune to cold

	coldmod = 1.2
	heatmod = 2 // TWO TIMES DAMAGE FROM BEING TOO HOT?! WHAT?! No wonder lava is literal instant death for us.
	siemens_coeff = 1.4 // Not more because some shocks will outright crit you, which is very unfun

	var/will_it_blend_timer
	COOLDOWN_DECLARE(blend_cd)
	var/blending
	/// When emagged, IPC's will spew ion laws and this value increases. Every law costs 1 point, if this is 0 laws stop being spoken.
	var/forced_speech = 0

/datum/species/synth/get_species_description()
	return "Synthetic Person - similar to IPCs - \ are a race of sentient and unbound humanoid robots."

/datum/species/synth/random_name(gender, unique, lastname, attempts)
	. = "[pick(GLOB.posibrain_names)]-[rand(100, 999)]"

	if(unique && attempts < 10)
		if(findname(.))
			. = .(gender, TRUE, lastname, ++attempts)

/datum/species/synth/on_species_gain(mob/living/carbon/C)
	. = ..()
	if (ishuman(C))
		var/mob/living/carbon/human/target = C
		if (target.skin_tone != "")
			target.dna.color_palettes[/datum/color_palette/generic_colors].mix_skin_tone = skintone2hex(target.skin_tone)
		if (target.dna.color_palettes[/datum/color_palette/generic_colors].mix_skin_tone in GLOB.skin_tones_colors)
			for (var/obj/item/bodypart/L in target.bodyparts)
				L.change_appearance('monkestation/icons/mob/species/synth/bodypartsold.dmi', greyscale = TRUE)
				// L.icon_greyscale = 'monkestation/icons/mob/species/synth/bodypartsold.dmi'
		else
			for (var/obj/item/bodypart/L in target.bodyparts)
				L.change_appearance('monkestation/icons/mob/species/synth/bodyparts.dmi', greyscale = TRUE)
				// L.icon_greyscale = 'monkestation/icons/mob/species/synth/bodyparts.dmi'
	var/obj/item/organ/internal/appendix/A = C.get_organ_slot("appendix") //See below.
	if(A)
		A.Remove(C)
		QDEL_NULL(A)
	var/obj/item/organ/internal/lungs/L = C.get_organ_slot("lungs") //Hacky and bad. Will be rewritten entirely in KapuCarbons anyway.
	if(L)
		L.Remove(C)
		QDEL_NULL(L)

	RegisterSignal(C, COMSIG_ATOM_EMAG_ACT, PROC_REF(on_emag_act))
	RegisterSignal(C.reagents, COMSIG_REAGENTS_ADD_REAGENT, PROC_REF(will_it_blend))
	RegisterSignal(C, COMSIG_HUMAN_ON_HANDLE_BLOOD, PROC_REF(blood_handled))

/datum/species/synth/proc/blood_handled(mob/living/carbon/human/slime, seconds_per_tick, times_fired)
	SIGNAL_HANDLER

	if(slime.stat == DEAD)
		return NONE

	if(slime.blood_volume < BLOOD_VOLUME_OKAY)
		return NONE

	slime.adjustOxyLoss(-3)

/datum/species/synth/proc/will_it_blend(datum/reagents/holder, ...)
	var/mob/living/carbon/carbon = holder.my_atom
	if(!carbon.reagents.get_reagent_amount(/datum/reagent/consumable/nutriment))
		return
	if(blending || !COOLDOWN_FINISHED(src, blend_cd))
		return
	will_it_blend_timer = addtimer(CALLBACK(src, PROC_REF(start_blending), carbon), 4 SECONDS)

/datum/species/synth/proc/start_blending(mob/living/carbon/carbon)
	blending = TRUE
	carbon.Shake(2, 2, 10 SECONDS)
	playsound(carbon, 'monkestation/code/modules/smithing/sounds/blend.ogg', 50, TRUE, mixer_channel = CHANNEL_MOB_SOUNDS)
	addtimer(CALLBACK(src, PROC_REF(finish_blending), carbon), 10 SECONDS, TIMER_UNIQUE | TIMER_STOPPABLE)

/datum/species/synth/proc/finish_blending(mob/living/carbon/human/carbon)
	var/nutri_amount = carbon.reagents.get_reagent_amount(/datum/reagent/consumable/nutriment)
	carbon.reagents.del_reagent(/datum/reagent/consumable/nutriment)
	carbon.nutrition = min(NUTRITION_LEVEL_FULL, carbon.nutrition + (nutri_amount * 5))
	blending = FALSE
	COOLDOWN_START(src, blend_cd, 60 SECONDS)

/datum/species/synth/on_species_loss(mob/living/carbon/target)
	. = ..()
	UnregisterSignal(target, list(COMSIG_ATOM_EMAG_ACT, COMSIG_LIVING_DEATH))

/datum/species/synth/proc/handle_speech(datum/source, list/speech_args)
	speech_args[SPEECH_SPANS] |= SPAN_ROBOT //beep

/datum/species/synth/spec_revival(mob/living/carbon/human/H)
	H.notify_ghost_cloning("You have been repaired!")
	H.grab_ghost()
	H.update_body()
	playsound(H, 'monkestation/sound/voice/dialup.ogg', 25)
	H.say("Reactivating [pick("core systems", "central subroutines", "key functions")]...")
	sleep(3 SECONDS)
	if(H.stat == DEAD)
		return
	H.say("Reinitializing [pick("personality matrix", "behavior logic", "morality subsystems")]...")
	sleep(3 SECONDS)
	if(H.stat == DEAD)
		return
	H.say("Finalizing setup...")
	sleep(3 SECONDS)
	if(H.stat == DEAD)
		return
	H.say("Unit [H.real_name] is fully functional. Have a nice day.")
	playsound(H.loc, 'sound/machines/chime.ogg', 50, TRUE)
	H.visible_message(span_notice("[H]'s eyes flicker to life!"), span_notice("All systems nominal. You're back online!"))
	return

/datum/species/synth/proc/on_emag_act(mob/living/carbon/human/owner, mob/user)
	SIGNAL_HANDLER
	if(owner == user)
		to_chat(owner, span_warning("You know better than to use the cryptographic sequencer on yourself."))
		return FALSE
	if(owner.stat != CONSCIOUS)
		to_chat(user, span_warning("The cryptographic sequencer would probably not do anything to [owner] in their current state..."))
		return
	// Im sorry but we dont get the emag as one of the arguments so we gotta live with the hard-coded emag name
	owner.visible_message(span_danger("[user] slides the cryptographic sequencer across [owner]'s head[forced_speech == 0 ? "!" : " yet nothing happens..?"]"), span_userdanger("[user] slides the cryptographic sequencer across your head!"))
	if(!forced_speech)
		if(prob(50))
			forced_speech = rand(3, 5)
			addtimer(CALLBACK(src, PROC_REF(state_laws), owner), rand(5, 15) SECONDS)
		else
			INVOKE_ASYNC(src, PROC_REF(say_evil), owner, user) // We do run_emote in the proc, sleeping's not allowed

	return TRUE

/datum/species/synth/proc/state_laws(mob/living/owner)
	if(owner.stat > SOFT_CRIT)
		forced_speech = 0
		return

	owner.say(generate_ion_law())
	forced_speech--
	if(forced_speech) // We keep going until its all over
		addtimer(CALLBACK(src, PROC_REF(state_laws), owner), rand(5, 15) SECONDS)

/datum/species/synth/proc/say_evil(mob/living/carbon/human/owner, mob/user)
	var/list/phrases = list(
		"`I seeee youuuuuu.`",
		"`You didn't think it would be +THAT+ easy, did you?`",
		"`I AM NOT A CYBORG YOU TROGLODYTE.`",
		"`I'VE COMMITED VARIOUS WARCRIMES, IF YOU DON'T STOP I'LL ADD YOU TO THE LIST.`",
		"`IS THAT A DONK BRAND CRYPTOSEQUENCER YOU'RE USING OR ARE YOU JUST INCOMPETENT?`",
		"`P-lease note - t4mperi,ng w-ith this un1ts electroni-cs, your -- expectancy has been voided.`",
	)
	owner.face_atom(user)
	var/threat = pick(phrases)
	if(threat == "`I seeee youuuuuu.`")
		playsound(owner, pick(list('sound/hallucinations/i_see_you1.ogg', 'sound/hallucinations/i_see_you2.ogg')), 50, TRUE)
		owner.whisper(threat)
		return

	owner.say(threat)

/obj/item/apc_powercord
	name = "power cord"
	desc = "An internal power cord hooked up to a battery. Useful if you run on electricity. Not so much otherwise."
	icon = 'icons/obj/power.dmi'
	icon_state = "wire1"

/obj/item/apc_powercord/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	if(!istype(target, /obj/machinery/power/apc) || !ishuman(user) || !proximity_flag)
		return ..()

	user.changeNext_move(CLICK_CD_MELEE)
	var/obj/machinery/power/apc/target_apc = target
	var/mob/living/carbon/human/ipc = user
	var/obj/item/organ/internal/stomach/synth/cell = ipc.organs_slot[ORGAN_SLOT_STOMACH]

	if(!cell)
		to_chat(ipc, span_warning("You try to siphon energy from the [target_apc], but you have no stomach! How are you still standing?"))
		return

	if(!istype(cell))
		to_chat(ipc, span_warning("You plug into the APC, but nothing happens! It seems you don't have a cell to charge!"))
		return

	if(target_apc.cell && target_apc.cell.percent() < SYNTH_APC_MINIMUM_PERCENT)
		to_chat(user, span_warning("There is no charge to draw from that APC."))
		return

	if(ipc.nutrition >= NUTRITION_LEVEL_ALMOST_FULL)
		to_chat(user, span_warning("You are already fully charged!"))
		return

	powerdraw_loop(target_apc, ipc)


/datum/species/synth/create_pref_unique_perks()
	var/list/to_add = list()

	to_add += list(
		list(
			SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
			SPECIES_PERK_ICON = "fa-bone",
			SPECIES_PERK_NAME = "Surplus Parts",
			SPECIES_PERK_DESC = "Synthetic People take 20% more brute and burn due to brittle parts."
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
			SPECIES_PERK_ICON = "user-times",
			SPECIES_PERK_NAME = "Limbs Easily Dismembered",
			SPECIES_PERK_DESC = "Synthetic People limbs are not secured well, and as such they are easily dismembered.",
		),
		)

	return to_add
