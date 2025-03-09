/datum/species/ipc/synth
	parent_type = /datum/species/ipc
	name = "\improper Synthetic Person"
	id = SPECIES_SYNTHPERSON

	mutant_bodyparts = null

	mutanttongue = /obj/item/organ/internal/tongue/synth/person

	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/synth,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/synth,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/synth,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/synth,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/synth,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/synth,
	)
	external_organs = list()
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
		TRAIT_USES_SKINTONES,
	)

/datum/species/ipc/synth/replace_body(mob/living/carbon/target, datum/species/new_species)
	new_species ||= target.dna.species //If no new species is provided, assume its src.
	//Note for future: Potentionally add a new C.dna.species() to build a template species for more accurate limb replacement

	var/is_digitigrade = FALSE
	if((new_species.digitigrade_customization == DIGITIGRADE_OPTIONAL && target.dna.features["legs"] == DIGITIGRADE_LEGS) || new_species.digitigrade_customization == DIGITIGRADE_FORCED)
		is_digitigrade = TRUE

	for(var/obj/item/bodypart/old_part as anything in target.bodyparts)
		if((old_part.change_exempt_flags & BP_BLOCK_CHANGE_SPECIES) || (old_part.bodypart_flags & BODYPART_IMPLANTED))
			continue

		var/path = new_species.bodypart_overrides?[old_part.body_zone]
		var/obj/item/bodypart/new_part
		if(path)
			new_part = new path()
			if(istype(new_part, /obj/item/bodypart/leg) && is_digitigrade)
				new_part:set_digitigrade(TRUE)
			new_part.replace_limb(target, TRUE)
			new_part.update_limb(is_creating = TRUE)
			new_part.set_initial_damage(old_part.brute_dam, old_part.burn_dam)
		qdel(old_part)

/datum/species/ipc/synth/on_species_gain(mob/living/carbon/C)
	..()
	if(change_screen)
		change_screen.Remove(C)

/datum/species/ipc/synth/get_species_description()
	return "Synthetic Person - similar to IPCs - \ are a race of sentient and unbound humanoid robots."

