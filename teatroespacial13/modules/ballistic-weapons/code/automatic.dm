/// SMGs
/obj/item/gun/ballistic/automatic/mini_uzi /// Adiciona um novo icone pra uzi pq o antigo era feião -- TEATRO EDIT
	var/side_firing = FALSE
	var/side_fire_delay = 1
	icon = 'teatroespacial13/modules/ballistic-weapons/icons/guns.dmi'
	icon_state = "uzi"

/obj/item/gun/ballistic/automatic/mini_uzi/Initialize(mapload)
    . = ..()
    RegisterSignal(src, COMSIG_MOB_MIDDLECLICKON, PROC_REF(toggle_side_firing))

/obj/item/gun/ballistic/automatic/mini_uzi/proc/toggle_side_firing(mob/user)
    var/obj/item/gun/ballistic/automatic/mini_uzi/other_gun = user.get_inactive_held_item()
    if(!istype(other_gun))
        to_chat(user, span_warning("Você precisa de outra Uzi na outra mão para ativar o modo cruzado!"))
        return

    side_firing = !side_firing
    other_gun.side_firing = side_firing

    to_chat(user, span_notice("Modo de disparo cruzado [side_firing ? "ativado" : "desativado"]."))
    playsound(user, 'sound/weapons/empty.ogg', 50, TRUE)

/obj/item/gun/ballistic/automatic/mini_uzi/do_autofire_shot(datum/source, atom/target, mob/living/shooter, allow_akimbo, params)
    if(side_firing && istype(shooter.get_inactive_held_item(), /obj/item/gun/ballistic/automatic/mini_uzi))
        var/main_hand = (shooter.get_active_held_item() == src)
        var/base_dir = shooter.dir
        var/fire_dirs = list()

        if(base_dir in list(NORTH, SOUTH))
            fire_dirs = main_hand ? list(WEST, EAST) : list(EAST, WEST)
        else
            fire_dirs = main_hand ? list(NORTH, SOUTH) : list(SOUTH, NORTH)

        for(var/dir in fire_dirs)
            var/turf/new_target = get_step(shooter, dir)
            addtimer(CALLBACK(src, PROC_REF(process_delayed_shot), new_target, shooter, params), side_fire_delay)

        return COMPONENT_AUTOFIRE_SHOT_SUCCESS
    return ..()

/obj/item/gun/ballistic/automatic/mini_uzi/proc/process_delayed_shot(turf/target, mob/shooter, params)
    if(QDELETED(src) || QDELETED(shooter) || !can_shoot())
        return
    process_fire(target, shooter, TRUE, params)

/obj/item/gun/ballistic/automatic/mac10
	name = "\improper Ingram MAC-10"
	desc = "A medium weight, automatic submachine gun, for when you really want someone dead. Uses 9mm rounds."
	icon = 'teatroespacial13/modules/ballistic-weapons/icons/guns.dmi'
	icon_state = "mac10"
	accepted_magazine_type = /obj/item/ammo_box/magazine/uzim9mm
	fire_delay = 1
	burst_size = 3

	w_class = WEIGHT_CLASS_HUGE
	weapon_weight = WEAPON_MEDIUM
	bolt_type = BOLT_TYPE_OPEN
	can_suppress = TRUE
	show_bolt_icon = FALSE
	mag_display = TRUE

	suppressed_sound = 'teatroespacial13/modules/ballistic-weapons/sound/mac10_fire_suppressed.wav'
	fire_sound = 'teatroespacial13/modules/ballistic-weapons/sound/mac10_fire.ogg'
	rack_sound = 'sound/weapons/gun/pistol/slide_lock.ogg'

/obj/item/gun/ballistic/automatic/mac10/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.3 SECONDS)

/obj/item/gun/ballistic/automatic/mac10/suppressed/Initialize(mapload)
	. = ..()
	var/obj/item/suppressor/S = new(src)
	install_suppressor(S)

/obj/item/gun/ballistic/automatic/skorpion
	name = "\improper VZ-61 Skorpion"
	desc = "An compact Czech submachine gun/machine pistol manufactured on the 20th Century"
	icon = 'teatroespacial13/modules/ballistic-weapons/icons/guns.dmi'
	icon_state = "skorpion"
	accepted_magazine_type = /obj/item/ammo_box/magazine/uzim9mm
	fire_delay = 2
	burst_size = 2
	bolt_type = BOLT_TYPE_OPEN
	can_suppress = FALSE
	show_bolt_icon = FALSE
	mag_display = TRUE

	fire_sound = 'teatroespacial13/modules/ballistic-weapons/sound/skorpion_fire.wav'
	rack_sound = 'sound/weapons/gun/pistol/slide_lock.ogg'

/obj/item/gun/ballistic/automatic/skorpion/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.6 SECONDS)

/// Shotguns

/*
/obj/item/gun/ballistic/shotgun/saiga12
	name = "\improper Saiga 12"
	desc = "Uma espingarda semiautomática russa de calibre 12, modificada para uso com carregadores de caixa. Seu design de ação a gás permite fogo rápido e recarga eficiente."
	icon = 'teatroespacial13/modules/ballistic-weapons/icons/guns.dmi'
	icon_state = "saiga12"
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/shot/lethal
	semi_auto = TRUE
	casing_ejector = TRUE
	bolt_type = BOLT_TYPE_LOCKING
	tac_reloads = TRUE
	can_suppress = FALSE
	weapon_height = WEAPON_HEAVY
	gun_flags = GUN_SMOKE_PARTICLES
	spawnwithmagazine = TRUE
*/
