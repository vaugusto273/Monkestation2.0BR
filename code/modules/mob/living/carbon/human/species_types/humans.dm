/datum/species/human
	name = "\improper Human"
	id = SPECIES_HUMAN
	mutant_bodyparts = list("wings" = "None")
	inherent_traits = list(
		TRAIT_USES_MIXSKINTONES,
	)
	skinned_type = /obj/item/stack/sheet/animalhide/human
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	payday_modifier = 1
	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/human,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/human,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/human,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/human,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/human,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/human,
	)

/datum/species/human/prepare_human_for_preview(mob/living/carbon/human/human)
	human.hairstyle = "Business Hair"
	human.hair_color = "#bb9966" // brown
	human.update_body_parts()

/datum/species/human/randomize_features(mob/living/carbon/human/human_mob)
	human_mob.skin_tone = random_skin_tone()

/datum/species/human/get_species_description()
	return "Humans are the dominant species in the known galaxy. \
		Their kind extend from old Earth to the edges of known space."

/datum/species/human/on_species_gain(mob/living/carbon/human/target)
	. = ..()
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

/datum/species/human/create_pref_unique_perks()
	var/list/to_add = list()

	if(CONFIG_GET(number/default_laws) == 0 || CONFIG_GET(flag/silicon_asimov_superiority_override)) // Default lawset is set to Asimov
		to_add += list(list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "robot",
			SPECIES_PERK_NAME = "Asimov Superiority",
			SPECIES_PERK_DESC = "The AI and their cyborgs are, by default, subservient only \
				to humans. As a human, silicons are required to both protect and obey you.",
		))

	if(CONFIG_GET(flag/enforce_human_authority))
		to_add += list(list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "bullhorn",
			SPECIES_PERK_NAME = "Chain of Command",
			SPECIES_PERK_DESC = "Nanotrasen only recognizes humans for command roles, such as Captain.",
		))

	return to_add

