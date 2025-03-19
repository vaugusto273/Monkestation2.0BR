//////////// PORTA O SISTEMA DE BACKUP DO BUBBER ///////////////////////////
/obj/item/clothing/mask/gas/sechailer/swat
	actions_types = list(/datum/action/item_action/backup, /datum/action/item_action/halt)
	COOLDOWN_DECLARE(backup_cooldown)

/obj/item/clothing/mask/gas/sechailer
	var/obj/item/radio/intercom/radio
	actions_types = list(/datum/action/item_action/backup, /datum/action/item_action/halt, /datum/action/item_action/adjust)
	COOLDOWN_DECLARE(backup_cooldown2)

/obj/item/clothing/mask/gas/sechailer/ui_action_click(mob/user, action)
	if(istype(action, /datum/action/item_action/halt))
		halt()
	else if(istype(action, /datum/action/item_action/backup))
		backup()
	else
		adjustmask(user)

/datum/action/item_action/backup
	name = "Request Backup!"

/obj/item/clothing/mask/gas/sechailer/Initialize(mapload)
	. = ..()
	radio = new(src)
	radio.set_frequency(FREQ_SECURITY)
	radio.set_listening(FALSE)
	radio.recalculateChannels()

/obj/item/clothing/mask/gas/sechailer/proc/backup()
	var/turf/turf_location = get_turf(src)
	var/location = get_area_name(turf_location)

	if (!isliving(usr) || !can_use(usr))
		return
	if (!COOLDOWN_FINISHED(src, backup_cooldown2))
		usr.balloon_alert(usr, "On Cooldown!")
		return
	if (!safety)
		usr.balloon_alert(usr, "Backup Malfunctioning!")
		return
	if (!is_station_level(turf_location.z))
		usr.balloon_alert(usr, "Out of Range!")
		return

	COOLDOWN_START(src, backup_cooldown2, 1 MINUTES)
	radio.talk_into(usr, "REQUISITANDO REFORÇOS EM: [location]!", RADIO_CHANNEL_SECURITY)
	usr.audible_message("<font color='red' size='5'><b>REFORÇO REQUISITADO!</b></font>")
	usr.balloon_alert_to_viewers("Backup Requested!", "Backup Requested!", 7)
	log_combat(usr, src, "chamou por reforço!")
	playsound(usr, 'sound/misc/whistle.ogg', 50, FALSE, 4)



////////////// MÁSCARA ATP //////////////////////
/obj/item/clothing/mask/gas/atp
	name = "\improper A.T.P. engineer mask"
	desc = "Not rated for bullets, stop trying. Also not rated for killer clowns with stop signs."
	icon = 'monkestation/icons/obj/clothing/masks.dmi'
	worn_icon = 'monkestation/icons/mob/clothing/mask.dmi'
	icon_state = "atp_mask"
	flags_inv = HIDEFACE|HIDEFACIALHAIR|HIDESNOUT

	var/static/list/atp_voicelines = list(
		"Stay Alert" = 'teatroespacial13/modules/atpmask/sound/atpmask/stayalert.ogg',
		"Hostile" = 'teatroespacial13/modules/atpmask/sound/atpmask/hostile.ogg',
		"Check In" = 'teatroespacial13/modules/atpmask/sound/atpmask/checkin.ogg'
	)

//	inhand_icon_state = "gas_alt"
	modifies_speech = TRUE
	COOLDOWN_DECLARE(spamcheck)

/obj/item/clothing/mask/gas/atp/equipped(mob/living/equipee, slot)
	. = ..()
	if(slot & ITEM_SLOT_MASK)
		RegisterSignal(equipee, COMSIG_MOB_POINTED, PROC_REF(point_handler))
		RegisterSignal(equipee, COMSIG_MOB_UNEQUIPPED_ITEM, PROC_REF(item_removed))
		RegisterSignal(equipee, COMSIG_LIVING_DEATH, PROC_REF(death_sound))
		if(istype(equipee))
			equipee.bubble_icon = "atp"

/obj/item/clothing/mask/gas/atp/proc/item_removed(mob/living/wearer, obj/item/dropped_item)
	SIGNAL_HANDLER
	if(dropped_item != src)
		return
	UnregisterSignal(wearer, list(COMSIG_MOB_UNEQUIPPED_ITEM, COMSIG_LIVING_DEATH, COMSIG_MOB_POINTED))
	if(istype(wearer))
		wearer.bubble_icon = initial(wearer.bubble_icon)


/obj/item/clothing/mask/gas/atp/handle_speech(datum/source, list/speech_args)
	var/full_message = speech_args[SPEECH_MESSAGE]
	for(var/lines in atp_voicelines)
		if(findtext(full_message, lines))
			playsound(src, atp_voicelines[lines], 35, FALSE, SHORT_RANGE_SOUND_EXTRARANGE-2, falloff_exponent = 0, ignore_walls = FALSE, use_reverb = FALSE)
			return // apenas toca uma vez

	if(COOLDOWN_FINISHED(src, spamcheck))
		var/speaksound = pick('monkestation/sound/items/atp_speak1.ogg', 'monkestation/sound/items/atp_speak2.ogg', 'monkestation/sound/items/atp_speak3.ogg', 'monkestation/sound/items/atp_speak4.ogg', 'monkestation/sound/items/atp_speak5.ogg')
		playsound(src, speaksound, 35, FALSE, SHORT_RANGE_SOUND_EXTRARANGE-2, falloff_exponent = 0, ignore_walls = FALSE, use_reverb = FALSE)
		COOLDOWN_START(src, spamcheck, 3 SECONDS)

/obj/item/clothing/mask/gas/atp/proc/death_sound(mob/living/equipee)
	SIGNAL_HANDLER
	playsound(src, 'monkestation/sound/items/atp_death_sound.ogg', 20, FALSE, SHORT_RANGE_SOUND_EXTRARANGE, ignore_walls = FALSE)

/obj/item/clothing/mask/gas/atp/proc/point_handler(mob/living/pointing_mob, mob/pointed_at)
	if(!COOLDOWN_FINISHED(src, spamcheck))
		return

	if(!isliving(pointed_at))
		return

	if(pointing_mob == pointed_at)
		return

	pointing_mob.say("HOSTILE!!")
	playsound(src, atp_voicelines[2], 35, FALSE, SHORT_RANGE_SOUND_EXTRARANGE-2, falloff_exponent = 0, ignore_walls = FALSE, use_reverb = FALSE)
	pointed_at.do_alert_animation()
	SIGNAL_HANDLER


////////////////////// MÁSCARA DO TRICKY ////////////////////////////
