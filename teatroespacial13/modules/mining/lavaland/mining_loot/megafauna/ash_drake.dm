/obj/item/drake_remains
	name = "drake remains"
	desc = "The gathered remains of a drake. It still crackles with heat, and smells distinctly of brimstone."
	icon = 'icons/obj/clothing/head/helmet.dmi'
	icon_state = "dragon"

/obj/item/drake_remains/Initialize(mapload)
	. = ..()
	add_shared_particles(/particles/bonfire)

/obj/item/drake_remains/Destroy(force)
	remove_shared_particles(/particles/bonfire)
	return ..()
