/obj/item/gun/ballistic/shotgun/doublebarrel/miner
	name = "double-barreled miner shotgun"
	desc = "A cheap and reliable weapon that was converted to be more useful in harsh conditions, commonly used during mining operations at dangereous planets as self-defense."
	icon = 'teatroespacial13/modules/MiningBallistics/dbarrelnormal.dmi'
	icon_state = "dshotgun"
	pin = /obj/item/firing_pin/wastes

/obj/item/gun/ballistic/automatic/xhihao_smg/no_mag/miner
	name = "Miner smg"
	desc = "Our weapons division mass produced a little bit too much weapons for a possible war that was coming...too bad they signed a peace treaty and we got a big stockpile of those lying around so we developed some new ways for your miners to defend themselves on a wasteland!"
	icon = 'teatroespacial13/modules/MiningBallistics/ballseo_1.dmi'
	icon_state = "ballseo"
	pin = /obj/item/firing_pin/wastes

/obj/item/gun/ballistic/shotgun/bulldog/hunter
	name = "Upgraded Miner Shotgun"
	desc = "Our weapons division got a little bit carried away when developing mining weapons so they just took some spare Bulldog shotguns from failed nuking attempts  and attached some mining stuff to it, neat!"
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
