/* ATIVE ISTO SOMENTE EM CASO DE FAZER FUNNY FUNNY no_airlocks
/datum/station_trait/no_airlocks
	name = "No more airlocks"
	trait_type = STATION_TRAIT_NEGATIVE
	weight = 0
	show_in_report = TRUE
	report_message = "Parece que a última tripulação quis atrapalhar a vida de vocês, airlocks viraram paredes..."
	trait_to_give = STATION_TRAIT_NO_AIRLOCKS
	force = TRUE

/datum/station_trait/no_airlocks/on_round_start()
	. = ..()
	for(var/obj/machinery/door/airlock/A in world)
		// Skip external, shuttle, and hatch airlocks
		if(istype(A, /obj/machinery/door/airlock/external) ||
		   istype(A, /obj/machinery/door/airlock/shuttle) ||
		   istype(A, /obj/machinery/door/airlock/hatch))
			continue

		var/turf/T = get_turf(A)
		if(T)
			qdel(A)
			var/obj/structure/falsewall/FW = new /obj/structure/falsewall(T)
			FW.update_icon(ALL) // Update the false wall icon
*/
