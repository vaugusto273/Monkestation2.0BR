/mob/living/carbon/human/species/arachnid
    race = /datum/species/arachnid

/mob/living/carbon/human/species/ipc
    race = /datum/species/ipc

/mob/living/carbon/human/species/werewolf
    race = /datum/species/werewolf

/mob/living/carbon/human/species/ornithid
    race = /datum/species/ornithid

/mob/living/carbon/human/species/moth/tundra
	race = /datum/species/moth/tundra

/mob/living/carbon/human/species/ipc_empty
	parent_type = /mob/living/carbon/human/species/ipc
	// Override New() to remove organs and limbs
	New()
		..()
		// Remove all organs
		for (var/obj/item/organ/internal/O in organs_slot)
			qdel(O)

		for (var/obj/item/organ/internal/M in organs)
			qdel(M)
		// Remove all limbs
		for (var/obj/item/bodypart/L in bodyparts)
			if (L.body_part == CHEST)
				continue
			qdel(L)
		underwear = "Nude"
		facial_hairstyle = "Shaved"
		hairstyle = "Bald"
		update_body()
		set_stat(DEAD)
		timeofdeath = world.time + 100000000000000000000
