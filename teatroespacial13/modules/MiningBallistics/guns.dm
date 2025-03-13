/obj/item/gun/ballistic/shotgun/doublebarrel/miner
	name = "double-barreled miner shotgun"
	desc = "A true classic."
	pin = /obj/item/firing_pin/wastes

/obj/item/gun/ballistic/automatic/xhihao_smg/no_mag/miner
	name = "Miner smg"
	desc = "To do"
	pin = /obj/item/firing_pin/wastes

/obj/item/gun/ballistic/shotgun/bulldog/hunter
	name = "Upgraded Miner Shotgun"
	desc = "To do"
	icon = 'teatroespacial13/modules/MiningBallistics/bullminer.dmi'
	icon_state = "bulldog"
	inhand_icon_state = "bulldog"
	worn_icon_state = "cshotgun"
	lefthand_file = 'icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/guns_righthand.dmi'
	inhand_x_dimension = 32
	inhand_y_dimension = 32
	weapon_weight = WEAPON_MEDIUM
	accepted_magazine_type = /obj/item/ammo_box/magazine/m12g/hunter
	can_suppress = FALSE
	burst_size = 1
	fire_delay = 0
	pin = /obj/item/firing_pin/wastes
	fire_sound = 'sound/weapons/gun/shotgun/shot_alt.ogg'
	actions_types = list()
	mag_display = TRUE
	empty_indicator = TRUE
	empty_alarm = TRUE
	special_mags = TRUE
	mag_display_ammo = TRUE
	semi_auto = TRUE
	internal_magazine = FALSE
	tac_reloads = TRUE
