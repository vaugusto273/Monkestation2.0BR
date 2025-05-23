//Programs that heal the host in some way.

/datum/nanite_program/regenerative
	name = "Accelerated Regeneration"
	desc = "The nanites boost the host's natural regeneration, increasing their healing speed. Will not consume nanites while the host is unharmed."
	use_rate = 1
	rogue_types = list(/datum/nanite_program/necrotic)

/datum/nanite_program/regenerative/check_conditions()
	if(!host_mob.getBruteLoss() && !host_mob.getFireLoss())
		return FALSE
	if(iscarbon(host_mob))
		var/mob/living/carbon/C = host_mob
		var/list/parts = C.get_damaged_bodyparts(TRUE,TRUE, required_bodytype = BODYTYPE_ORGANIC)
		if(!parts.len)
			return FALSE
	return ..()

/datum/nanite_program/regenerative/active_effect()
	if(iscarbon(host_mob))
		var/mob/living/carbon/C = host_mob
		var/list/parts = C.get_damaged_bodyparts(TRUE,TRUE, required_bodytype = BODYTYPE_ORGANIC)
		if(!parts.len)
			return
		for(var/obj/item/bodypart/L in parts)
			if(L.heal_damage(0.2/parts.len, 0.2/parts.len, null, BODYTYPE_ORGANIC))
				host_mob.update_damage_overlays()
	else
		host_mob.adjustBruteLoss(-0.2, TRUE)
		host_mob.adjustFireLoss(-0.2, TRUE)

/datum/nanite_program/temperature
	name = "Temperature Adjustment"
	desc = "The nanites adjust the host's internal temperature to an ideal level. Will not consume nanites while the host is at a normal body temperature."
	use_rate = 3.5
	rogue_types = list(/datum/nanite_program/skin_decay)

/datum/nanite_program/temperature/check_conditions()
	if(host_mob.bodytemperature > (host_mob.bodytemp_cold_damage_limit) && host_mob.bodytemperature < (host_mob.bodytemp_heat_damage_limit))
		return FALSE
	return ..()

/datum/nanite_program/temperature/active_effect()
	var/target_temp = host_mob.standard_body_temperature
	if(host_mob.bodytemperature > target_temp)
		host_mob.adjust_bodytemperature(-2.5 KELVIN, target_temp)
	else if(host_mob.bodytemperature < (target_temp + 1))
		host_mob.adjust_bodytemperature(2.5 KELVIN, 0, target_temp)

/datum/nanite_program/purging
	name = "Blood Purification"
	desc = "The nanites purge toxins and chemicals from the host's bloodstream. Consumes nanites even if it has no effect."
	use_rate = 1
	rogue_types = list(/datum/nanite_program/suffocating, /datum/nanite_program/necrotic)

/datum/nanite_program/purging/check_conditions()
	. = ..()
	if(!. || !host_mob.reagents)
		return FALSE // No trying to purge simple mobs

/datum/nanite_program/purging/active_effect()
	host_mob.adjustToxLoss(-0.5)
	for(var/datum/reagent/R in host_mob.reagents.reagent_list)
		if (istype(R, /datum/reagent/toxin/radiomagnetic_disruptor))
			continue
		host_mob.reagents.remove_reagent(R.type,1)

/datum/nanite_program/brain_heal
	name = "Neural Regeneration"
	desc = "The nanites fix neural connections in the host's brain, reversing brain damage and minor traumas. Will not consume nanites while it would not have an effect."
	use_rate = 1.5
	rogue_types = list(/datum/nanite_program/brain_decay)

/datum/nanite_program/brain_heal/check_conditions()
	if(host_mob.get_organ_loss(ORGAN_SLOT_BRAIN) > 0)
		return ..()
	if(iscarbon(host_mob))
		var/mob/living/carbon/C = host_mob
		if ( C.has_trauma_type( resilience = TRAUMA_RESILIENCE_BASIC) )
			return ..()
	return FALSE

/datum/nanite_program/brain_heal/active_effect()
	host_mob.adjustOrganLoss(ORGAN_SLOT_BRAIN, -1)
	if(iscarbon(host_mob) && prob(10))
		var/mob/living/carbon/C = host_mob
		C.cure_trauma_type(resilience = TRAUMA_RESILIENCE_BASIC)

/datum/nanite_program/blood_restoring
	name = "Blood Regeneration"
	desc = "The nanites stimulate and boost blood cell production in the host. Will not consume nanites while the host has a safe blood level."
	use_rate = 2
	rogue_types = list(/datum/nanite_program/suffocating)

/datum/nanite_program/blood_restoring/check_conditions()
	if(iscarbon(host_mob))
		var/mob/living/carbon/C = host_mob
		if(C.blood_volume >= BLOOD_VOLUME_SAFE)
			return FALSE
	else
		return FALSE
	return ..()

/datum/nanite_program/blood_restoring/active_effect()
	if(iscarbon(host_mob))
		var/mob/living/carbon/C = host_mob
		C.blood_volume += 2

/datum/nanite_program/repairing
	name = "Mechanical Repair"
	desc = "The nanites fix damage in the host's mechanical limbs. Will not consume nanites while the host's mechanical limbs are undamaged, or while the host has no mechanical limbs."
	use_rate = 0.5
	rogue_types = list(/datum/nanite_program/necrotic)

/datum/nanite_program/repairing/check_conditions()
	if(!host_mob.getBruteLoss() && !host_mob.getFireLoss())
		return FALSE

	if(iscarbon(host_mob))
		var/mob/living/carbon/C = host_mob
		var/list/parts = C.get_damaged_bodyparts(TRUE, TRUE, required_bodytype = BODYTYPE_ROBOTIC)
		if(!parts.len)
			return FALSE
	else
		if(!(host_mob.mob_biotypes & MOB_ROBOTIC))
			return FALSE
	return ..()

/datum/nanite_program/repairing/active_effect(mob/living/M)
	if(iscarbon(host_mob))
		var/mob/living/carbon/C = host_mob
		var/list/parts = C.get_damaged_bodyparts(TRUE, TRUE, required_bodytype = BODYTYPE_ROBOTIC)
		if(!parts.len)
			return
		var/update = FALSE
		for(var/obj/item/bodypart/L in parts)
			if(L.heal_damage(1/parts.len, 1/parts.len, null, BODYTYPE_ROBOTIC)) //much faster than organic healing
				update = TRUE
		if(update)
			host_mob.update_damage_overlays()
	else
		host_mob.adjustBruteLoss(-1, TRUE)
		host_mob.adjustFireLoss(-1, TRUE)

/datum/nanite_program/purging_advanced
	name = "Selective Blood Purification"
	desc = "The nanites purge toxins and dangerous chemicals from the host's bloodstream, while ignoring beneficial chemicals. \
			The added processing power required to analyze the chemicals severely increases the nanite consumption rate. Consumes nanites even if it has no effect."
	use_rate = 2
	rogue_types = list(/datum/nanite_program/suffocating, /datum/nanite_program/necrotic)

/datum/nanite_program/purging_advanced/check_conditions()
	. = ..()
	if(!. || !host_mob.reagents)
		return FALSE

/datum/nanite_program/purging_advanced/active_effect()
	host_mob.adjustToxLoss(-0.8)
	for(var/datum/reagent/toxin/R in host_mob.reagents.reagent_list)
		if (istype(R, /datum/reagent/toxin/radiomagnetic_disruptor))
			continue
		host_mob.reagents.remove_reagent(R.type,1)

/datum/nanite_program/regenerative_advanced
	name = "Bio-Reconstruction"
	desc = "The nanites manually repair and replace organic cells, acting much faster than normal regeneration. \
			However, this program cannot detect the difference between harmed and unharmed, causing it to consume nanites even if it has no effect."
	use_rate = 5.5
	rogue_types = list(/datum/nanite_program/suffocating, /datum/nanite_program/necrotic)

/datum/nanite_program/regenerative_advanced/active_effect()
	if(iscarbon(host_mob))
		var/mob/living/carbon/C = host_mob
		var/list/parts = C.get_damaged_bodyparts(TRUE,TRUE, required_bodytype = BODYTYPE_ORGANIC)
		if(!parts.len)
			return
		var/update = FALSE
		for(var/obj/item/bodypart/L in parts)
			if(L.heal_damage(2/parts.len, 2/parts.len, null, BODYTYPE_ORGANIC))
				update = TRUE
		if(update)
			host_mob.update_damage_overlays()
	else
		host_mob.adjustBruteLoss(-1, TRUE)
		host_mob.adjustFireLoss(-1, TRUE)

/datum/nanite_program/brain_heal_advanced
	name = "Neural Reimaging"
	desc = "The nanites are able to backup and restore the host's neural connections, potentially replacing entire chunks of missing or damaged brain matter. Consumes nanites even if it has no effect."
	use_rate = 3
	rogue_types = list(/datum/nanite_program/brain_decay, /datum/nanite_program/brain_misfire)

/datum/nanite_program/brain_heal_advanced/active_effect()
	host_mob.adjustOrganLoss(ORGAN_SLOT_BRAIN, -2)
	if(iscarbon(host_mob) && prob(10))
		var/mob/living/carbon/C = host_mob
		C.cure_trauma_type(resilience = TRAUMA_RESILIENCE_LOBOTOMY)

/datum/nanite_program/defib
	name = "Defibrillation"
	desc = "The nanites shock the host's heart when triggered, bringing them back to life if the body can sustain it."
	can_trigger = TRUE
	trigger_cost = 25
	trigger_cooldown = 120
	rogue_types = list(/datum/nanite_program/shocking)
	COOLDOWN_DECLARE(ghost_notify_cooldown)

/datum/nanite_program/defib/on_trigger(comm_message)
	if(COOLDOWN_FINISHED(src, ghost_notify_cooldown) && check_revivable())
		host_mob.notify_ghost_cloning("Your heart is being defibrillated by nanites. Re-enter your corpse if you want to be revived!")
		COOLDOWN_START(src, ghost_notify_cooldown, 1 MINUTES)
	addtimer(CALLBACK(src, PROC_REF(zap)), 5 SECONDS)

/datum/nanite_program/defib/proc/check_revivable()
	if(!iscarbon(host_mob)) //nonstandard biology
		return FALSE
	var/mob/living/carbon/C = host_mob
	if(C.get_ghost())
		return FALSE
	return C.can_defib() == DEFIB_POSSIBLE

/datum/nanite_program/defib/proc/zap()
	var/mob/living/carbon/C = host_mob
	playsound(C, 'sound/machines/defib_charge.ogg', 50, FALSE)
	sleep(3 SECONDS)
	playsound(C, 'sound/machines/defib_zap.ogg', 50, FALSE)
	if(check_revivable())
		playsound(C, 'sound/machines/defib_success.ogg', 50, FALSE)
		C.set_heartattack(FALSE)
		C.revive()
		C.emote("gasp")
		C.set_jitter_if_lower(10 SECONDS)
		SEND_SIGNAL(C, COMSIG_LIVING_MINOR_SHOCK)
		log_game("[C] has been successfully defibrillated by nanites.")
	else
		playsound(C, 'sound/machines/defib_failed.ogg', 50, FALSE)


//heard you like smoking
/datum/nanite_program/oxygen_rush
	name = "Alveolic Deoxidation"
	desc = "The nanites deoxidze the carbon dioxide carried within the blood inside of the host's lungs through rapid electrical stimulus. \
			However, this process is extremely dangerous, leaving carbon deposits within the lungs as well as causing severe organ damage."
	use_rate = 10
	rogue_types = list(/datum/nanite_program/suffocating)

	COOLDOWN_DECLARE(warning_cooldown)
	COOLDOWN_DECLARE(ending_cooldown)

/datum/nanite_program/oxygen_rush/check_conditions()
	var/obj/item/organ/internal/lungs/lungs = host_mob.get_organ_slot(ORGAN_SLOT_LUNGS)
	if(!lungs)
		return FALSE
	return ..() && !(lungs.organ_flags & ORGAN_FAILING)

/datum/nanite_program/oxygen_rush/active_effect()
	host_mob.adjustOxyLoss(-10, TRUE)
	host_mob.adjustOrganLoss(ORGAN_SLOT_LUNGS, 4)
	var/mob/living/carbon/carbon_host = host_mob
	if(prob(8) && istype(carbon_host))
		to_chat(host_mob, span_userdanger("You feel a sudden flood of pain in your chest!"))
		carbon_host.vomit(blood = TRUE, harm = FALSE)

/datum/nanite_program/oxygen_rush/enable_passive_effect()
	. = ..()
	if(COOLDOWN_FINISHED(src, warning_cooldown))
		to_chat(host_mob, span_warning("You feel a hellish burning in your chest!"))
		COOLDOWN_START(src, warning_cooldown, 10 SECONDS)

/datum/nanite_program/oxygen_rush/disable_passive_effect()
	. = ..()
	if(COOLDOWN_FINISHED(src, ending_cooldown))
		to_chat(host_mob, span_notice("The fire in your chest subsides."))
		COOLDOWN_START(src, ending_cooldown, 10 SECONDS)
