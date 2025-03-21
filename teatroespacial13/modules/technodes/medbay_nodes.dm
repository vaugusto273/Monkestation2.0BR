/datum/techweb_node/adv_biotech
	design_ids = list(
		"crewpinpointer",
		"vitals_monitor_advanced",
		"defibrillator_compact",
		"harvester",
		"healthanalyzer_advanced",
		"holobarrier_med",
		"limbgrower",
		"meta_beaker",
		"ph_meter",
		"piercesyringe",
		"plasmarefiller",
		"smoke_machine",
		"sleeper",
		"surgical_gloves", //Monkestation Edit
		"seva_suit"
	)

/datum/design/sevasuit
	name = "SEVA Suit"
	desc = "Advanced biosuit"
	id =  "seva_suit"
	build_path = /obj/item/clothing/suit/hooded/sevasuit
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 250, /datum/material/gold = 1000, /datum/material/diamond = 100)
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_MEDICAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL
