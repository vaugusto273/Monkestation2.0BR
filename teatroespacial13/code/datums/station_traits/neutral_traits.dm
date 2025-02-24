/datum/station_trait/announcement_orchestrator
	name = "O orchestrator"
	trait_type = STATION_TRAIT_NEUTRAL
	weight = 10
	show_in_report = TRUE
	report_message = "irá narrar sua estação."
	blacklist = list(/datum/station_trait/announcement_medbot,
	/datum/station_trait/birthday,
	/datum/station_trait/announcement_intern,
	/datum/station_trait/announcement_dagoth,
	/datum/station_trait/announcement_duke
	)

/datum/station_trait/announcement_orchestrator/New()
	. = ..()
	SSstation.announcer = /datum/centcom_announcer/orchestrator
