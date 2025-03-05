//Badass section down here
/datum/uplink_item/robohand
	name = "Johnprata Bundle"
	desc = "Themed after the infamous terrorist(or not), John Prata. You have no reason to fail your objectives with this kit. The gun inside requires your arm to be robotic. \
			It comes with a robotic replacement arm. Wake the fuck up, samurai."
	item = /obj/item/storage/backpack/duffelbag/syndie/loadout/robohand
	cost = 20

/datum/uplink_item/robohand/purchase(mob/user, datum/component/uplink/U)
	. = ..()
	notify_ghosts(message = "[user] has purchased the John Prata bundle, watch him be a badass!", ghost_sound = 'teatroespacial13/modules/johnprata/sounds/wakeup.ogg', source = user) //Everyone needs to know he's a badass
