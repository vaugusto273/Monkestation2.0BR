/obj/item/disk/disease
	name = "blank GNA disk"
	desc = "A disk for storing the structure of a pathogen's Glycol Nucleic Acid pertaining to a specific symptom."
	var/datum/symptom/effect = null
	var/stage = 1

/obj/item/disk/disease/premade/New()
	name = "blank GNA disk (stage: [stage])"
	effect = new /datum/symptom

/obj/item/disk/disease/update_desc(updates)
	. = ..()
	desc = "[initial(desc)]\n"
	desc += "Strength: [effect.multiplier]\n"
	desc += "Occurrence: [effect.chance]"

/obj/item/disk/disease/immortal
	name = "Longevity Syndrome"
	effect = new /datum/symptom/immortal

/obj/item/disk/disease/oxygen
	name = "Oxygen"
	effect = new /datum/symptom/oxygen

/obj/item/disk/disease/spaceadapt
	name = "Space Adapt"
	effect = new /datum/symptom/spaceadapt

/obj/item/disk/disease/coma
	name = "coma"
	effect = new /datum/symptom/coma

/obj/item/disk/disease/sensory
	name = "sensory restoration"
	effect = new /datum/symptom/sensory_restoration

/obj/item/storage/box/diskvirusbox/PopulateContents()
	new /obj/item/disk/disease/immortal (src)
	new /obj/item/disk/disease/oxygen (src)
	new /obj/item/disk/disease/spaceadapt (src)
	new /obj/item/disk/disease/coma (src)
	new /obj/item/disk/disease/sensory (src)
