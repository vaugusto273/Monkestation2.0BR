/* /obj/item/clothing/head/helmet/toggleable/motorcycle
	name = "motorcycle helmet"
	desc = "you have a dark past, or you're probably stupid enough to have it in a space environment."
	icon = 'teatroespacial13/modules/teatro-loadout/icons/obj/hats.dmi'
	worn_icon = 'teatroespacial13/modules/teatro-loadout/icons/worn/head.dmi'
	icon_state = "motorcycle"
	toggle_message = "You pull the visor down on"
	alt_toggle_message = "You push the visor up on"
	greyscale_colors = "#43484B"
	armor_type = /datum/armor/toggleable_riot
	flags_inv = HIDEEARS|HIDEFACE
	strip_delay = 80
	actions_types = list(/datum/action/item_action/toggle)
	visor_flags_inv = HIDEFACE
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH | PEPPERPROOF
	visor_flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH | PEPPERPROOF
*/

/datum/armor/seva
	laser = 40
	bullet = 40
	bio = 100
	fire = 60
	acid = 100

/datum/action/item_action/seva_voice
	name = "Activate Voice Box"
	desc = "Emits a randomized warcry from the SEVA suit's voice module."
	button_icon = 'teatroespacial13/modules/teatro-loadout/icons/obj/hats.dmi'
	button_icon_state = "seva"
	COOLDOWN_DECLARE(voice_cooldown)

/datum/action/item_action/seva_voice/Trigger(trigger_flags)
	if(!IsAvailable())
		return FALSE
	if(!COOLDOWN_FINISHED(src, voice_cooldown))
		return
	COOLDOWN_START(src, voice_cooldown, 5 SECONDS)

	var/obj/item/clothing/head/hooded/sevasuit/hd
	var/mob/living/user = owner

	if(user.incapacitated())
		to_chat(user, span_warning("You can't use the voice box in this state!"))
		return FALSE

	var/selected_phrase = pick(hd.sound_options)
	var/sound_choice = hd.sound_options[selected_phrase]

	// Executa as ações
	user.say(selected_phrase, forced = "SEVA Voice Box")
	playsound(user, sound_choice, 50, FALSE, pressure_affected = FALSE)
	user.visible_message(
		span_danger("[user]'s SEVA suit booms: [selected_phrase]"),
		span_notice("You activate the voice box: [selected_phrase]")
	)

	return TRUE

/obj/item/clothing/head/hooded/sevasuit
	name = "seva hood"
	desc = "Nerd."
	icon = 'teatroespacial13/modules/teatro-loadout/icons/obj/hats.dmi'
	worn_icon = 'teatroespacial13/modules/teatro-loadout/icons/worn/head.dmi'
	icon_state = "seva"
	armor_type = /datum/armor/seva
	actions_types = list(/datum/action/item_action/seva_voice)

	var/static/list/sound_options = list(
		"UUURAAAAHH!!" = 'teatroespacial13/modules/teatro-loadout/sound/seva/warcry.ogg',
		"Pei pei pei!!" = 'teatroespacial13/modules/teatro-loadout/sound/seva/beng.ogg',
		"Держите меня семеро!!" = 'teatroespacial13/modules/teatro-loadout/sound/seva/nobodycanstopme.ogg'
	)

/obj/item/clothing/suit/hooded/sevasuit
	name = "seva suit"
	desc = "Wearing this outfit makes you want to listen to Russian classical music."
	icon = 'teatroespacial13/modules/teatro-loadout/icons/obj/suit.dmi'
	icon_state = "seva"
	worn_icon = 'teatroespacial13/modules/teatro-loadout/icons/worn/suit.dmi'
	inhand_icon_state = "bio_suit"
	w_class = WEIGHT_CLASS_BULKY
	clothing_flags = THICKMATERIAL
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	allowed = list(/obj/item/tank/internals, /obj/item/reagent_containers/dropper, /obj/item/flashlight/pen, /obj/item/reagent_containers/syringe, /obj/item/reagent_containers/hypospray, /obj/item/reagent_containers/cup/beaker, /obj/item/gun/syringe)
	armor_type = /datum/armor/seva
	hoodtype = /obj/item/clothing/head/hooded/sevasuit
	flags_inv = HIDEGLOVES|HIDEJUMPSUIT
	strip_delay = 20
	equip_delay_other = 20
	resistance_flags = ACID_PROOF | FIRE_PROOF
