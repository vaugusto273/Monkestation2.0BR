////////////////////////////////////////////////////////NSLIMEPEOPLE///////////////////////////////////////////////////////////////////

/datum/species/jelly/new_slime_person
	parent_type = /datum/species/jelly/slime
	id = SPECIES_NEWSLIMEPERSON

	// var/datum/action/innate/split_body/slime_split
	// var/list/mob/living/carbon/bodies
	// var/datum/action/innate/swap_body/swap_body


/datum/species/jelly/new_slime_person/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	slime_split.Remove(C)
	swap_body.Remove(C)


/datum/species/jelly/new_slime_person/get_species_description()
	return "Slimepeople are a humanoid species composed of a semi-solid gelatinous slime matrix."
