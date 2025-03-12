/obj/item/storage/box/shotminer/PopulateContents()
	new /obj/item/ammo_box/advanced/s12gauge/hunter/miner(src)
	new /obj/item/gun/ballistic/shotgun/doublebarrel/miner(src)
	new /obj/item/storage/belt/bandolier(src)

/datum/voucher_set/mining/doublebarrelminer
    name = "Shotgun Miner Kit"
    description = "Clearly made for shooting monsters!"
    icon = 'icons/obj/weapons/guns/ballistic.dmi'
    icon_state = "dshotgun"
    set_items = list(
		/obj/item/storage/box/shotminer
		)
