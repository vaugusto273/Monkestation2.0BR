/obj/item/ammo_box/advanced/s12gauge/hunter/miner
    name = "hunter slug ammo box"
    desc = "A box of hunter slug shells. These shotgun slugs excel at damaging the local fauna."
    icon_state = "hunter"
    ammo_type = /obj/item/ammo_casing/shotgun/hunter
    max_ammo = 50

/datum/orderable_item/consumables/hunterslug
	item_path = /obj/item/ammo_box/advanced/s12gauge/hunter/miner
	desc = "Hunter slug shell"
	cost_per_order = 350

/obj/item/ammo_box/magazine/miecz/hunter
	name = "smg hunter magazine"
	desc = "A standard size magazine for Miecz submachineguns."

	icon = 'monkestation/code/modules/blueshift/icons/obj/company_and_or_faction_based/szot_dynamica/ammo.dmi'
	icon_state = "miecz_mag"

	multiple_sprites = AMMO_BOX_FULL_EMPTY

	ammo_type = /obj/item/ammo_casing/c27_54cesarzowa/hunter
	caliber = CALIBER_CESARZOWA
	max_ammo = 32

/datum/orderable_item/consumables/smghunter
	item_path = /obj/item/ammo_box/magazine/miecz/hunter
	desc = "smg magazine for miners!"
	cost_per_order = 400

/obj/item/ammo_box/magazine/m12g/hunter
	name = "shotgun magazine (hunter slugs)"
	desc = "A drum magazine."
	icon_state = "m12gb"
	base_icon_state = "m12gb"
	ammo_type = /obj/item/ammo_casing/shotgun/hunter
	caliber = CALIBER_SHOTGUN
	max_ammo = 8

/datum/orderable_item/mining/upgradedshotgunminer
	item_path = /obj/item/gun/ballistic/shotgun/bulldog/hunter
	desc = "Upgraded Shotgun"
	cost_per_order = 5000

/datum/orderable_item/consumables/m12ghunter
	item_path = /obj/item/ammo_box/magazine/m12g/hunter
	desc = "Magazine for upgraded shotgun"
	cost_per_order = 850
