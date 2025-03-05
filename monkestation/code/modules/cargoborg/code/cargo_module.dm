/atom/movable/screen/robot
	icon = 'monkestation/icons/hud/screen_cyborg.dmi'

// CARGO
/obj/item/robot_model/cargo
	name = "Cargo"
	basic_modules = list(
		/obj/item/stamp,
		/obj/item/stamp/denied,
		/obj/item/pen/cyborg,
		/obj/item/clipboard/cyborg,
		/obj/item/stack/package_wrap/cyborg,
		/obj/item/stack/wrapping_paper/xmas/cyborg,
		/obj/item/assembly/flash/cyborg,
		/obj/item/borg/hydraulic_clamp,
		/obj/item/borg/hydraulic_clamp/mail,
		/obj/item/storage/bag/mail_token_catcher, //monkestation edit
		/obj/item/hand_labeler/cyborg,
		/obj/item/dest_tagger,
		/obj/item/crowbar/cyborg,
		/obj/item/extinguisher,
		/obj/item/universal_scanner,
		/obj/item/cargo_teleporter,
		/obj/item/boxcutter,
	)
	radio_channels = list(RADIO_CHANNEL_SUPPLY)
	emag_modules = list(
		/obj/item/stamp/chameleon,
		/obj/item/borg/paperplane_crossbow,
	)
	hat_offset = 0
	cyborg_base_icon = "cargo"
	model_select_icon = "cargo"
	canDispose = TRUE
	borg_skins = list(
		"Technician" = list(SKIN_ICON_STATE = "cargoborg", SKIN_ICON = CYBORG_ICON_CARGO),
		"Zoomba" = list(SKIN_ICON_STATE = "zoomba_cargo", SKIN_ICON = CYBORG_ICON_CARGO),
		"Kerfus" = list(SKIN_ICON_STATE = "kerfus_cargo", SKIN_LIGHT_KEY = NONE, SKIN_ICON = CYBORG_ICON_CARGO, SKIN_TRAITS = list(TRAIT_CAT)),
		"Drakecargo" = list(SKIN_ICON_STATE = "drakecargo", SKIN_ICON = CYBORG_ICON_DRAKE, "drake" = 1),
		"Mekacargo" = list(SKIN_ICON_STATE = "mekacargo", SKIN_ICON = CYBORG_ICON_TALLCARGO),
		"K4tcargo" = list(SKIN_ICON_STATE = "k4tcargo", SKIN_ICON = CYBORG_ICON_TALLCARGO),
		"K4tcargoalt1" = list(SKIN_ICON_STATE = "k4tcargo_alt1", SKIN_ICON = CYBORG_ICON_TALLCARGO),
		"Fmekacargo" = list(SKIN_ICON_STATE = "fmekacargo", SKIN_ICON = CYBORG_ICON_TALLCARGO),
		"Mmekacargo" = list(SKIN_ICON_STATE = "mmekacargo", SKIN_ICON = CYBORG_ICON_TALLCARGO),
		"Sfmekacargo" = list(SKIN_ICON_STATE = "sfmekacargo", SKIN_ICON = CYBORG_ICON_TALLCARGO),
		"Birdcargo" = list(SKIN_ICON_STATE = "bird_cargo", SKIN_ICON = CYBORG_ICON_NEWCARGO),
	)
