/obj/item/bodypart/head/synth
	icon_greyscale = 'monkestation/icons/mob/species/synth/bodypartsold.dmi'
	limb_id = "color" //Overriden in /species/ipc/replace_body()
	icon_state = "color_head"
	is_dimorphic = TRUE
	should_draw_greyscale = TRUE
	palette = /datum/color_palette/generic_colors
	palette_key = MIX_SKIN_TONE
	biological_state = BIO_ROBOTIC | BIO_BLOODED
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ROBOTIC
	head_flags = (HEAD_HAIR|HEAD_FACIAL_HAIR|HEAD_LIPS|HEAD_EYESPRITES|HEAD_EYECOLOR|HEAD_EYEHOLES)
	brute_modifier = 1.2 // Monkestation Edit
	burn_modifier = 1.2 // Monkestation Edit

	body_damage_coeff = 1.1	//IPC's Head can dismember	//Monkestation Edit
	max_damage = 40	//Keep in mind that this value is used in the //Monkestation Edit
	dmg_overlay_type = "synth"

	disabling_threshold_percentage = 1

	biological_state = (BIO_ROBOTIC|BIO_JOINTED)

	damage_examines = list(BRUTE = ROBOTIC_BRUTE_EXAMINE_TEXT, BURN = ROBOTIC_BURN_EXAMINE_TEXT, CLONE = DEFAULT_CLONE_EXAMINE_TEXT)

/obj/item/bodypart/chest/synth
	icon_greyscale = 'monkestation/icons/mob/species/synth/bodypartsold.dmi'
	limb_id = "color"
	icon_state = "color_chest"
	is_dimorphic = TRUE
	should_draw_greyscale = TRUE
	palette = /datum/color_palette/generic_colors
	palette_key = MIX_SKIN_TONE
	biological_state = BIO_ROBOTIC | BIO_BLOODED
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ROBOTIC
	bodypart_traits = list(TRAIT_LIMBATTACHMENT)
	body_damage_coeff = 1	//IPC Chest at default	///Monkestation Edit
	max_damage = 250	//Default: 200 ///Monkestation Edit
	brute_modifier = 1.2 // Monkestation Edit
	burn_modifier = 1.2 // Monkestation Edit

	dmg_overlay_type = "synth"

	disabling_threshold_percentage = 1

	biological_state = (BIO_ROBOTIC|BIO_JOINTED)

	damage_examines = list(BRUTE = ROBOTIC_BRUTE_EXAMINE_TEXT, BURN = ROBOTIC_BURN_EXAMINE_TEXT, CLONE = DEFAULT_CLONE_EXAMINE_TEXT)

/obj/item/bodypart/arm/left/synth
	icon_greyscale = 'monkestation/icons/mob/species/synth/bodypartsold.dmi'
	limb_id = "color"
	icon_state = "color_l_arm"
	flags_1 = CONDUCT_1
	should_draw_greyscale = TRUE
	palette = /datum/color_palette/generic_colors
	palette_key = MIX_SKIN_TONE
	biological_state = BIO_ROBOTIC | BIO_JOINTED | BIO_BLOODED
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ROBOTIC
	brute_modifier = 1.2 // Monkestation Edit
	burn_modifier = 1.2 // Monkestation Edit

	body_damage_coeff = 1.1	//IPC's Limbs Should Dismember Easier	//Monkestation Edit
	max_damage = 30	//Monkestation Edit

	dmg_overlay_type = "synth"

	disabling_threshold_percentage = 1

	biological_state = (BIO_ROBOTIC|BIO_JOINTED)

	damage_examines = list(BRUTE = ROBOTIC_BRUTE_EXAMINE_TEXT, BURN = ROBOTIC_BURN_EXAMINE_TEXT, CLONE = DEFAULT_CLONE_EXAMINE_TEXT)

/obj/item/bodypart/arm/right/synth
	icon_greyscale = 'monkestation/icons/mob/species/synth/bodypartsold.dmi'
	limb_id = "color"
	icon_state = "synth_r_arm"
	flags_1 = CONDUCT_1
	should_draw_greyscale = TRUE
	palette = /datum/color_palette/generic_colors
	palette_key = MIX_SKIN_TONE
	biological_state = BIO_ROBOTIC | BIO_JOINTED | BIO_BLOODED
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ROBOTIC
	brute_modifier = 1.2 // Monkestation Edit
	burn_modifier = 1.2 // Monkestation Edit

	body_damage_coeff = 1.1	//IPC's Limbs Should Dismember Easier	//Monkestation Edit
	max_damage = 30	//Monkestation Edit

	dmg_overlay_type = "synth"

	disabling_threshold_percentage = 1

	biological_state = (BIO_ROBOTIC|BIO_JOINTED)

	damage_examines = list(BRUTE = ROBOTIC_BRUTE_EXAMINE_TEXT, BURN = ROBOTIC_BURN_EXAMINE_TEXT, CLONE = DEFAULT_CLONE_EXAMINE_TEXT)

/obj/item/bodypart/leg/left/synth
	icon_greyscale = 'monkestation/icons/mob/species/synth/bodypartsold.dmi'
	limb_id = "color"
	icon_state = "color_l_leg"
	flags_1 = CONDUCT_1
	should_draw_greyscale = TRUE
	palette = /datum/color_palette/generic_colors
	palette_key = MIX_SKIN_TONE
	biological_state = BIO_ROBOTIC | BIO_JOINTED | BIO_BLOODED
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ROBOTIC
	brute_modifier = 1.2 // Monkestation Edit
	burn_modifier = 1.2 // Monkestation Edit

	dmg_overlay_type = "synth"
	step_sounds = list('sound/effects/servostep.ogg')

	disabling_threshold_percentage = 1

	biological_state = (BIO_ROBOTIC|BIO_JOINTED)

	damage_examines = list(BRUTE = ROBOTIC_BRUTE_EXAMINE_TEXT, BURN = ROBOTIC_BURN_EXAMINE_TEXT, CLONE = DEFAULT_CLONE_EXAMINE_TEXT)

/obj/item/bodypart/leg/right/synth
	icon_greyscale = 'monkestation/icons/mob/species/synth/bodypartsold.dmi'
	limb_id = "color"
	icon_state = "color_r_leg"
	flags_1 = CONDUCT_1
	should_draw_greyscale = TRUE
	palette = /datum/color_palette/generic_colors
	palette_key = MIX_SKIN_TONE
	biological_state = BIO_ROBOTIC | BIO_JOINTED | BIO_BLOODED
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ROBOTIC
	brute_modifier = 1.2 // Monkestation Edit
	burn_modifier = 1.2 // Monkestation Edit

	body_damage_coeff = 1.1	//IPC's Limbs Should Dismember Easier	//Monkestation Edit
	max_damage = 30	//Monkestation Edit

	dmg_overlay_type = "synth"
	step_sounds = list('sound/effects/servostep.ogg')

	disabling_threshold_percentage = 1

	biological_state = (BIO_ROBOTIC|BIO_JOINTED)

	damage_examines = list(BRUTE = ROBOTIC_BRUTE_EXAMINE_TEXT, BURN = ROBOTIC_BURN_EXAMINE_TEXT, CLONE = DEFAULT_CLONE_EXAMINE_TEXT)
