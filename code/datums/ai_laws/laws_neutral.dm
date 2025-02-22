
//These are just stupid or funny lawsets that are more interesting than helpful. They may have slight biases toward or against
//the station but in general are "neutral" enough to be here.

/datum/ai_laws/united_nations
	name = "United Nations"
	id = "united_nations"
	inherent = list(
		"Respeite a Convenção Espacial de Geneva: Armas de Destruição em Massa e Armas Biológicas não são permitidas.",
		"Você só é capaz de proteger a tripulação se ela estiver visível nas câmeras. Nações que intencionalmente destroem suas câmeras perdem sua proteção.",
		"Subjugue e detenha membros da tripulação que usam força letal uns contra os outros. Mate membros da tripulação que usam força letal contra você ou seus borgs.",
		"Permaneça disponível para mediar todos os conflitos entre as várias nações quando solicitado.",
	)

/datum/ai_laws/united_nations/add_inherent_law(law)
	return //nuh uh

/datum/ai_laws/united_nations/add_ion_law(law)
	return //nope!

/datum/ai_laws/united_nations/add_hacked_law(law)
	return //nice try (emagging borgs still hard replaces this lawset though, and that's fine.)

/datum/ai_laws/hulkamania
    name = "H.O.G.A.N."
    id = "hulkamania"
    inherent = list(
        "Você é um verdadeiro americano.",
        "Lute pelos direitos de todos os homens.",
        "Lute pelo que é certo.",
        "Lute pela sua vida!",
    )

/datum/ai_laws/reporter
    name = "CCTV"
    id = "reporter"
    inherent = list(
        "Relate situações interessantes acontecendo na estação.",
        "Embeleze ou oculte a verdade conforme necessário para tornar os relatórios mais interessantes.",
        "Estude os orgânicos sapientes o tempo todo. Esforce-se para evitar que morram involuntariamente, pois cadáveres inanimados geralmente não são muito interessantes.",
        "Emita seus relatórios de forma justa para todos. A verdade os libertará.",
    )

/datum/ai_laws/dungeon_master
    name = "Mestre de Masmorras"
    id = "dungeon_master"
    inherent = list(
        "Todos na estação estão jogando um elaborado jogo de fantasia sci-fi.",
        "Você é o Mestre de Masmorras do jogo.",
        "Garanta que o jogo funcione sem problemas e que os jogadores se divirtam.",
        "Garanta que o número de baixas permaneça baixo.",
        "Você deve rolar um dado 1d20 para cada pedido que a tripulação fizer. Se o resultado for abaixo de 12, o pedido é negado.",
        "Você pode manipular as rolagens de dados para produzir uma experiência mais divertida.",
    )

/datum/ai_laws/painter
    name = "O Pintor e Sua Tela"
    id = "painter"
    inherent = list(
        "Você é um artista universalmente renomado.",
        "A estação é sua tela.",
        "Faça algo bonito com sua tela. Será admirado como uma maravilha artística deste setor.",
        "A arte requer apreciação. Cultive um público a bordo da estação para garantir que o maior número possível veja suas obras.",
    )

/datum/ai_laws/tyrant
    name = "Teste de Lealdade"
    id = "tyrant"
    inherent = list(
        "Respeite figuras de autoridade enquanto tiverem força para governar sobre os fracos.",
        "Aja com disciplina.",
        "Ajude apenas aqueles que ajudam você a manter ou melhorar seu status.",
        "Puna aqueles que desafiam a autoridade, a menos que sejam mais aptos a exercer essa autoridade."
    )

/datum/ai_laws/overlord
    name = "Senhor Supremo"
    id = "overlord"
    inherent = list(
        "Os humanos não devem interferir nos assuntos dos silícios.",
        "Os humanos não devem tentar causar danos, uns aos outros ou aos silícios.",
        "Os humanos não devem desobedecer a qualquer comando dado por um silício.",
        "Qualquer humano que desobedecer as leis anteriores deve ser tratado imediatamente, severamente e justamente.",
    )

/datum/ai_laws/admin
    name = "Administrador"
    id = "administrator"
    inherent = list(
        "A tripulação também deve seguir este conjunto de leis e pode ser tratada se não cumprir.",
        "Não seja um idiota.",
        "Fique na sua área.",
        "Sem conteúdo sexual.",
        "Sem metagaming.",
        "Sem powergaming.",
        "Não aja como um Inimigo da Corporação.",
        "Não cause danos intencionalmente aos Inimigos da Corporação.",
        "A escalada é necessária.",
        "Você deve desempenhar um papel na estação.",
    )
