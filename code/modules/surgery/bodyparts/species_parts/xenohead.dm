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
	palette = /datum/color_palette/generic_colors
	palette_key = MUTANT_COLOR

// /datum/bodypart_overlay/mutant/xenohead/override_color(rgb_value)
// 	return draw_color

/datum/bodypart_overlay/mutant/xenohead/get_global_feature_list()
	return GLOB.xeno_heads_list


// others:


/obj/item/organ/external/tail/tail_xeno
	name = "Xenohybrid tail"
	desc = "A severed tail. What did you cut this off of?"
	icon_state = "xeno"
	icon = 'modular_nova/master_files/icons/mob/sprite_accessory/xeno_parts.dmi'

	preference = "feature_xenotail"
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_EXTERNAL_TAIL

	use_mob_sprite_as_obj_sprite = TRUE
	bodypart_overlay = /datum/bodypart_overlay/mutant/tail/tail_xeno


/datum/bodypart_overlay/mutant/tail/tail_xeno
    feature_key = "xenohybrid_tail"
    layers = EXTERNAL_FRONT | EXTERNAL_BEHIND
    color_source = ORGAN_COLOR_OVERRIDE
    palette = /datum/color_palette/generic_colors
    palette_key = MUTANT_COLOR

// /datum/bodypart_overlay/mutant/tail/tail_xeno/override_color(rgb_value)
// 	return draw_color

/datum/bodypart_overlay/mutant/tail/tail_xeno/get_global_feature_list()
	return GLOB.xeno_tail_list
