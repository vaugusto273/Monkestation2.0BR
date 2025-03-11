/obj/item/bodypart/head/xenohead
	limb_id = SPECIES_XENO
	is_dimorphic = FALSE
	head_flags = HEAD_EYESPRITES|HEAD_DEBRAIN
	palette = /datum/color_palette/generic_colors
	palette_key = MUTANT_COLOR

/datum/bodypart_overlay/mutant/xenohead
	feature_key = "xenohead"
	layers = EXTERNAL_ADJACENT
	color_source = ORGAN_COLOR_OVERRIDE

/datum/bodypart_overlay/mutant/xenohead/override_color(rgb_value)
	return draw_color

/*/datum/bodypart_overlay/mutant/xenohead/get_global_feature_list()
	return SSaccessories.sprite_accessories["xenohead"]*/
