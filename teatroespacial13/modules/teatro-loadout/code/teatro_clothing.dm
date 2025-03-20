/obj/item/clothing/head/helmet/toggleable/motorcycle
	name = "motorcycle helmet"
	desc = "you have a dark past, or you're probably stupid enough to have it in a space environment."
	icon = 'teatroespacial13/modules/teatro-loadout/icons/obj/hats.dmi'
	worn_icon = 'teatroespacial13/modules/teatro-loadout/icons/worn/head.dmi'
	icon_state = "motorcycle"
	toggle_message = "You pull the visor down on"
	alt_toggle_message = "You push the visor up on"
	greyscale_colors = "#43484B"
	armor_type = /datum/armor/toggleable_riot
	flags_inv = HIDEEARS|HIDEFACE
	strip_delay = 80
	actions_types = list(/datum/action/item_action/toggle)
	visor_flags_inv = HIDEFACE
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH | PEPPERPROOF
	visor_flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH | PEPPERPROOF
