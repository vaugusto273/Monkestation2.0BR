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
	name = "\improper Miecz submachinegun magazine"
	desc = "A standard size magazine for Miecz submachineguns, holds eighteen rounds."

	icon = 'monkestation/code/modules/blueshift/icons/obj/company_and_or_faction_based/szot_dynamica/ammo.dmi'
	icon_state = "miecz_mag"

	multiple_sprites = AMMO_BOX_FULL_EMPTY

	ammo_type = /obj/item/ammo_casing/c27_54cesarzowa/hunter
	caliber = CALIBER_CESARZOWA
	max_ammo = 18

/datum/orderable_item/consumables/smghunter
	item_path = /obj/item/ammo_box/magazine/miecz/hunter
	desc = "smg magazine for miners!"
	cost_per_order = 400
