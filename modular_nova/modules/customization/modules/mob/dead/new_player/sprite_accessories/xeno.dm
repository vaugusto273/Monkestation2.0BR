//TAILS
/datum/sprite_accessory/tails/mammal/wagging/xeno_tail
	icon = 'modular_nova/master_files/icons/mob/sprite_accessory/xeno_parts.dmi'
	name = "Xenomorph Tail"
	icon_state = "xeno"
	recommended_species = list(SPECIES_XENO)

//HEADS
/datum/sprite_accessory/xenohead
	icon = 'modular_nova/master_files/icons/mob/sprite_accessory/xeno_parts.dmi'
	generic = "Caste Head"
	key = "xenohead"
	relevent_layers = list(BODY_ADJ_LAYER)
	genetic = TRUE
	organ_type = /obj/item/organ/external/xenohead

/datum/sprite_accessory/xenohead/none
	name = SPRITE_ACCESSORY_NONE
	icon_state = "none"

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
