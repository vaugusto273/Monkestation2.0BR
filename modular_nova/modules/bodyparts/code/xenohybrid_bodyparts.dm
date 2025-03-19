// xenohybrid!
var/xeno_color = "#525288"
/obj/item/bodypart/head/xenohybrid
	icon_greyscale = 'modular_nova/modules/bodyparts/icons/xeno_parts_greyscale.dmi'
	limb_id = SPECIES_XENO
	is_dimorphic = TRUE
	head_flags = (HEAD_HAIR|HEAD_FACIAL_HAIR|HEAD_LIPS|HEAD_EYESPRITES|HEAD_EYECOLOR|HEAD_EYEHOLES|HEAD_DEBRAIN)
	palette = /datum/color_palette/generic_colors
	palette_key = MUTANT_COLOR


/obj/item/bodypart/chest/xenohybrid
	icon_greyscale = 'modular_nova/modules/bodyparts/icons/xeno_parts_greyscale.dmi'
	limb_id = SPECIES_XENO
	is_dimorphic = TRUE
	ass_image = 'icons/ass/asslizard.png'
	palette = /datum/color_palette/generic_colors
	palette_key = MUTANT_COLOR


/obj/item/bodypart/arm/left/xenohybrid
	icon_greyscale = 'modular_nova/modules/bodyparts/icons/xeno_parts_greyscale.dmi'
	limb_id = SPECIES_XENO
	unarmed_attack_verb = "slash"
	unarmed_attack_effect = ATTACK_EFFECT_CLAW
	unarmed_attack_sound = 'sound/weapons/slash.ogg'
	unarmed_miss_sound = 'sound/weapons/slashmiss.ogg'
	palette = /datum/color_palette/generic_colors
	palette_key = MUTANT_COLOR


/obj/item/bodypart/arm/right/xenohybrid
	icon_greyscale = 'modular_nova/modules/bodyparts/icons/xeno_parts_greyscale.dmi'
	limb_id = SPECIES_XENO
	unarmed_attack_verb = "slash"
	unarmed_attack_effect = ATTACK_EFFECT_CLAW
	unarmed_attack_sound = 'sound/weapons/slash.ogg'
	unarmed_miss_sound = 'sound/weapons/slashmiss.ogg'
	palette = /datum/color_palette/generic_colors
	palette_key = MUTANT_COLOR


/obj/item/bodypart/leg/left/xenohybrid
	icon_greyscale = 'modular_nova/modules/bodyparts/icons/xeno_parts_greyscale.dmi'
	limb_id = SPECIES_XENO
	can_be_digitigrade = TRUE
	digitigrade_id = "digitigrade"
	footprint_sprite = FOOTPRINT_SPRITE_CLAWS
	palette = /datum/color_palette/generic_colors
	palette_key = MUTANT_COLOR
	step_sounds = list(
		'sound/effects/footstep/hardclaw1.ogg',
		'sound/effects/footstep/hardclaw2.ogg',
		'sound/effects/footstep/hardclaw3.ogg',
		'sound/effects/footstep/hardclaw4.ogg',
	)


/obj/item/bodypart/leg/right/xenohybrid
	icon_greyscale = 'modular_nova/modules/bodyparts/icons/xeno_parts_greyscale.dmi'
	limb_id = SPECIES_XENO
	can_be_digitigrade = TRUE
	digitigrade_id = "digitigrade"
	footprint_sprite = FOOTPRINT_SPRITE_CLAWS
	palette = /datum/color_palette/generic_colors
	palette_key = MUTANT_COLOR
	step_sounds = list(
		'sound/effects/footstep/hardclaw1.ogg',
		'sound/effects/footstep/hardclaw2.ogg',
		'sound/effects/footstep/hardclaw3.ogg',
		'sound/effects/footstep/hardclaw4.ogg',
	)
