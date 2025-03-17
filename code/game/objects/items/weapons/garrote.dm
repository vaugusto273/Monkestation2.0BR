/*
 * Contains:
 * 	Traitor fiber wire
 * 	Improvised garrotes
 */

/// 12TC traitor item
/obj/item/garrote
	name = "fiber wire"
	desc = "A length of razor-thin wire with an elegant wooden handle on either end.<br>You suspect you'd have to be behind the target to use this weapon effectively."
	icon = 'icons/obj/weapons/melee.dmi'
	icon_state = "garrot_wrap"
	w_class = WEIGHT_CLASS_TINY
	var/improvised = FALSE
	var/garrote_time

/obj/item/garrote/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/two_handed)

/obj/item/garrote/Destroy()
	return ..()

/obj/item/garrote/update_icon_state()
	icon_state = "garrot_[improvised ? "I_" : ""][HAS_TRAIT(src, TRAIT_WIELDED) ? "un" : ""]wrap"

/obj/item/garrote/improvised
	name = "garrote"
	desc = "A length of cable with a shoddily-carved wooden handle tied to either end.<br>You suspect you'd have to be behind the target to use this weapon effectively."
	icon_state = "garrot_I_wrap"
	improvised = TRUE

/obj/item/garrote/improvised/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/two_handed, wield_callback = CALLBACK(src, PROC_REF(wield)))

/obj/item/garrote/proc/wield(obj/item/source, mob/living/carbon/user)
	if(!isliving(user))
		return

	var/datum/status_effect/strandling/strangle_effect = user.status_effects?.GetEffect("strandling")
	if(istype(strangle_effect))
		strangle_effect.on_remove()

/obj/item/garrote/attackby(obj/item/W, mob/living/carbon/user)
	. = ..()
	if(HAS_TRAIT(src, TRAIT_WIELDED) && istool(W, TOOL_WIRECUTTER))
		user.visible_message("<span class='notice'>[user] cuts the wire on [src], making it unusable!</span>")
		qdel(src)

/obj/item/garrote/attack(mob/living/carbon/M as mob, mob/user as mob)
	if(garrote_time > world.time)
		return

	if(!ishuman(user) || !ishuman(M))
		return

	if(!HAS_TRAIT(src, TRAIT_WIELDED))
		to_chat(user, "<span class = 'warning'>You must use both hands to garrote [M]!</span>")
		return

	if(M == user)
		user.visible_message("<span class='suicide'>[user] is wrapping [src] around [user.p_their()] neck and pulling the handles! It looks like [user.p_theyre()] trying to commit suicide!</span>")
		playsound(loc, 'sound/weapons/cablecuff.ogg', 15, TRUE, -10, ignore_walls = FALSE)
		return OXYLOSS

	if(M.dir != user.dir && !M.incapacitated())
		to_chat(user, "<span class='warning'>You cannot use [src] on [M] from that angle!</span>")
		return

	if(improvised && ((M.head && (M.head.flags_cover & HEADCOVERSMOUTH)) || (M.wear_mask && (M.wear_mask.flags_cover & MASKCOVERSMOUTH))))
		to_chat(user, "<span class = 'warning'>[M]'s neck is blocked by something [M.p_theyre()] wearing!</span>")

	if(M.status_effects?.HasEffect("strandling"))
		return

	var/datum/status_effect/strandling/strangle_effect = new /datum/status_effect/strandling()
	M.status_effects?.AddEffect(strangle_effect)
	strangle_effect.on_apply()

	garrote_time = world.time + 10
	playsound(loc, 'sound/weapons/cablecuff.ogg', 15, TRUE, -10, ignore_walls = FALSE)

	M.visible_message("<span class='danger'>[user] comes from behind and begins garroting [M] with [src]!</span>",
			"<span class='userdanger'>[user] begins garroting you with [src]![improvised ? "" : " You are unable to speak!"]</span>",
			"You hear struggling and wire strain against flesh!")


/*
/obj/item/garrote/suicide_act(mob/user)
	span_suicide("<span class='suicide'>[user] is wrapping [src] around [user.p_their()] neck and pulling the handles! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	playsound(loc, 'sound/weapons/cablecuff.ogg', 15, TRUE, -10, ignore_walls = FALSE)
	return OXYLOSS
	*/
