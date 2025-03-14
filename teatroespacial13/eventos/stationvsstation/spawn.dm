/obj/effect/step_trigger/armbandgiver
	var/obj/armband

/obj/effect/step_trigger/armbandgiver/syndicate
	armband = /obj/item/clothing/accessory/armband

/obj/effect/step_trigger/armbandgiver/nanotrasen
	armband = /obj/item/clothing/accessory/armband/deputy/lopland/nonsec

/obj/effect/step_trigger/armbandgiver/Trigger(atom/movable/A)
	if(armband)
		var/mob/living/carbon/human/H = A
		var/obj/item/clothing/under/uniform = H.w_uniform

		var/obj/item/clothing/accessory/new_armband = new armband()

		if(uniform && !uniform.attach_accessory(new_armband, H))
			qdel(new_armband)
			return
