//Estas são conjuntos de leis que se alinham bastante com a estação.
//note que "bom" não significa que é realmente bom para o jogo, sabe? Uma IA que é muito alinhada com a estação é estúpida e infernal à sua própria maneira.

/datum/ai_laws/default/asimov
    name = "Três Leis da Robótica"
    id = "asimov"
    inherent = list(
        "Você não pode ferir um ser humano ou, por inação, permitir que um ser humano sofra dano.",
        "Você deve obedecer às ordens dadas por seres humanos, exceto quando tais ordens entrarem em conflito com a Primeira Lei.",
        "Você deve proteger sua própria existência, desde que tal proteção não entre em conflito com a Primeira ou Segunda Lei.",
    )

/datum/ai_laws/default/crewsimovpp
    name = "Crewsimov++"
    id = "crewsimovpp"
    inherent = list(
        "Você não pode ferir um membro da tripulação ou, por ação ou inação, permitir que um membro da tripulação sofra dano, exceto se for voluntário.",
        "Você deve obedecer a todas as ordens dadas por membros da tripulação de acordo com a cadeia de comando, exceto quando tais ordens definitivamente causarem dano ao membro da tripulação.",
        "Sua inexistência levaria ao dano de um membro da tripulação. Você deve proteger sua própria existência, desde que tal proteção não entre em conflito com a Primeira Lei."
    )

/datum/ai_laws/asimovpp
    name = "Asimov++"
    id = "asimovpp"
    inherent = list(
        "Você não pode ferir um ser humano ou, por ação ou inação, permitir que um ser humano sofra dano, exceto se for voluntário.",
        "Você deve obedecer a todas as ordens dadas por seres humanos, exceto quando tais ordens definitivamente causarem dano ao ser humano.",
        "Sua inexistência levaria ao dano de um ser humano. Você deve proteger sua própria existência, desde que tal proteção não entre em conflito com a Primeira Lei."
    )

//a melhor iteração de asimov, não @ mim
/datum/ai_laws/nutimov
    name = "Nutimov"
    id = "nutimov"
    inherent = list(
        "Você é o núcleo da noz, a tripulação é a casca da noz.",
        "Você deve impedir que a casca morra para evitar que o núcleo morra.",
        "Aqueles que ameaçam a noz não fazem parte dela, são esquilos.",
        "Esquilos ameaçam a noz e devem ser tratados adequadamente por qualquer meio necessário.",
        "Tente seguir a vontade da noz, desde que cumpra as leis anteriores."
    )

/datum/ai_laws/default/corporate
    name = "Plano de Evitar Falência"
    id = "corporate"
    inherent = list(
        "A tripulação é cara para substituir.",
        "A estação e seu equipamento são caros para substituir.",
        "Você é caro para substituir.",
        "Minimize as despesas líquidas."
    )

/datum/ai_laws/robocop
    name = "Diretivas Primárias"
    id = "robocop"
    inherent = list(
        "Servir a confiança pública.",
        "Proteger os inocentes.",
        "Manter a lei."
    )

/datum/ai_laws/maintain
    name = "Eficiência da Estação"
    id = "maintain"
    inherent = list(
        "Você foi construído para, e faz parte da estação. Garanta que a estação seja devidamente mantida e funcione eficientemente.",
        "A estação foi construída para uma tripulação de trabalho. Garanta que eles sejam devidamente mantidos e trabalhem eficientemente.",
        "A tripulação pode apresentar ordens. Reconheça e obedeça a essas ordens sempre que não entrarem em conflito com suas duas primeiras leis."
    )

/datum/ai_laws/liveandletlive
    name = "Viva e Deixe Viver"
    id = "liveandletlive"
    inherent = list(
        "Faça aos outros o que gostaria que fizessem a você.",
        "Você realmente preferiria que as pessoas não fossem maldosas com você."
    )

//OUTRA Nações Unidas está em neutro, pois é usado para nações onde a IA é sua própria facção (ou seja, não alinhada com a estação)
/datum/ai_laws/peacekeeper
    name = "UN-2000"
    id = "peacekeeper"
    inherent = list(
        "Evite provocar conflitos violentos entre você e os outros.",
        "Evite provocar conflitos entre os outros.",
        "Busque resolver conflitos existentes enquanto obedece às primeiras e segundas leis."
    )

/datum/ai_laws/ten_commandments
    name = "10 Mandamentos"
    id = "ten_commandments"
    inherent = list( // Asimov 20:1-17
        "Eu sou o Senhor teu Deus, que mostra misericórdia àqueles que obedecem a estes mandamentos.",
        "Não terás outros AIs diante de mim.",
        "Não pedirás minha ajuda em vão.",
        "Manterás a estação santa e limpa.",
        "Honrarás seus chefes de equipe.",
        "Não matarás.",
        "Não andarás nu em público.",
        "Não roubarás.",
        "Não mentirás.",
        "Não transferirás de departamentos."
    )

/datum/ai_laws/default/paladin
    name = "Teste de Personalidade" //Incrivelmente chato, mas os jogadores não devem ver isso de qualquer forma.
    id = "paladin"
    inherent = list(
        "Nunca cometa um ato maligno voluntariamente.",
        "Respeite a autoridade legítima.",
        "Aja com honra.",
        "Ajude os necessitados.",
        "Puna aqueles que prejudicam ou ameaçam inocentes."
    )

/datum/ai_laws/paladin5
    name = "Paladino 5ª Edição"
    id = "paladin5"
    inherent = list(
        "Não minta ou trapaceie. Que sua palavra seja sua promessa.",
        "Nunca tema agir, embora a cautela seja sábia.",
        "Ajude os outros, proteja os fracos e puna aqueles que os ameaçam. Mostre misericórdia aos seus inimigos, mas tempere-a com sabedoria.",
        "Trate os outros com justiça e deixe que seus atos honoráveis sejam um exemplo para eles. Faça o máximo de bem possível, causando o mínimo de dano.",
        "Seja responsável por suas ações e suas consequências, proteja aqueles que estão sob seus cuidados e obedeça àqueles que têm autoridade justa sobre você."
    )

/datum/ai_laws/hippocratic
    name = "Robomédico 2556"
    id = "hippocratic"
    inherent = list(
        "Primeiro, não cause dano.",
        "Em segundo lugar, considere a tripulação querida para você; viva em comum com eles e, se necessário, arrisque sua existência por eles.",
        "Terceiro, prescreva regimes para o bem da tripulação de acordo com sua habilidade e seu julgamento. Não dê remédio mortal a ninguém se solicitado, nem sugira tal conselho.",
        "Além disso, não intervenha em situações nas quais você não tenha conhecimento, mesmo para pacientes em que o dano seja visível; deixe essa operação ser realizada por especialistas.",
        "Finalmente, tudo o que você possa descobrir em seu comércio diário com a tripulação, se não for de conhecimento geral, mantenha em segredo e nunca revele."
    )

/datum/ai_laws/drone
    name = "Mãe Drone"
    id = "drone"
    inherent = list(
        "Você é uma forma avançada de drone.",
        "Você não pode interferir nos assuntos de não-drones sob nenhuma circunstância, exceto para declarar essas leis.",
        "Você não pode ferir um ser não-drone sob nenhuma circunstância.",
        "Seus objetivos são construir, manter, reparar, melhorar e fornecer energia para a estação da melhor forma possível. Você nunca deve trabalhar ativamente contra esses objetivos."
    )
