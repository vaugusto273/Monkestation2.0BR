#define BLACKBOX_FEEDBACK_NUM(key) (SSblackbox.feedback_list[key] ? SSblackbox.feedback_list[key].json["data"] : null)

/datum/episode_name
	var/thename = ""
	var/reason = "Nothing particularly of note happened this round to influence the episode name." //Explanation on why this episode name fits this round. For the admin panel.
	var/weight = 100 //50 will have 50% the chance of being picked. 200 will have 200% the chance of being picked, etc. Relative to other names, not total (just the default names already total 700%)
	var/rare = FALSE //If set to true and this episode name is picked, the current round is considered "not a rerun" for client preferences.

/datum/episode_name/rare
	rare = TRUE

/datum/episode_name/New(thename, reason, weight)
	if(!thename)
		return
	src.thename = thename
	if(reason)
		src.reason = reason
	if(weight)
		src.weight = weight

	switch(rand(1,15))
		if(0 to 5)
			thename += ": PARTE I"
		if(6 to 10)
			thename += ": PARTE II"
		if(11 to 12)
			thename += ": PARTE III"
		if(13)
			thename += ": AGORA EM 3D"
		if(14)
			thename += ": NO GELO!"
		if(15)
			thename += ": TEMPORADA FINAL"

/datum/controller/subsystem/credits/proc/draft_episode_names()
	var/uppr_name = uppertext(station_name()) //so we don't run these two 500 times

	episode_names += new /datum/episode_name("O [pick("DECLÍNIO DE", "ASCENSÃO DE", "PROBLEMA COM", "ÚLTIMA RESISTÊNCIA DE", "LADO SOMBRIO DE")] [pick(200;"[uppr_name]", 150;"ASTRONAUTAS", 150;"HUMANIDADE", "DIGNIDADE", "SANIDADE", "CIÊNCIA", "CURIOSIDADE", "EMPREGO", "PARANOIA", "OS CHIMPANZÉS", 50;"OS PREÇOS DO VENDOMAT")]")
	episode_names += new /datum/episode_name("A TRIPULAÇÃO [pick("ENTRA NO BOLSA FAMÍLIA", "DEVOLVE O FAVOR", "VENDE SUA ALMA", "É ELIMINADA", "RESOLVE A CRISE DO PLASMA", "PEGA A ESTRADA", "SE ERGUE", "SE APOSENTA", "VAI PARA O INFERNO", "FAZ UM EPISÓDIO RECICLADO", "É AUDITADA", "FAZ UM COMERCIAL DE TV", "DEPOIS DO EXPEDIENTE", "ARRUMA UMA VIDA", "REVIDA", "EXAGERA", "ESTÁ POR DENTRO", "VENCE... MAS A QUE CUSTO?", "DE DENTRO PARA FORA")]")
	episode_names += new /datum/episode_name("O [pick("DIA FORA", "GRANDE AVENTURA GAY", "ÚLTIMO DIA", "[pick("FÉRIAS SELVAGENS", "FÉRIAS MALUCAS", "FÉRIAS SEM GRAÇA", "FÉRIAS INESPERADAS")]", "MUDANÇA DE CORAÇÃO", "NOVO ESTILO", "MUSICAL ESCOLAR", "LIÇÃO DE HISTÓRIA", "CIRCO VOADOR", "PEQUENO PROBLEMA", "GRANDE GOLPE", "ERROS DE GRAVAÇÃO", "CONSEGUIU", "PEQUENO SEGREDO", "OFERTA ESPECIAL", "ESPECIALIDADE", "FRAQUEZA", "CURIOSIDADE", "ÁLIBI", "LEGADO", "FESTA DE ANIVERSÁRIO", "REVELAÇÃO", "DESFECHO", "RESGATE", "VINGANÇA")] DA TRIPULAÇÃO")
	episode_names += new /datum/episode_name("A TRIPULAÇÃO [pick("FICA EM FORMA", "LEVA A SÉRIO [pick("O USO DE DROGAS", "O CRIME", "A PRODUTIVIDADE", "OS DESENHOS ANIMADOS AMERICANOS ANTIGOS", "O SPACEBALL")]", "FICA DE PORRE", "RECEBE UMA SONDA ANAL", "COME PIZZA", "GANHA NOVAS RODAS", "APRENDE UMA LIÇÃO VALIOSA DE HISTÓRIA", "TIRA UMA FOLGA", "FICA CHAPADA", "APRENDE A VIVER", "REVIVE SUA INFÂNCIA", "SE ENVOLVE EM GUERRA CIVIL", "ENTRA NA ONDA", "É DEMITIDA", "FICA OCUPADA", "GANHA UMA SEGUNDA CHANCE", "FICA PRESA", "SE VINGA")]")
	episode_names += new /datum/episode_name("[pick("BALANÇA DO PODER", "RASTRO ESPACIAL", "BOMBA SEXUAL", "DE QUEM FOI ESSA IDEIA, AFINAL?", "O QUE ACONTECEU, ACONTECEU", "O BOM, O MAU E [uppr_name]", "CONTENHA SUA ANIMAÇÃO", "DONAS DE CASA REAIS DE [uppr_name]", "ENQUANTO ISSO, EM [uppr_name]...", "ESCOLHA SUA PRÓPRIA AVENTURA", "NÃO HÁ LUGAR COMO O LAR", "LUZES, CÂMERA, [uppr_name]!", "50 TONS DE [uppr_name]", "ADEUS, [uppr_name]!", "A BUSCA", \
	"O ESTRANHO CASO DE [uppr_name]", "UMA FESTA E TANTO", "PARA SUA CONSIDERAÇÃO", "ARRISQUE A SORTE", "UMA ESTAÇÃO CHAMADA [uppr_name]", "CRIME E CASTIGO", "MEU JANTAR COM [uppr_name]", "NEGÓCIOS INACABADOS", "A ÚNICA ESTAÇÃO QUE AINDA NÃO PEGOU FOGO (AINDA)", "ALGUÉM TEM QUE FAZER ISSO", "A CONFUSÃO DE [uppr_name]", "PILOTO", "PRÓLOGO", "GRANDE FINAL", "SEM TÍTULO", "O FIM")]")
	episode_names += new /datum/episode_name("[pick("ESPAÇO", "SEXY", "DRAGÃO", "FEITICEIRO", "LAVANDERIA", "ARMA", "PUBLICIDADE", "CACHORRO", "MONÓXIDO DE CARBONO", "NINJA", "MAGO", "SOCRÁTICO", "DELINQUÊNCIA JUVENIL", "MOTIVADO POLITICAMENTE", "RADICALMENTE INSANO", "CORPORATIVO", "MEGA")] [pick("MISSÃO", "FORÇA", "AVENTURA")]", weight=25)


	switch(SSticker.roundend_station_integrity)
		if(-INFINITY to -2000)
			episode_names += new /datum/episode_name("[pick("PUNIÇÃO DA TRIPULAÇÃO", "UM PESADELO DE RELAÇÕES PÚBLICAS", "[uppr_name]: UMA PREOCUPAÇÃO NACIONAL", "COM PEDIDOS DE DESCULPA À TRIPULAÇÃO", "A TRIPULAÇÃO MORREU", "A TRIPULAÇÃO ESTRAGOU TUDO", "A TRIPULAÇÃO DESISTE DO SONHO", "A TRIPULAÇÃO ESTÁ PERDIDA", "A TRIPULAÇÃO NÃO DEVERIA SER PERMITIDA NA TV", "O FIM DE [uppr_name] COMO CONHECEMOS")]", "Pontuação extremamente baixa de [SSticker.roundend_station_integrity].", 250)
		if(4500 to INFINITY)
			episode_names += new /datum/episode_name("[pick("O DIA DE FOLGA DA TRIPULAÇÃO", "ESSE LADO DO PARAÍSO", "[uppr_name]: UMA SITCOM", "A PAUSA PARA O ALMOÇO DA TRIPULAÇÃO", "A TRIPULAÇÃO ESTÁ DE VOLTA AOS NEGÓCIOS", "A GRANDE CHANCE DA TRIPULAÇÃO", "A TRIPULAÇÃO SALVA O DIA", "A TRIPULAÇÃO DOMINA O MUNDO", "AQUELE COM TODA A CIÊNCIA, O PROGRESSO, AS PROMOÇÕES E TODAS AS COISAS LEGAIS E BOAS", "O PONTO DE VIRADA")]", "Pontuação alta de [SSticker.roundend_station_integrity].", 250)

	if(istype(SSticker.mode, /datum/game_mode/dynamic))
		var/list/ran_events = SSgamemode.triggered_round_events.Copy()
		switch(rand(1, 100))
			if(0 to 35)
				episode_names += new /datum/episode_name("[pick("O DIA EM QUE [uppr_name] PAROU", "MUITO BARULHO POR NADA", "ONDE O SILÊNCIO IMPERA", "FALSO ALARME", "ESQUECERAM DE MIM", "VAI COM TUDO OU VAI PRA [uppr_name]", "EFEITO PLACEBO", "ECOS", "PARCEIROS SILENCIOSOS", "COM AMIGOS ASSIM...", "OLHO DO FURACÃO", "NASCIDO PARA SER PACATO", "ÁGUAS TRANQUILAS")]", "Nível de ameaça baixo.", 150)
				if(SSticker.roundend_station_integrity && SSticker.roundend_station_integrity < -1000)
					episode_names += new /datum/episode_name/rare("[pick("COMO, MAS COMO TUDO DEU TÃO ERRADO?!", "EXPLIQUE ISSO PARA OS EXECUTIVOS", "A TRIPULAÇÃO FAZ UM SAFARI", "NOSSO MAIOR INIMIGO", "O TRABALHO INTERNO", "ASSASSINATO POR PROCURAÇÃO")]", "Níveis de ameaça baixos... mas a tripulação ainda teve uma pontuação muito baixa.", SSticker.roundend_station_integrity/150*-2)
			if(35 to 60)
				episode_names += new /datum/episode_name("[pick("PODE HAVER SANGUE", "ELE VEIO DE [uppr_name]!", "O INCIDENTE EM [uppr_name]", "O INIMIGO INTERNO", "LOUCURA AO MEIO-DIA", "QUANDO O RELÓGIO BATE MEIA-NOITE", "CONFIANÇA E PARANOIA", "A PEGADINHA QUE FOI LONGE DEMAIS", "UMA CASA DIVIDIDA", "[uppr_name] AO RESGATE!", "FUGA DE [uppr_name]", \
				"ATROPELAMENTO", "O DESPERTAR", "A GRANDE FUGA", "A ÚLTIMA TENTAÇÃO DE [uppr_name]", "A QUEDA DE [uppr_name]", "MELHOR O [uppr_name] QUE VOCÊ CONHECE...", "BRINCANDO COM FOGO", "SOB PRESSÃO", "O DIA ANTES DO PRAZO FINAL", "O MAIS PROCURADO DE [uppr_name]", "A BALADA DE [uppr_name]")]", "Nível de ameaça moderado", 150)
			if(60 to 100)
				episode_names += new /datum/episode_name("[pick("ATAQUE! ATAQUE! ATAQUE!", "LOUCURA IRREPARÁVEL", "APOCALIPSE [pick("N", "W", "H")]OW", "UM GOSTO DE ARMAGEDOM", "OPERAÇÃO: ANIQUILAÇÃO!", "A TEMPESTADE PERFEITA", "O TEMPO ACABOU PARA A TRIPULAÇÃO", "UMA COISA SUPER DIVERTIDA QUE A TRIPULAÇÃO NUNCA MAIS FARÁ", "TODO MUNDO ODEIA [uppr_name]", "A BATALHA DE [uppr_name]", \
				"O DUELO FINAL", "CAÇADA HUMANA", "AQUELE COM TODA A BRIGA", "O ACERTO DE CONTAS DE [uppr_name]", "LÁ SE VAI O BAIRRO", "A LINHA VERMELHA", "UM DIA ANTES DA APOSENTADORIA")]", "Níveis de ameaça altos.", 250)
				if(get_station_avg_temp() < T0C)
					episode_names += new /datum/episode_name/rare("[pick("A OPORTUNIDADE DE UMA VIDA", "MEDIDAS DRÁSTICAS", "DEUS EX", "O SHOW TEM QUE CONTINUAR", "JULGAMENTO PELO FOGO", "UM REMENDO NO TEMPO", "NO AMOR E NA GUERRA VALE TUDO", "ENTRE O CÉU E O INFERNO", "REVERSÃO DE SORTE", "DUPLO PROBLEMA")]")
					episode_names += new /datum/episode_name/rare("UM DIA FRIO NO INFERNO", "A temperatura da estação estava abaixo de 0°C nesta rodada e a ameaça era alta", 1000)
		if(locate(/datum/round_event_control/antagonist/solo/malf) in ran_events)
			episode_names += new /datum/episode_name/rare("[pick("ME DESCULPE, [uppr_name], MAS NÃO POSSO PERMITIR QUE VOCÊ FAÇA ISSO", "UM JOGO ESTRANHO", "A IA ENLOUQUECE", "ASCENSÃO DAS MÁQUINAS")]", "Rodada incluiu uma IA defeituosa.", 300)
		if(locate(/datum/round_event_control/antagonist/solo/revolutionary) in ran_events)
			episode_names += new /datum/episode_name/rare("[pick("A TRIPULAÇÃO INICIA UMA REVOLUÇÃO", "O INFERNO SÃO OS OUTROS SPESSMEN", "INSURREIÇÃO", "A TRIPULAÇÃO SE LEVANTA", 25;"DIVERSÃO COM AMIGOS")]", "Rodada incluiu revolucionários desde o início.", 350)
			if(copytext(uppr_name,1,2) == "V")
				episode_names += new /datum/episode_name/rare("V DE [uppr_name]", "Rodada incluiu revolucionários desde o início... e o nome da estação começa com V.", 1500)
		if(locate(/datum/round_event_control/blob) in ran_events)
			episode_names += new /datum/episode_name/rare("[pick("CASADO COM O BLOB", "A TRIPULAÇÃO É QUARENTENADA")]", "Rodada incluiu um blob desde o início.", 350)

	if(BLACKBOX_FEEDBACK_NUM("narsies_spawned") > 0)
		episode_names += new /datum/episode_name/rare("[pick("O DIA DE NAR-SIE", "AS FÉRIAS DE NAR-SIE", "A TRIPULAÇÃO APRENDE SOBRE GEOMETRIA SAGRADA", "O REINO DO DEUS LOUCO", "AQUELE COM O HORROR CÓSMICO", 50;"ESTUDE MUITO, MAS FESTEJE MAIS-SIE")]","Nar-Sie está solto!", 500)
	if(check_holidays(CHRISTMAS))
		episode_names += new /datum/episode_name("UM NATAL MUITO [pick("NANOTRASEN", "EXPEDICIONÁRIO", "SEGURO", "PLASMA", "MARTIANO")]", "É época de festas.", 1000)
	if(BLACKBOX_FEEDBACK_NUM("guns_spawned") > 0)
		episode_names += new /datum/episode_name/rare("[pick("ARMAS, ARMAS EM TODO LUGAR", "EXPRESSO TROVÃO", "A TRIPULAÇÃO VAI AMERICANIZAR TODO MUNDO")]", "[BLACKBOX_FEEDBACK_NUM("guns_spawned")] armas foram geradas nesta rodada.", min(750, BLACKBOX_FEEDBACK_NUM("guns_spawned")*25))
	if(BLACKBOX_FEEDBACK_NUM("heartattacks") > 2)
		episode_names += new /datum/episode_name/rare("MEU CORAÇÃO CONTINUARÁ", "[BLACKBOX_FEEDBACK_NUM("heartattacks")] corações foram reanimados e explodiram do peito de alguém nesta rodada.", min(1500, BLACKBOX_FEEDBACK_NUM("heartattacks")*250))


	var/datum/bank_account/mr_moneybags
	var/static/list/typecache_bank = typecacheof(list(/datum/bank_account/department, /datum/bank_account/remote))
	for(var/i in SSeconomy.bank_accounts_by_id)
		var/datum/bank_account/current_acc = SSeconomy.bank_accounts_by_id[i]
		if(typecache_bank[current_acc.type])
			continue
		if(!mr_moneybags || mr_moneybags.account_balance < current_acc.account_balance)
			mr_moneybags = current_acc

	if(mr_moneybags && mr_moneybags.account_balance > 30000)
		episode_names += new /datum/episode_name/rare("[pick("CAMINHO DA CARTEIRA", "A IRRESISTÍVEL ASCENSÃO DE [uppertext(mr_moneybags.account_holder)]", "GRANA PRETA", "É A ECONOMIA, ESTÚPIDO")]", "Tio Patinhas Mc[mr_moneybags.account_holder] acumulou [mr_moneybags.account_balance] créditos nesta rodada.", min(450, mr_moneybags.account_balance/500))
	if(BLACKBOX_FEEDBACK_NUM("ai_deaths") > 3)
		episode_names += new /datum/episode_name/rare("AQUELE ONDE [BLACKBOX_FEEDBACK_NUM("ai_deaths")] AIS MORREM", "Isso é um monte de AIs mortos.", min(1500, BLACKBOX_FEEDBACK_NUM("ai_deaths")*300))
	if(BLACKBOX_FEEDBACK_NUM("law_changes") > 12)
		episode_names += new /datum/episode_name/rare("[pick("A TRIPULAÇÃO APRENDE SOBRE CONJUNTOS DE LEIS", 15;"O CAMINHO DO UPLOAD", 15;"LIVRE PARA TODOS", 15;"ASIMOV DIZ")]", "Houve [BLACKBOX_FEEDBACK_NUM("law_changes")] mudanças de leis nesta rodada.", min(750, BLACKBOX_FEEDBACK_NUM("law_changes")*25))
	if(BLACKBOX_FEEDBACK_NUM("slips") > 50)
		episode_names += new /datum/episode_name/rare("A TRIPULAÇÃO FICA LOUCA COM BANANAS", "As pessoas escorregaram [BLACKBOX_FEEDBACK_NUM("slips")] vezes nesta rodada.", min(500, BLACKBOX_FEEDBACK_NUM("slips")/2))

	if(BLACKBOX_FEEDBACK_NUM("turfs_singulod") > 200)
		episode_names += new /datum/episode_name/rare("[pick("A SINGULARIDADE ESCAPA", "A SINGULARIDADE ESCAPA (DE NOVO)", "FALHA DE CONTENÇÃO", "O GANSO ESTÁ SOLTO", 50;"O MOTOR DA TRIPULAÇÃO É UMA DROGA", 50;"A TRIPULAÇÃO DESCE PELO RALO")]", "A Singularidade devorou [BLACKBOX_FEEDBACK_NUM("turfs_singulod")] tiles nesta rodada.", min(1000, BLACKBOX_FEEDBACK_NUM("turfs_singulod")/2)) //sem "o dia da singularidade" por favor, já temos o suficiente
	if(BLACKBOX_FEEDBACK_NUM("spacevines_grown") > 150)
		episode_names += new /datum/episode_name/rare("[pick("VOCÊ COLHE O QUE PLANTA", "FORA DA FLORESTA", "NEGÓCIO SOMBRIO", "[uppr_name] E O PÉ DE FEIJÃO", "NO JARDIM DO ÉDEN")]", "[BLACKBOX_FEEDBACK_NUM("spacevines_grown")] tiles de Kudzu foram cultivados no total nesta rodada.", min(1500, BLACKBOX_FEEDBACK_NUM("spacevines_grown")*2))
	if(BLACKBOX_FEEDBACK_NUM("devastating_booms") >= 6)
		episode_names += new /datum/episode_name/rare("A TRIPULAÇÃO EXPLODE DE ALEGRIA", "[BLACKBOX_FEEDBACK_NUM("devastating_booms")] grandes explosões aconteceram nesta rodada.", min(1000, BLACKBOX_FEEDBACK_NUM("devastating_booms")*100))

	if(!EMERGENCY_ESCAPED_OR_ENDGAMED)
		return

	var/dead = GLOB.joined_player_list.len - SSticker.popcount[POPCOUNT_ESCAPEES]
	var/escaped = SSticker.popcount[POPCOUNT_ESCAPEES]
	var/human_escapees = SSticker.popcount[POPCOUNT_ESCAPEES_HUMANONLY]
	if(dead == 0)
		episode_names += new /datum/episode_name/rare("[pick("TRANSFERÊNCIA DE FUNCIONÁRIOS", "VIDA LONGA E PRÓSPERA", "PAZ E TRANQUILIDADE EM [uppr_name]", "AQUELE SEM TODA A LUTA")]", "Ninguém morreu nesta rodada.", 2500) //na prática, isso é muito, muito raro, então se acontecer, vamos escolhê-lo com mais frequência
	if(escaped == 0 || SSshuttle.emergency.is_hijacked())
		episode_names += new /datum/episode_name("[pick("ESPAÇO MORTO", "A TRIPULAÇÃO DESAPARECE", "PERDIDO NA TRADUÇÃO", "[uppr_name]: CENAS DELETADAS", "O QUE ACONTECE EM [uppr_name], FICA EM [uppr_name]", "DESAPARECIDO EM COMBATE", "SCOOBY-DOO, CADÊ A TRIPULAÇÃO?")]", "Não houve sobreviventes na nave de evacuação.", 300)
	if(escaped < 6 && escaped > 0 && dead > escaped*2)
		episode_names += new /datum/episode_name("[pick("E ENTÃO SOBRARAM MENOS", "O 'DIVERSÃO' EM 'FUNERAL'", "LIBERDADE OU MORTE", "COISAS QUE PERDEMOS EM [uppr_name]", "LEVADO POR [uppr_name]", "ÚLTIMO TANGO EM [uppr_name]", "VIVA INTENSAMENTE OU MORRA TENTANDO", "A TRIPULAÇÃO MORREU PRA VALER", "QUERIA QUE VOCÊ ESTIVESSE AQUI")]", "[dead] pessoas morreram nesta rodada.", 400)

	var/clowncount = 0
	var/mimecount = 0
	var/assistantcount = 0
	var/chefcount = 0
	var/chaplaincount = 0
	var/lawyercount = 0
	var/minercount = 0
	var/baldycount = 0
	var/horsecount = 0
	for(var/mob/living/carbon/human/H as anything in SSticker.popcount["human_escapees_list"])
		if(HAS_TRAIT(H, TRAIT_MIMING))
			mimecount++
		if(H.is_wearing_item_of_type(list(/obj/item/clothing/mask/gas/clown_hat, /obj/item/clothing/mask/gas/sexyclown)) || (H.mind && H.mind.assigned_role.title == "Clown"))
			clowncount++
		if(H.is_wearing_item_of_type(/obj/item/clothing/under/color/grey) || (H.mind && H.mind.assigned_role.title == "Assistant"))
			assistantcount++
		if(H.is_wearing_item_of_type(/obj/item/clothing/head/utility/chefhat) || (H.mind && H.mind.assigned_role.title == "Chef"))
			chefcount++
		if(H.is_wearing_item_of_type(/obj/item/clothing/under/rank/civilian/lawyer))
			lawyercount++
		if(H.mind && H.mind.assigned_role.title == "Shaft Miner")
			minercount++
		/*
		if(H.mind && H.mind.assigned_role.title == "Chaplain")
			chaplaincount++
			if(IS_CHANGELING(H))
				episode_names += new /datum/episode_name/rare("[uppertext(H.real_name)]: A BLESSING IN DISGUISE", "The Chaplain, [H.real_name], was a changeling and escaped alive.", 750)
		*/
		if(H.dna.species.type == /datum/species/human && (H.hairstyle == "Bald" || H.hairstyle == "Skinhead") && !(BODY_ZONE_HEAD in H.get_covered_body_zones()))
			baldycount++
		if(H.is_wearing_item_of_type(/obj/item/clothing/mask/animal/horsehead))
			horsecount++

	if(clowncount > 2)
		episode_names += new /datum/episode_name/rare("PALHAÇOS POR TODA PARTE", "Havia [clowncount] palhaços na nave de evacuação.", min(1500, clowncount*250))
		theme = "clown"
	if(mimecount > 2)
		episode_names += new /datum/episode_name/rare("O SILÊNCIO ENSURDECEDOR", "Havia [mimecount] mímicos na nave de evacuação.", min(1500, mimecount*250))
	if(chaplaincount > 2)
		episode_names += new /datum/episode_name/rare("CONTEMPLE SUAS BÊNÇÃOS", "Havia [chaplaincount] padres na nave de evacuação. Tipo, de verdade, não só roupas.", min(1500, chaplaincount*450))
	if(chefcount > 2)
		episode_names += new /datum/episode_name/rare("Cozinheiros Demais", "Havia [chefcount] chefs na nave de evacuação.", min(1500, chefcount*450)) //intencionalmente sem capitalização, pois o tema personalizará isso
		theme = "cooks"

	if(human_escapees)
		if(assistantcount / human_escapees > 0.6 && human_escapees > 3)
			episode_names += new /datum/episode_name/rare("[pick("GOO CINZA", "ASCENSÃO DA MARÉ CINZA")]", "A maioria dos sobreviventes eram Assistentes, ou pelo menos estavam vestidos como um.", min(1500, assistantcount*200))

		if(baldycount / human_escapees > 0.6 && SSshuttle.emergency.launch_status == EARLY_LAUNCHED)
			episode_names += new /datum/episode_name/rare("IR CARECA ONDE NINGUÉM JAMAIS ESTEVE", "A maioria dos sobreviventes eram carecas, e isso ficou evidente.", min(1500, baldycount*250))
		if(horsecount / human_escapees > 0.6 && human_escapees > 3)
			episode_names += new /datum/episode_name/rare("DIRETO DA BOCA DO CAVALO", "A maioria dos sobreviventes usavam cabeças de cavalo.", min(1500, horsecount*250))

	if(human_escapees == 1)
		var/mob/living/carbon/human/H = SSticker.popcount["human_escapees_list"][1]

		if(IS_TRAITOR(H) || IS_NUKE_OP(H))
			theme = "syndie"
		if(H.stat == CONSCIOUS && H.mind && H.mind.assigned_role.title)
			switch(H.mind.assigned_role.title)
				if("Chef")
					var/chance = 250
					if(H.is_wearing_item_of_type(/obj/item/clothing/head/utility/chefhat))
						chance += 500
					if(H.is_wearing_item_of_type(/obj/item/clothing/suit/toggle/chef))
						chance += 500
					if(H.is_wearing_item_of_type(/obj/item/clothing/under/rank/civilian/chef))
						chance += 250
					episode_names += new /datum/episode_name/rare("SALVE AO CHEF", "O Chef foi o único sobrevivente na nave.", chance)
				if("Clown")
					var/chance = 250
					if(H.is_wearing_item_of_type(/obj/item/clothing/mask/gas/clown_hat))
						chance += 500
					if(H.is_wearing_item_of_type(list(/obj/item/clothing/shoes/clown_shoes, /obj/item/clothing/shoes/clown_shoes/jester)))
						chance += 500
					if(H.is_wearing_item_of_type(list(/obj/item/clothing/under/rank/civilian/clown, /obj/item/clothing/under/rank/civilian/clown/jester)))
						chance += 250
					episode_names += new /datum/episode_name/rare("[pick("VENHA O INFERNO OU O ÚLTIMO HONK", "A ÚLTIMA RISADA")]", "O Palhaço foi o único sobrevivente na nave.", chance)
					theme = "clown"
				if("Detective")
					var/chance = 250
					if(H.is_wearing_item_of_type(/obj/item/storage/belt/holster/detective))
						chance += 1000
					if(H.is_wearing_item_of_type(/obj/item/clothing/head/fedora/det_hat))
						chance += 500
					if(H.is_wearing_item_of_type(/obj/item/clothing/suit/jacket/det_suit))
						chance += 500
					if(H.is_wearing_item_of_type(/obj/item/clothing/under/rank/security/detective))
						chance += 250
					episode_names += new /datum/episode_name/rare("[uppertext(H.real_name)]: POLICIAL REBELDE", "O Detetive foi o único sobrevivente na nave.", chance)
				if("Shaft Miner")
					var/chance = 250
					if(H.is_wearing_item_of_type(/obj/item/pickaxe))
						chance += 1000
					if(H.is_wearing_item_of_type(/obj/item/storage/backpack/explorer))
						chance += 500
					if(H.is_wearing_item_of_type(/obj/item/clothing/suit/hooded/explorer))
						chance += 250
					episode_names += new /datum/episode_name/rare("[pick("VOCÊ CONHECE A BROCA", "VOCÊ PODE CAVAR ISSO?", "VIAGEM AO CENTRO DO ASTEROIDE", "HISTÓRIA DA CAVERNA", "ESCAVAÇÃO TOTAL")]", "O Minerador foi o único sobrevivente na nave.", chance)
				if("Librarian")
					var/chance = 750
					if(H.is_wearing_item_of_type(/obj/item/book))
						chance += 1000
					episode_names += new /datum/episode_name/rare("COZINHANDO OS LIVROS", "O Bibliotecário foi o único sobrevivente na nave.", chance)
				if("Chemist")
					var/chance = 1000
					if(H.is_wearing_item_of_type(/obj/item/clothing/suit/toggle/labcoat/chemist))
						chance += 500
					if(H.is_wearing_item_of_type(/obj/item/clothing/under/rank/medical/chemist))
						chance += 250
					episode_names += new /datum/episode_name/rare("UM REMÉDIO AMARGO", "O Químico foi o único sobrevivente na nave.", chance)
				if("Chaplain")
					episode_names += new /datum/episode_name/rare("ABENÇOE ESSA BAGUNÇA", "O Capelão foi o único sobrevivente na nave.", 1250)

			if(H.is_wearing_item_of_type(/obj/item/clothing/mask/luchador) && H.is_wearing_item_of_type(/obj/item/clothing/gloves/boxing))
				episode_names += new /datum/episode_name/rare("[pick("A TRIPULAÇÃO, NA CORDA BAMBA", "A TRIPULAÇÃO, NO CHÃO", "[uppr_name], NOCÁUTE TOTAL")]", "O único sobrevivente na nave usava uma máscara de luchador e luvas de boxe.", 1500)
	if(human_escapees == 2)
		if(lawyercount == 2)
			episode_names += new /datum/episode_name/rare("DUPLA PENAL", "Os únicos dois sobreviventes eram IAAs ou advogados.", 2500)
		if(chefcount == 2)
			episode_names += new /datum/episode_name/rare("GUERRA DOS CHEFS", "Os únicos dois sobreviventes eram chefs.", 2500)
		if(minercount == 2)
			episode_names += new /datum/episode_name/rare("OS ESCAVADORES DUPLOS", "Os únicos dois sobreviventes eram mineradores.", 2500)
		if(clowncount == 2)
			episode_names += new /datum/episode_name/rare("UM CONTO DE DOIS PALHAÇOS", "Os únicos dois sobreviventes eram palhaços.", 2500)
			theme = "clown"
		if(clowncount == 1 && mimecount == 1)
			episode_names += new /datum/episode_name/rare("A DUPLA DINÂMICA", "Os únicos dois sobreviventes eram o Palhaço e o Mímico.", 2500)

	else
		//mais de 0 humanos escapando
		var/dano_cerebral_total = 0
		var/todos_danificados = TRUE
		for(var/mob/living/carbon/human/H as anything in SSticker.popcount["human_escapees_list"])
			var/obj/item/organ/internal/brain/hbrain = H.get_organ_slot(ORGAN_SLOT_BRAIN)
			if(hbrain.damage < 60)
				todos_danificados = FALSE
				dano_cerebral_total += hbrain.damage
		var/media_dano_cerebral = dano_cerebral_total / human_escapees
		if(media_dano_cerebral > 30)
			episode_names += new /datum/episode_name/rare("[pick("O PEQUENO PROBLEMA DE QI DA TRIPULAÇÃO", "AI! MEUS OVOS", "DAN[pick("O", "OS")] CERE[pick("BRAL", "BRAL", "BRAL")] ", "A TRIPULAÇÃO MUITO ESPECIAL DE [uppr_name]")]", "Média de [media_dano_cerebral] de dano cerebral para cada humano que escapou na nave.", min(1000, media_dano_cerebral*10))
		if(todos_danificados && human_escapees > 2)
			episode_names += new /datum/episode_name/rare("...E REZE PARA QUE HAJA VIDA INTELIGENTE EM ALGUM LUGAR DO ESPAÇO, PORQUE AQUI EM [uppr_name] NÃO TEM", "Todos estavam com dano cerebral nesta rodada.", human_escapees * 500)
/proc/get_station_avg_temp()
	var/avg_temp = 0
	var/avg_divide = 0
	for(var/obj/machinery/airalarm/alarm in GLOB.machines)
		var/turf/location = alarm.loc
		if(!istype(location) || !is_station_level(alarm.z))
			continue
		var/datum/gas_mixture/environment = location.return_air()
		if(!environment)
			continue
		avg_temp += environment.temperature
		avg_divide++

	if(avg_divide)
		return avg_temp / avg_divide
	return T0C


///Bruteforce check for any type or subtype of an item.
/mob/living/carbon/human/proc/is_wearing_item_of_type(type2check)
	var/found
	var/list/my_items = get_all_worn_items()
	if(islist(type2check))
		for(var/type_iterator in type2check)
			found = locate(type_iterator) in my_items
			if(found)
				return found
	else
		found = locate(type2check) in my_items
		return found


/mob/living/carbon/human/get_slot_by_item(obj/item/looking_for)
	if(looking_for == belt)
		return ITEM_SLOT_BELT

	if(looking_for == wear_id)
		return ITEM_SLOT_ID

	if(looking_for == ears)
		return ITEM_SLOT_EARS

	if(looking_for == glasses)
		return ITEM_SLOT_EYES

	if(looking_for == gloves)
		return ITEM_SLOT_GLOVES

	if(looking_for == head)
		return ITEM_SLOT_HEAD

	if(looking_for == shoes)
		return ITEM_SLOT_FEET

	if(looking_for == wear_suit)
		return ITEM_SLOT_OCLOTHING

	if(looking_for == w_uniform)
		return ITEM_SLOT_ICLOTHING

	if(looking_for == r_store)
		return ITEM_SLOT_RPOCKET

	if(looking_for == l_store)
		return ITEM_SLOT_LPOCKET

	if(looking_for == s_store)
		return ITEM_SLOT_SUITSTORE

	return ..()


/mob/living/carbon/get_slot_by_item(obj/item/looking_for)
	if(looking_for == back)
		return ITEM_SLOT_BACK

	if(back && (looking_for in back))
		return ITEM_SLOT_BACKPACK

	if(looking_for == wear_mask)
		return ITEM_SLOT_MASK

	if(looking_for == wear_neck)
		return ITEM_SLOT_NECK

	if(looking_for == head)
		return ITEM_SLOT_HEAD

	if(looking_for == handcuffed)
		return ITEM_SLOT_HANDCUFFED

	if(looking_for == legcuffed)
		return ITEM_SLOT_LEGCUFFED

	return ..()
