/obj/item/organ/external/xenohead
	name = "Xenohybrid head"
	desc = "head..."
	icon_state = "standard"
	icon = 'modular_nova/master_files/icons/mob/sprite_accessory/xeno_parts.dmi'

	preference = "feature_xenohead"
	zone = BODY_ZONE_HEAD
	slot = ORGAN_SLOT_EXTERNAL_HORNS

	use_mob_sprite_as_obj_sprite = TRUE
	bodypart_overlay = /datum/bodypart_overlay/mutant/xenohead

/datum/bodypart_overlay/mutant/xenohead
	feature_key = "xenohead"
	layers = EXTERNAL_ADJACENT
	color_source = ORGAN_COLOR_OVERRIDE

/datum/bodypart_overlay/mutant/xenohead/override_color(rgb_value)
	return draw_color

/datum/bodypart_overlay/mutant/xenohead/get_global_feature_list()
	return GLOB.xeno_heads_list

/*/datum/bodypart_overlay/mutant/xenohead/get_global_feature_list()
	return SSaccessories.sprite_accessories["xenohead"]*/


// others:


// /obj/item/organ/external/xenotail
// 	name = "Xenohybrid tail"
// 	desc = "A severed tail. What did you cut this off of?"
// 	icon_state = "xeno"
// 	icon = 'modular_nova/master_files/icons/mob/sprite_accessory/xeno_parts.dmi'

// 	zone = BODY_ZONE_PRECISE_GROIN
// 	slot = ORGAN_SLOT_EXTERNAL_TAIL

// 	use_mob_sprite_as_obj_sprite = TRUE
// 	bodypart_overlay = /datum/bodypart_overlay/mutant/xenotail

// /datum/bodypart_overlay/mutant/xenotail
// 	feature_key = "xeno"
// 	layers = EXTERNAL_ADJACENT
// 	color_source = ORGAN_COLOR_OVERRIDE

// /datum/bodypart_overlay/mutant/xenotail/override_color(rgb_value)
// 	return draw_color

// /datum/bodypart_overlay/mutant/xenotail/get_global_feature_list()
// 	return list(/datum/sprite_accessory/xeno_tail)
