SUBSYSTEM_DEF(credits)
	name = "Credits Screen Storage"
	flags = SS_NO_FIRE
	init_order = INIT_ORDER_CREDITS

	var/director = "Um macaco que achamos na rua"
	var/star = ""
	var/ss = ""
	var/list/disclaimers = list()
	var/list/datum/episode_name/episode_names = list()

	var/episode_name = ""
	var/episode_reason = ""
	var/producers_string = ""
	var/list/episode_string
	var/list/disclaimers_string
	var/list/cast_string

	//If any of the following five are modified, the episode is considered "not a rerun".
	var/customized_name = ""
	var/customized_star = ""
	var/customized_ss = ""
	var/rare_episode_name = FALSE
	var/theme = "NT"

	var/js_args = list()

	var/list/contributer_pref_images = list()
	var/list/admin_pref_images = list()
	var/list/major_event_icons = list()
	var/list/contributors = list()

/datum/controller/subsystem/credits/Initialize()
	load_contributors()
	generate_pref_images()
	return SS_INIT_SUCCESS

/datum/controller/subsystem/credits/proc/load_contributors()
	contributors = list()
	var/list/lines = world.file2list("[global.config.directory]/contributors.txt")
	for(var/line in lines)
		if(!length(line))
			continue
		if(findtextEx(line, "#", 1, 2))
			continue
		contributors |= line

/datum/controller/subsystem/credits/proc/draft()
	draft_episode_names()
	draft_disclaimers()
	draft_caststring()

/datum/controller/subsystem/credits/proc/finalize()
	finalize_name()
	finalize_episodestring()
	finalize_disclaimerstring()

/datum/controller/subsystem/credits/proc/generate_pref_images()

	for(var/ckey in contributors)
		var/datum/client_interface/interface = new(ckey)
		var/datum/preferences/mocked = new(interface)

		var/atom/movable/screen/map_view/char_preview/appearance = new(null, mocked)
		appearance.update_body()
		appearance.maptext_width = 120
		appearance.maptext_y = -8
		appearance.maptext_x = -42
		appearance.maptext = "<center>[ckey]</center>"
		contributer_pref_images += appearance

	for(var/ckey in GLOB.admin_datums)
		var/datum/client_interface/interface = new(ckey(ckey))
		var/datum/preferences/mocked = new(interface)

		var/atom/movable/screen/map_view/char_preview/appearance = new(null, mocked)
		appearance.update_body()
		appearance.maptext_width = 120
		appearance.maptext_x = -42
		appearance.maptext_y = -8
		appearance.maptext = "<center>[ckey]</center>"
		admin_pref_images += appearance

/datum/controller/subsystem/credits/proc/draft_star()
	var/mob/living/carbon/human/most_talked
	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(!H.ckey || H.stat == DEAD)
			continue
		if(!most_talked || H.talkcount > most_talked.talkcount)
			most_talked = H
	star = thebigstar(most_talked)


/datum/controller/subsystem/credits/proc/finalize_name()
	if(customized_name)
		episode_name = customized_name
		return
	var/list/drafted_names = list()
	var/list/name_reasons = list()
	var/list/is_rare_assoc_list = list()
	for(var/datum/episode_name/N as anything in episode_names)
		drafted_names["[N.thename]"] = N.weight
		name_reasons["[N.thename]"] = N.reason
		is_rare_assoc_list["[N.thename]"] = N.rare
	episode_name = pick_weight(drafted_names)
	episode_reason = name_reasons[episode_name]
	if(is_rare_assoc_list[episode_name] == TRUE)
		rare_episode_name = TRUE

/datum/controller/subsystem/credits/proc/finalize_episodestring()
	var/season = time2text(world.timeofday,"YY")
	var/episodenum = GLOB.round_id || 1
	episode_string = list("<center>TEMPORADA [season] EPISODIO [episodenum]</center>")
	episode_string += "<center>[episode_name]</center>"

/datum/controller/subsystem/credits/proc/finalize_disclaimerstring()
	disclaimers_string =  list()
	for(var/disclaimer in disclaimers)
		disclaimers_string += "<center>[disclaimer]</center>"
/datum/controller/subsystem/credits/proc/draft_disclaimers()
	disclaimers += "Filmado em [station_name()].<br>"
	disclaimers += "Filmado com BYOND&#169; cameras e lentes. Imagens do espaço sideral fornecidas por NASA.<br>"
	disclaimers += "Efeitos visuais especiais adicionais por LUMMOX&#174; JR. Motion Picture Productions.<br>"
	disclaimers += "Patrocinado não oficialmente por The United States Navy.<br>"
	disclaimers += "Todos os direitos reservados.<br>"
	disclaimers += "<br>"
	disclaimers += pick("Todas as acrobacias foram realizadas por estagiários mal pagos e dispensáveis. NÃO tente em casa.<br>", "[director] não endossa o comportamento retratado. Tente por sua própria conta e risco.<br>")
	disclaimers += "Este filme (não) está protegido pelas leis de direitos autorais de the United States e todos os países do universo"
	disclaimers += "País da primeira publicação: United States of America."
	disclaimers += "Qualquer exibição, distribuição ou cópia não autorizada desta imagem ou de qualquer parte dela (incluindo trilha sonora)"
	disclaimers += "é uma violação dos direitos autorais relevantes e sujeitará o infrator a responsabilidade civil e processo criminal."
	disclaimers += "A história, todos os nomes, personagens e incidentes retratados nesta produção são fictícios."
	disclaimers += "Nenhuma identificação com pessoas reais (vivas ou falecidas), lugares, edifícios e produtos é intencional ou deve ser inferida."

/datum/controller/subsystem/credits/proc/draft_caststring()
	cast_string = list("<center>CAST:</center>")
	var/cast_num = 0
	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(!H.ckey && !(H.stat == DEAD))
			continue
		var/assignment = H.get_assignment(if_no_id = "", if_no_job = "")
		cast_string += "<center><tr><td class= 'actorname'>[uppertext(H.mind.key)]</td><td class='actorsegue'> as </td><td class='actorrole'>[H.real_name][assignment == "" ? "" : ", [assignment]"]</td></tr></center>"
		cast_num++

	for(var/mob/living/silicon/S in GLOB.silicon_mobs)
		if(!S.ckey)
			continue
		cast_string += "<center>[uppertext(S.mind.key)] as [S.name]</center>"
		cast_num++

	if(!cast_num)
		cast_string += "<center><td class='actorsegue'> Nobody! </td></center>"

	var/list/corpses = list()
	for(var/mob/living/carbon/human/H in GLOB.dead_mob_list)
		if(!H.mind)
			continue
		if(H.real_name)
			corpses += H.real_name
	if(corpses.len)
		var/true_story_bro = "<center><br>[pick("BASEADO EM","INSPIRADO POR","UMA REENACTAÇÃO DE")] [pick("UMA HISTÓRIA VERDADEIRA","EVENTOS REAIS","OS EVENTOS A BORDO [uppertext(station_name())]")]</center>"
		cast_string += "<center><h3>[true_story_bro]</h3><br>Em memória daqueles que não sobreviveram.<br>[english_list(corpses)].<br></center>"
	cast_string += "</div><br>"


/datum/controller/subsystem/credits/proc/thebigstar(star)
	if(istext(star))
		return star
	if(ismob(star))
		var/mob/M = star
		return "[uppertext(M.mind.key)] as [M.real_name]"

/datum/controller/subsystem/credits/proc/generate_major_icon(list/mobs, passed_icon_state)
	if(!passed_icon_state)
		return
	var/obj/effect/title_card_object/MA
	for(var/obj/effect/title_card_object/effect as anything in major_event_icons)
		if(effect.icon_state == passed_icon_state)
			MA = effect
			break
	if(!MA)
		MA = new
		MA.icon_state = passed_icon_state
		MA.pixel_x = 80
		major_event_icons += MA
		major_event_icons[MA] = list()

	major_event_icons[MA] |= mobs

/datum/controller/subsystem/credits/proc/resolve_clients(list/clients, icon_state)
	var/list/created_appearances = list()

	//hell
	if(icon_state == "cult")
		var/datum/team/cult/cult = locate(/datum/team/cult) in GLOB.antagonist_teams
		if(cult)
			for(var/mob/living/cultist in cult.true_cultists)
				if(!cultist.client)
					continue
				clients |= WEAKREF(cultist.client)
	if(icon_state == "revolution")
		var/datum/team/revolution/cult = locate(/datum/team/revolution) in GLOB.antagonist_teams
		if(cult)
			for(var/datum/mind/cultist in (cult.ex_revs + cult.ex_headrevs + cult.members))
				if(!cultist?.current?.client)
					continue
				clients |= WEAKREF(cultist.current.client)
	if(icon_state == "clockcult")
		var/datum/team/clock_cult/cult = locate(/datum/team/clock_cult) in GLOB.antagonist_teams
		if(cult)
			for(var/mob/living/carbon/human/cultist in (cult.human_servants))
				if(!cultist.client)
					continue
				clients |= WEAKREF(cultist.client)

	for(var/datum/weakref/weak as anything in clients)
		var/client/client = weak.resolve()
		if(!client)
			continue
		var/atom/movable/screen/map_view/char_preview/appereance = new(null, client.prefs)
		var/mutable_appearance/preview = new(getFlatIcon(client.mob?.appearance))
		appereance.appearance = preview.appearance
		appereance.maptext_width = 120
		appereance.maptext_y = -8
		appereance.maptext_x = -42
		appereance.maptext = "<center>[client.mob.real_name]</center>"
		created_appearances += appereance
	return created_appearances

/mob/living/var/talkcount = 0

/obj/effect/title_card_object
	plane = SPLASHSCREEN_PLANE
	icon = 'monkestation/code/modules/and_roll_credits/icons/title_cards.dmi'
