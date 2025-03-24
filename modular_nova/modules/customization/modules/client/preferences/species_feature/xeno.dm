/// Xenodorsal

// /datum/preference/toggle/mutant_toggle/xenodorsal
// 	savefile_key = "xenodorsal_toggle"
// 	relevant_mutant_bodypart = "xenodorsal"

// /datum/preference/choiced/mutant_choice/xenodorsal
// 	savefile_key = "feature_xenodorsal"
// 	relevant_mutant_bodypart = "xenodorsal"


// /datum/preference/tri_color/xenodorsal
// 	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
// 	savefile_identifier = PREFERENCE_CHARACTER
// 	savefile_key = "xenodorsal_color"
// 	relevant_mutant_bodypart = "xenodorsal"

// /datum/preference/tri_bool/xenodorsal
// 	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
// 	savefile_identifier = PREFERENCE_CHARACTER
// 	savefile_key = "xenodorsal_emissive"
// 	relevant_mutant_bodypart = "xenodorsal"

/// Xeno heads

/datum/preference/choiced/xenohead
	savefile_key = "feature_xenohead"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "xenohead"
	should_generate_icons = TRUE
	relevant_external_organ = /obj/item/organ/external/xenohead

/datum/preference/choiced/xenohead/init_possible_values()
	return possible_values_for_sprite_accessory_list_for_body_part(
		GLOB.xeno_heads_list,
		"xenohead",
		list("ADJ"),
	)

/datum/preference/choiced/xenohead/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["xenohead"] = value

/datum/preference/choiced/xenodorsal
	savefile_key = "feature_xenodorsal"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "xenodorsal"
	should_generate_icons = TRUE
	relevant_mutant_bodypart = "xenodorsal"

/datum/preference/choiced/xenodorsal/init_possible_values()
	return possible_values_for_sprite_accessory_list_for_body_part(
		GLOB.xeno_dorsals_list,
		"xenodorsal",
		list("BEHIND", "FRONT"),
	)

/datum/preference/choiced/xenodorsal/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["xenodorsal"] = value
	target.dna.species.handle_mutant_bodyparts(target)

// /datum/preference/toggle/xenohead
// 	savefile_key = "xenohead_toggle"
// 	relevant_mutant_bodypart = "xenohead"

// /datum/preference/tri_color/xenohead
// 	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
// 	savefile_identifier = PREFERENCE_CHARACTER
// 	savefile_key = "xenohead_color"
// 	relevant_mutant_bodypart = "xenohead"

// /datum/preference/tri_bool/xenohead
// 	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
// 	savefile_identifier = PREFERENCE_CHARACTER
// 	savefile_key = "xenohead_emissive"
// 	relevant_mutant_bodypart = "xenohead"


// /datum/preference/choiced/xenotail
// 	savefile_key = "feature_xenotail"
// 	savefile_identifier = PREFERENCE_CHARACTER
// 	category = PREFERENCE_CATEGORY_FEATURES
// 	main_feature_name = "xenohybrid_tail"
// 	should_generate_icons = TRUE
// 	relevant_external_organ = /obj/item/organ/external/xenotail

// /datum/preference/choiced/xenotail/init_possible_values()
// 	return possible_values_for_sprite_accessory_list_for_body_part(
// 		GLOB.xeno_tail_list,
// 		"xenohybrid_tail",
// 		list("BEHIND"),
// 	)

// /datum/preference/choiced/xenotail/apply_to_human(mob/living/carbon/human/target, value)
// 	target.dna.features["xenohybrid_tail"] = value
