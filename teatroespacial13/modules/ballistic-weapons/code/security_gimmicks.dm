/datum/armor/item_shield/ballistic
	melee = 30
	bullet = 85
	bomb = 10
	laser = 80

/obj/item/shield/ballistic
	name = "ballistic shield"
	desc = "A heavy shield designed for blocking projectiles, weaker to melee."
	icon = 'teatroespacial13/modules/ballistic-weapons/icons/security_gimmicks.dmi'
	lefthand_file = 'teatroespacial13/modules/ballistic-weapons/icons/worn/sg_lefthand.dmi'
	righthand_file = 'teatroespacial13/modules/ballistic-weapons/icons/worn/sg_righthand.dmi'
	icon_state = "ballistic"
	inhand_icon_state = "ballistic"
	custom_materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 2, /datum/material/glass = SHEET_MATERIAL_AMOUNT * 2, /datum/material/titanium =SHEET_MATERIAL_AMOUNT)
	max_integrity = 75
	shield_break_leftover = /obj/item/stack/rods/ten
	armor_type = /datum/armor/item_shield/ballistic

/obj/item/shield/ballistic/attackby(obj/item/attackby_item, mob/user, params)
	if(istype(attackby_item, /obj/item/stack/sheet/mineral/titanium))
		if (atom_integrity >= max_integrity)
			to_chat(user, span_warning("[src] is already in perfect condition."))
			return
		var/obj/item/stack/sheet/mineral/titanium/titanium_sheet = attackby_item
		titanium_sheet.use(1)
		atom_integrity = max_integrity
		to_chat(user, span_notice("You repair [src] with [titanium_sheet]."))
		return
	return ..()

#define COMSIG_BREACHING "breaching_signal_woop_woop"

/obj/item/melee/breaching_hammer
	name = "D-4 tactical hammer"
	desc = "A metallic-plastic composite breaching hammer, looks like a whack with this would severly harm or tire someone."
	icon = 'teatroespacial13/modules/ballistic-weapons/icons/security_gimmicks.dmi'
	icon_state = "hammer"
	inhand_icon_state = "hammer"
	worn_icon_state = "hammer"
	lefthand_file = 'teatroespacial13/modules/ballistic-weapons/icons/worn/sg_lefthand.dmi'
	righthand_file = 'teatroespacial13/modules/ballistic-weapons/icons/worn/sg_righthand.dmi'
	slot_flags = ITEM_SLOT_BELT
	force = 15
	throwforce = 10
	w_class = WEIGHT_CLASS_NORMAL
	attack_verb_continuous = list("whacks","breaches","bulldozes","flings","thwachs")
	attack_verb_simple = list("breach","hammer","whack","slap","thwach","fling")
	/// Delay between door hits
	var/breaching_delay = 2 SECONDS
	/// The door we aim to breach
	var/obj/machinery/door/breaching_target = null
	/// If we are in the process of breaching
	var/breaching = FALSE
	/// The person breaching
	var/mob/living/breacher = null

/obj/item/melee/breaching_hammer/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/kneecapping)

/obj/item/melee/breaching_hammer/attack_atom(atom/attacked_atom, mob/living/user, params)
	if(!istype(attacked_atom, /obj/machinery/door))
		return ..()

	var/obj/machinery/door/door_target = attacked_atom

	if(breaching)
		to_chat(user, span_warning("Already breaching!"))
		return

	breaching_target = door_target
	breacher = user

	RegisterSignal(user, COMSIG_MOVABLE_MOVED, PROC_REF(check_distance))
	RegisterSignal(user, COMSIG_QDELETING, PROC_REF(stop_breaching))
	RegisterSignal(door_target, COMSIG_QDELETING, PROC_REF(stop_breaching))

	to_chat(user, span_notice("You start preparing to breach [door_target]..."))
	if(!do_after(user, 2 SECONDS, door_target))
		stop_breaching()
		return

	start_breaching(door_target, user)
	return ITEM_INTERACT_SUCCESS

/obj/item/melee/breaching_hammer/proc/start_breaching(obj/machinery/door/target, mob/living/user)
	breaching = TRUE
	visible_message(span_danger("[user] starts breaching [target] with [src]!"))
	breach_loop(target, user)

/obj/item/melee/breaching_hammer/proc/breach_loop(obj/machinery/door/target, mob/living/user)
	while(breaching && !QDELETED(target) && !QDELETED(user))
		if(!user.Adjacent(target) || user.incapacitated())
			stop_breaching()
			return

		user.do_attack_animation(target)
		target.take_damage(force * 2.5)
		playsound(target, 'sound/weapons/sonic_jackhammer.ogg', 70, TRUE)

		if(target.get_integrity() <= 0)
			stop_breaching()
			return

		sleep(breaching_delay)

/obj/item/melee/breaching_hammer/proc/check_distance()
	SIGNAL_HANDLER
	if(!breacher?.Adjacent(breaching_target))
		stop_breaching()

/obj/item/melee/breaching_hammer/proc/stop_breaching()
	SIGNAL_HANDLER
	UnregisterSignal(breacher, list(COMSIG_MOVABLE_MOVED, COMSIG_QDELETING))
	UnregisterSignal(breaching_target, COMSIG_QDELETING)

	if(breaching_target)
		visible_message(span_warning("The breaching attempt on [breaching_target] stops!"))

	breaching = FALSE
	breaching_target = null
	breacher = null
