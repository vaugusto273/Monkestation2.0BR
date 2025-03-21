/// SMGs
/obj/item/gun/ballistic/automatic/vector
	name = "\improper Kriss USA - TDI Vector"
	desc = "Vector is a series of weapons developed by KRISS USA (formerly known as TDI, Transformational Defense Industries)."
	icon = 'teatroespacial13/modules/ballistic-weapons/icons/guns.dmi'
	icon_state = "vector"
	accepted_magazine_type = /obj/item/ammo_box/magazine/smgm45
	fire_delay = 0.8
	burst_size = 1
	recoil = 5
	wield_recoil = 1
	spread = 5
	w_class = WEIGHT_CLASS_HUGE
	weapon_weight = WEAPON_HEAVY
	bolt_type = BOLT_TYPE_STANDARD
	can_suppress = FALSE
	show_bolt_icon = FALSE
	mag_display = TRUE

	fire_sound = 'teatroespacial13/modules/ballistic-weapons/sound/vector_fire.ogg'

/obj/item/gun/ballistic/automatic/vector/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, fire_delay, allow_akimbo = FALSE)

/obj/item/gun/ballistic/automatic/mp5
	name = "\improper Heckler & Koch MP5 A3"
	desc = "A medium weight, automatic submachine gun"
	icon = 'teatroespacial13/modules/ballistic-weapons/icons/guns.dmi'
	icon_state = "mp5"
	accepted_magazine_type = /obj/item/ammo_box/magazine/smgm9mm
	fire_delay = 0.5
	burst_size = 2
	recoil = 5
	wield_recoil = 1
	spread = 8
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	bolt_type = BOLT_TYPE_STANDARD
	can_suppress = TRUE
	show_bolt_icon = FALSE
	mag_display = TRUE

	suppressed_sound = 'teatroespacial13/modules/ballistic-weapons/sound/mac10_fire_suppressed.wav'
	fire_sound = 'teatroespacial13/modules/ballistic-weapons/sound/smg_dm_shoot.wav'
	rack_sound = 'teatroespacial13/modules/ballistic-weapons/sound/smg_clip_out.wav'
	load_sound = 'teatroespacial13/modules/ballistic-weapons/sound/smg_clip_in.wav'

/obj/item/gun/ballistic/automatic/mp5/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, fire_delay, allow_akimbo = FALSE)


/obj/item/gun/ballistic/automatic/mini_uzi /// Adiciona um novo icone pra uzi pq o antigo era feião -- TEATRO EDIT
	icon = 'teatroespacial13/modules/ballistic-weapons/icons/guns.dmi'
	icon_state = "uzi"

/obj/item/gun/ballistic/automatic/mac10
	name = "\improper Ingram MAC-10"
	desc = "A medium weight, automatic submachine gun, for when you really want someone dead. Uses 9mm rounds."
	icon = 'teatroespacial13/modules/ballistic-weapons/icons/guns.dmi'
	icon_state = "mac10"
	accepted_magazine_type = /obj/item/ammo_box/magazine/smgm45
	fire_delay = 1.5
	burst_size = 2
	recoil = 3
	wield_recoil = 1
	spread = 14.5
	w_class = WEIGHT_CLASS_HUGE
	weapon_weight = WEAPON_MEDIUM
	bolt_type = BOLT_TYPE_OPEN
	can_suppress = TRUE
	show_bolt_icon = FALSE
	mag_display = TRUE

	suppressed_sound = 'teatroespacial13/modules/ballistic-weapons/sound/mac10_fire_suppressed.wav'
	fire_sound = 'teatroespacial13/modules/ballistic-weapons/sound/mac10_fire.ogg'
	vary_fire_sound = FALSE
	rack_sound = 'sound/weapons/gun/pistol/slide_lock.ogg'

/obj/item/gun/ballistic/automatic/mac10/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, fire_delay)

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
	fire_delay = 1.2
	burst_size = 1
	spread = 5
	recoil = 2
	wield_recoil = 1
	bolt_type = BOLT_TYPE_OPEN
	can_suppress = FALSE
	weapon_weight = WEAPON_LIGHT
	show_bolt_icon = FALSE
	mag_display = TRUE

	fire_sound = 'teatroespacial13/modules/ballistic-weapons/sound/skorpion_fire.wav'
	rack_sound = 'sound/weapons/gun/pistol/slide_lock.ogg'

/obj/item/gun/ballistic/automatic/skorpion/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, fire_delay)

/// Shotguns
/obj/item/gun/ballistic/shotgun/automatic/usas12
	name = "\improper Daewoo USAS-12"
	desc = "A automatic shotgun used in the military. an legally 'destructive device'. "
	icon = 'teatroespacial13/modules/ballistic-weapons/icons/guns.dmi'
	icon_state = "usas12"
	burst_size = 1
	fire_delay = 2
	recoil = 8
	wield_recoil = 2
	semi_auto = TRUE
	mag_display = TRUE
	tac_reloads = TRUE
	internal_magazine = FALSE
	pb_knockback = 4
	accepted_magazine_type = /obj/item/ammo_box/magazine/m12g
	can_be_sawn_off = FALSE
	weapon_weight = WEAPON_HEAVY
	w_class = WEIGHT_CLASS_HUGE

	fire_sound = 'teatroespacial13/modules/ballistic-weapons/sound/usas12_fire.ogg'

/obj/item/gun/ballistic/shotgun/spas12
	name = "\improper Franchi SPAS-12"
	desc = "A semi automatic shotgun with tactical furniture and a six-shell capacity underneath."
	icon = 'teatroespacial13/modules/ballistic-weapons/icons/guns.dmi'
	icon_state = "spas12"
	fire_delay = 3
	recoil = 8
	wield_recoil = 1.5
	pb_knockback = 4
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/shot/lethal
	can_be_sawn_off = FALSE
	w_class = WEIGHT_CLASS_HUGE

	rack_sound = 'teatroespacial13/modules/ballistic-weapons/sound/spas_cock.ogg'
	fire_sound = 'teatroespacial13/modules/ballistic-weapons/sound/spas_shoot.wav'


/obj/item/gun/ballistic/shotgun/saiga12
	name = "\improper Saiga 12"
	desc = "Uma espingarda semiautomática russa de calibre 12, modificada para uso com carregadores de caixa. Seu design de ação a gás permite fogo rápido e recarga eficiente."
	icon = 'teatroespacial13/modules/ballistic-weapons/icons/guns.dmi'
	icon_state = "saiga12"
	accepted_magazine_type = /obj/item/ammo_box/advanced/s12gauge
	semi_auto = TRUE
	casing_ejector = TRUE
	bolt_type = BOLT_TYPE_LOCKING
	tac_reloads = TRUE
	can_suppress = FALSE
	weapon_weight = WEAPON_HEAVY
	spawnwithmagazine = TRUE

	recoil = 6
	wield_recoil = 1.3
	fire_delay = 4


/// Rifles

/obj/item/gun/ballistic/automatic/rx7
	name = "\improper MoonTech RX-7"
	desc = "Projetado por Mark 'Market' Black e desenvolvido pela MoonTech Weapon Manufactures em parceria com a Cybersun Industries, o RX-7 é um fuzil de precisão baseado no lendário FN-FAL, mas aprimorado com tecnologia moderna. Seu nome vem do Projeto 'Revenant-X', iniciativa militar para reviver designs clássicos com componentes modulares de última geração. O '7' refere-se à sua versão finalizada após 6 iterações fracassadas, agora equipada com um sistema de recuo compensado e ferrolho flutuante para disparos sustentados em calibres pesados."
	icon_state = "rx7"
	semi_auto = TRUE
	recoil = 4
	wield_recoil = 1
	fire_delay = 1
	tac_reloads = TRUE
	burst_size = 1
	actions_types = list()
	mag_display = TRUE
	empty_indicator = FALSE
	accepted_magazine_type = /obj/item/ammo_box/magazine/c40sol_rifle
	bolt_type = BOLT_TYPE_STANDARD
	show_bolt_icon = FALSE
	spawnwithmagazine = TRUE
	fire_sound = 'teatroespacial13/modules/ballistic-weapons/sound/rx_fire.ogg'

/obj/item/gun/ballistic/automatic/rx7/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, fire_delay)

/obj/item/gun/ballistic/automatic/rx7/examine_more(mob/user)
	. = ..()
	. += span_notice("O RX-7 foi proibido em 12 setores após o 'Incidente da Lua de Gelo'. Seu manual técnico contém a marca d'água 'PROPRIEDADE DA SYNDICATE ARMORY' em 40 idiomas.")
