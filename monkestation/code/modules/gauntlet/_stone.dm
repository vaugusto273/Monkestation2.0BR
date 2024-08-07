//Originally coded for HippieStation by Steamp0rt, shared under the AGPL license.

/obj/item/badmin_stone
    name = "Generic Stone"
    icon = 'icons/obj/infinity.dmi'
    icon_state = "stone"
    w_class = WEIGHT_CLASS_SMALL
    var/stone_type = ""
    var/list/ability_text = list()
    var/list/spells = list()
    var/list/gauntlet_spells = list()
    var/list/spell_types = list()
    var/list/gauntlet_spell_types = list()
    var/mutable_appearance/aura_overlay

/obj/item/badmin_stone/Initialize(mapload)
    . = ..()
    for(var/spell_type in spell_types)
        spells += new spell_type(src)
    for(var/gauntlet_spell_type in gauntlet_spell_types)
        gauntlet_spells += new gauntlet_spell_type(src)
    AddComponent(/datum/component/stationloving, TRUE)
    START_PROCESSING(SSobj, src)
    SSpoints_of_interest.make_point_of_interest(src)
    aura_overlay = mutable_appearance('icons/obj/infinity.dmi', "aura", ABOVE_MOB_LAYER)
    aura_overlay.color = color

/obj/item/badmin_stone/Destroy()
    STOP_PROCESSING(SSobj, src)
    return ..()

/obj/item/badmin_stone/examine(mob/user)
    . = ..()
    . += span_bold("[name]")
    for(var/ability in ability_text)
        . += span_notice("[ability]")

/obj/item/badmin_stone/pickup(mob/user)
    . = ..()
    if(ishuman(user) && HAS_TRAIT(user, TRAIT_CLUMSY))
        to_chat(user, span_danger("\The [src] pulses in your hands, sending a spasm of pain and forcing you to drop it!"))
        addtimer(CALLBACK(src, PROC_REF(ForceDropStone), user), 5 SECONDS)

/obj/item/badmin_stone/proc/ForceDropStone(mob/user)
    user.dropItemToGround(src, TRUE)
    forceMove(get_turf(user))

/obj/item/badmin_stone/proc/GiveAbilities(mob/living/living_mob, gauntlet = FALSE)
    for(var/datum/action/cooldown/spell/spell in spells)
        spell.Grant(living_mob)
    if(gauntlet)
        for(var/datum/action/cooldown/spell/spell in gauntlet_spells)
            spell.Grant(living_mob)

/obj/item/badmin_stone/proc/RemoveAbilities(mob/living/living_mob)
    for(var/datum/action/cooldown/spell/spell in spells + gauntlet_spells)
        spell.Remove(living_mob)

/obj/item/badmin_stone/proc/GiveVisualEffects(mob/living/living_mob)
    living_mob.add_overlay(aura_overlay)

/obj/item/badmin_stone/proc/TakeVisualEffects(mob/living/living_mob)
    living_mob.cut_overlay(aura_overlay)

/obj/item/badmin_stone/proc/GetHolder()
    return isliving(loc) ? loc : null

/obj/item/badmin_stone/proc/GetAuraHolder()
    return recursive_loc_check(src, /mob/living)

/obj/item/badmin_stone/process(delta_time)
    UpdateHolder()

/obj/item/badmin_stone/proc/UpdateHolder()
    if(istype(loc, /obj/item/badmin_gauntlet))
        return
    var/mob/living/new_holder = GetHolder()
    var/mob/living/new_aura_holder = GetAuraHolder()
    if(ishuman(new_aura_holder) && HAS_TRAIT(new_aura_holder, TRAIT_CLUMSY))
        NoPickingMeUp(new_aura_holder)
        return
    if (new_holder != current_holder)
        if(isliving(current_holder))
            RemoveAbilities(current_holder)
        if(isliving(new_holder))
            if(loc == new_holder)
                GiveAbilities(new_holder)
            current_holder = new_holder
        else
            current_holder = null
    if (new_aura_holder != last_holder && isliving(new_aura_holder))
        log_game("[src] has a new holder: [ADMIN_LOOKUPFLW(new_aura_holder)]!")
        message_admins("[src] has a new holder: [key_name(new_aura_holder)]!")
    if (new_aura_holder != aura_holder)
        if(isliving(aura_holder))
            TakeVisualEffects(aura_holder)
            TakeStatusEffect(aura_holder)
        if(isliving(new_aura_holder))
            GiveVisualEffects(new_aura_holder)
            GiveStatusEffect(new_aura_holder)
            aura_holder = new_aura_holder
            last_holder = new_aura_holder
        else
            aura_holder = null

/obj/item/badmin_stone/proc/GiveStatusEffect(mob/living/target)
    if(istype(loc, /obj/item/badmin_gauntlet))
        return
    target.apply_status_effect(/datum/status_effect/badmin_stone, src)

/obj/item/badmin_stone/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
    if(!isliving(user) || istype(target, /obj/item/badmin_gauntlet))
        return
    switch(user.istate)
        if(ISTATE_SECONDARY)
            DisarmEvent(target, user, proximity_flag)
        if(ISTATE_CONTROL)
            GrabEvent(target, user, proximity_flag)
        if(ISTATE_HARM)
            HarmEvent(target, user, proximity_flag)
        else
            HelpEvent(target, user, proximity_flag)

/obj/item/badmin_stone/proc/DisarmEvent(atom/target, mob/living/user, proximity_flag)

/obj/item/badmin_stone/proc/HarmEvent(atom/target, mob/living/user, proximity_flag)

/obj/item/badmin_stone/proc/GrabEvent(atom/target, mob/living/user, proximity_flag)

/obj/item/badmin_stone/proc/HelpEvent(atom/target, mob/living/user, proximity_flag)

/obj/item/badmin_stone/proc/FireProjectile(projectiletype, atom/target, damage = null, fire_sound = 'sound/magic/staff_animation.ogg')
    var/obj/projectile/projectile = new projectiletype(get_turf(src))
    if(damage)
        projectile.damage = damage
    projectile.firer = GetHolder() || src
    projectile.preparePixelProjectile(target, src)
    projectile.fire()
    playsound(src, fire_sound, 50, TRUE)
    new /obj/effect/temp_visual/dir_setting/firing_effect/magic(get_turf(src))

/datum/action/cooldown/spell/pointed/infinity
	button_icon = 'hippiestation/icons/obj/infinity.dmi'
	ranged_mousepointer = 'icons/effects/cult_target.dmi'
	antimagic_flags = NONE
	invocation_type = INVOCATION_NONE
