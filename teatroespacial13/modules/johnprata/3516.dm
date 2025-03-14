#define CALIBRE_14MM "14mm"

/////////////////////////////
// Malorian Arms 3516 14MM //
//     If you have this,   //
//     you're a badass.    //
/////////////////////////////

//This pistol can only be fired if you have a robotic arm, it checks the arm you are firing
/obj/item/gun/ballistic/automatic/pistol/j3516
	name = "Malorian Arms 3516"
	desc = "The Malorian Arms 3516 is a 14mm heavy pistol, sporting a titanium frame and unique wooden grip. A custom Dyna-porting and \
	direct integral cyber-interlink means only someone with a cyberarm and smartgun link can take full advantage of the pistol's features."
	icon = 'teatroespacial13/modules/johnprata/icons/3516.dmi'
	icon_state = "3516"
	w_class = WEIGHT_CLASS_NORMAL
	accepted_magazine_type = /obj/item/ammo_box/magazine/m14mm
	can_suppress = FALSE
	fire_sound = 'teatroespacial13/modules/johnprata/sounds/fire2.ogg'
	load_sound = 'teatroespacial13/modules/johnprata/sounds/reload.ogg'
	load_empty_sound = 'teatroespacial13/modules/johnprata/sounds/reload.ogg'
	eject_sound = 'teatroespacial13/modules/johnprata/sounds/release.ogg'
	eject_empty_sound = 'teatroespacial13/modules/johnprata/sounds/release.ogg'
	vary_fire_sound = FALSE
	rack_sound = 'teatroespacial13/modules/johnprata/sounds/slide.ogg'
	fire_sound_volume = 100
	bolt_wording = "fuckin' slide"
	pin = /obj/item/firing_pin/dna

//Gun actions

/obj/item/gun/ballistic/automatic/pistol/j3516/insert_magazine(mob/user, obj/item/ammo_box/magazine/AM, display_message)
	animate(src, transform = turn(matrix(), 120), time = 2, loop = 1) //Le johnny robohand woosh woosh twirl
	animate(transform = turn(matrix(), 240), time = 2)
	animate(transform = null, time = 2)
	drop_bolt(user) //This gun automatically drops the bolt
	rack(user)
	. = ..()

/obj/item/gun/ballistic/automatic/pistol/j3516/eject_magazine(mob/user, display_message, obj/item/ammo_box/magazine/tac_load)
	if(bolt_type == BOLT_TYPE_OPEN)
		chambered = null
	if (magazine.ammo_count())
		playsound(src, eject_sound, eject_sound_volume, eject_sound_volume) //This is why we've copied this proc, it should play the eject sound when ejecting.
	else
		playsound(src, eject_empty_sound, eject_sound_volume, eject_sound_volume)
	magazine.forceMove(drop_location())
	var/obj/item/ammo_box/magazine/old_mag = magazine
	if (tac_load)
		if (insert_magazine(user, tac_load, FALSE))
			to_chat(user, "<span class='notice'>You perform an elite tactical reload on \the [src].</span>")
		else
			to_chat(user, "<span class='warning'>You dropped the old [magazine_wording], but the new one doesn't fit. How embarassing.</span>")
			magazine = null
	else
		magazine = null
	user.put_in_hands(old_mag)
	old_mag.update_appearance()
	if (display_message)
		to_chat(user, "<span class='notice'>You pull the [magazine_wording] out of \the [src].</span>")
	update_appearance()
	animate(src, transform = turn(matrix(), 120), time = 2, loop = 1) //Le johnny robohand again
	animate(transform = turn(matrix(), 240), time = 2)
	animate(transform = null, time = 2)

//Magazine stuff

/obj/item/ammo_box/magazine/m14mm
	name = "pistol magazine (14mm)"
	icon = 'teatroespacial13/modules/johnprata/icons/3516_mag.dmi'
	icon_state = "14mm"
	base_icon_state = "14mm"
	ammo_type = /obj/item/ammo_casing/c14mm
	caliber = CALIBRE_14MM
	max_ammo = 10
	multiple_sprites = AMMO_BOX_FULL_EMPTY

/obj/item/ammo_casing/c14mm
	name = "14mm bullet casing"
	desc = "A 14mm bullet casing. Badass."
	caliber = CALIBRE_14MM
	projectile_type = /obj/projectile/bullet/c14mm

/obj/projectile/bullet/c14mm
	name = "14mm bullet"
	damage = 60
	embedding = list(embed_chance=90, fall_chance=3, jostle_chance=4, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.4, pain_mult=5, jostle_pain_mult=9, rip_time=10)
	dismemberment = 50
	pierces = 1
	projectile_piercing = PASSCLOSEDTURF|PASSGRILLE|PASSGLASS
