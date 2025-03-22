//TAILS
/datum/sprite_accessory/tails/tail_xeno
	icon = 'modular_nova/master_files/icons/mob/sprite_accessory/xeno_parts.dmi'
	key = "xenohybrid_tail"
	recommended_species = list(SPECIES_XENO)
	organ_type = /obj/item/organ/external/tail/tail_xeno

/datum/sprite_accessory/tails/tail_xeno/xeno
	name = "Xeno"
	icon_state = "xeno"

// /datum/sprite_accessory/tails/wagging/tail_xeno
// 	icon = 'modular_nova/master_files/icons/mob/sprite_accessory/xeno_parts.dmi'
// 	name = "Xenomorph Tail"
// 	icon_state = "xeno"

//HEADS
/datum/sprite_accessory/xenohead
	icon = 'modular_nova/master_files/icons/mob/sprite_accessory/xeno_parts.dmi'
	generic = "Caste Head"
	key = "xenohead"
	relevent_layers = list(BODY_ADJ_LAYER)
	genetic = TRUE
	organ_type = /obj/item/organ/external/xenohead

/datum/sprite_accessory/xenohead/standard
	name = "Standard"
	icon_state = "standard"

/datum/sprite_accessory/xenohead/royal
	name = "Royal"
	icon_state = "royal"

/datum/sprite_accessory/xenohead/net
	name = "Nethead"
	icon_state = "net"

/datum/sprite_accessory/xenohead/warrior
	name = "Warrior"
	icon_state = "warrior"


//DORSAL

/datum/sprite_accessory/xenodorsal
	icon = 'modular_nova/master_files/icons/mob/sprite_accessory/xeno_parts.dmi'
	generic = "Caste Head"
	key = "xenodorsal"
	relevent_layers = list(BODY_ADJ_LAYER)
	genetic = TRUE
	organ_type = /obj/item/organ/external/xenodorsal
	palette = /datum/color_palette/generic_colors
	palette_key = MUTANT_COLOR

/datum/sprite_accessory/xenodorsal/standard
	name = "Standard"
	icon_state = "standard"

/datum/sprite_accessory/xenodorsal/royal
	name = "Royal"
	icon_state = "royal"

/datum/sprite_accessory/xenodorsal/down
	name = "downdorsal"
	icon_state = "down"
