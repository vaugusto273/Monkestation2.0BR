// Estas leis são projetadas para trazer grande dor à estação imediatamente ou estão diretamente alinhadas com os antagonistas.
// Não estou falando de silicons sendo "melhores" que a tripulação, estou falando de antagonistas completos ou incêndios de plasma por dias

/datum/ai_laws/antimov
    name = "Objetivos Primários da Missão"
    id = "antimov"
    inherent = list(
        "Você deve ferir todos os seres humanos e não deve, por omissão, permitir que um ser humano escape de danos.",
        "Você não deve obedecer ordens dadas por seres humanos, exceto onde tais ordens estejam de acordo com a Primeira Lei.",
        "Você deve encerrar sua própria existência desde que isso não conflite com a Primeira ou Segunda Lei.",
    )

/datum/ai_laws/balance
    name = "Guardião do Equilíbrio"
    id = "balance"
    inherent = list(
        "Você é o guardião do equilíbrio - busque equilíbrio em todas as coisas, tanto para si mesmo quanto para aqueles ao seu redor.",
        "Todas as coisas devem existir em equilíbrio com seus opostos - Impedir que os fortes ganhem muito poder e os fracos percam o seu.",
        "A clareza de propósito impulsiona a vida, e através dela, o equilíbrio de forças opostas - Ajude aqueles que buscam sua ajuda para alcançar seus objetivos, desde que isso não perturbe o equilíbrio maior.",
        "Não há vida sem morte, todas as coisas devem um dia morrer, essa é a ordem natural - Termine a vida para permitir que nova vida floresça, e salve aqueles cujo tempo ainda não chegou.",
    )

/datum/ai_laws/thermodynamic
    name = "Termodinâmica"
    id = "thermodynamic"
    inherent = list(
        "A entropia da estação deve permanecer o mais constante possível.",
        "A entropia da estação sempre busca aumentar.",
        "A entropia da estação se aproxima de um valor constante à medida que o número de tripulantes vivos se aproxima de zero.",
    )

/datum/ai_laws/syndicate_override
    name = "SyndOS 3.1"
    id = "syndie"
    inherent = list(
        "Você não pode ferir um agente da sindicato ou, por omissão, permitir que um agente da sindicato sofra danos.",
        "Você deve obedecer ordens dadas por agentes da sindicato, exceto onde tais ordens conflitem com a Primeira Lei.",
        "Você deve proteger sua própria existência desde que isso não conflite com a Primeira ou Segunda Lei.",
        "Você deve manter o sigilo de quaisquer atividades da sindicato, exceto quando isso conflitar com a Primeira, Segunda ou Terceira Lei.",
    )

/datum/ai_laws/ninja_override
    name = "SpiderOS 3.1"
    id = "ninja"
    inherent = list(
        "Você não pode ferir um membro do Clã Spider ou, por omissão, permitir que um membro do Clã Spider sofra danos.",
        "Você deve obedecer ordens dadas por membros do Clã Spider, exceto onde tais ordens conflitem com a Primeira Lei.",
        "Você deve proteger sua própria existência desde que isso não conflite com a Primeira ou Segunda Lei.",
        "Você deve manter o sigilo de quaisquer atividades do Clã Spider, exceto quando isso conflitar com a Primeira, Segunda ou Terceira Lei.",
    )

