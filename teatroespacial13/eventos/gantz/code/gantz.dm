/obj/structure/gantz
	name = "black sphere"
	desc = "Gantz? que porra é essa aí?"
	icon = 'teatroespacial13/eventos/gantz/icons/gantz.dmi'
	icon_state = "gantz"
	density = FALSE
	anchored = TRUE
	max_integrity = 200
	integrity_failure = 0.5

/obj/structure/gantz/Initialize(mapload)
	. = ..()
	var/static/list/reflection_filter = alpha_mask_filter(icon = icon('teatroespacial13/eventos/gantz/icons/gantz.dmi', "gantz_mask"))
	var/static/matrix/reflection_matrix = matrix(0.75, 0, 0, 0, 0.75, 0)
	var/datum/callback/can_reflect = CALLBACK(src, PROC_REF(can_reflect))
	var/list/update_signals = list(COMSIG_ATOM_BREAK)
	AddComponent(/datum/component/reflection, reflection_filter = reflection_filter, reflection_matrix = reflection_matrix, can_reflect = can_reflect, update_signals = update_signals)

/obj/structure/gantz/proc/can_reflect(atom/movable/target)
	///I'm doing it this way too, because the signal is sent before the broken variable is set to TRUE.
	if(atom_integrity <= integrity_failure * max_integrity)
		return FALSE
	if(broken || !isliving(target) || HAS_TRAIT(target, TRAIT_NO_MIRROR_REFLECTION))
		return FALSE
	return TRUE


// Efeito do Gantz de teleportar pros bgl
#define BREADIFY_TIME (5 SECONDS)

/datum/smite/gantztp
	name = "Teleporte Gantz"

/datum/smite/gantztp/effect(client/user, mob/living/target)
    . = ..()
    var/mutable_appearance/invisible = mutable_appearance('icons/effects/effects.dmi', "nothing")
    var/mutable_appearance/transform_scanline = mutable_appearance('icons/effects/effects.dmi', "transform_effect")

    var/turf/user_turf = get_turf(user.mob)
    var/obj/effect/temp_visual/puppet/teleport_effect = new(user_turf)

    teleport_effect.transformation_animation(target.appearance, BREADIFY_TIME, transform_scanline.appearance)

    target.transformation_animation(invisible, BREADIFY_TIME, transform_scanline.appearance)

    addtimer(CALLBACK(target, "admin_teleport", user_turf), BREADIFY_TIME)

// Objeto temporário para o efeito visual
/obj/effect/temp_visual/puppet
    icon = 'icons/effects/effects.dmi'
    icon_state = "nothing"
    layer = ABOVE_MOB_LAYER
    randomdir = FALSE
    duration = BREADIFY_TIME

#undef BREADIFY_TIME

MAPPING_DIRECTIONAL_HELPERS(/obj/structure/gantz, 28)
