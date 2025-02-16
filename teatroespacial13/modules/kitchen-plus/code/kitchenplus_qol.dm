////// QUALITY OF LIFE PRA COZINHA ///////

/// Conserta o fato de que, se você cozinhar uma carne ou meatball
// você não consegue mais cortar ela pra virar cutlet ou usar o rollingpin pra amassar
/obj/item/food/meat/steak
	proc/make_processable()
		if (!src.cutlet_type) // Se a variável não estiver definida, não faz nada
			return
		AddElement(/datum/element/processable, TOOL_KNIFE, src.cutlet_type, 1, table_required = TRUE, screentip_verb = "Cut")

// De carne pra fiapos (quando é usado a faca)
/obj/item/food/meat/steak/bear
	cutlet_type = /obj/item/food/meat/cutlet/bear

/obj/item/food/meat/steak/chicken
	cutlet_type = /obj/item/food/meat/cutlet/chicken

/obj/item/food/meat/steak/gondola
	cutlet_type = /obj/item/food/meat/cutlet/gondola

/obj/item/food/meat/steak/killertomato
	cutlet_type = /obj/item/food/meat/cutlet/killertomato

/obj/item/food/meat/steak/penguin
	cutlet_type = /obj/item/food/meat/cutlet/penguin

/obj/item/food/meat/steak/plain
	cutlet_type = /obj/item/food/meat/cutlet/plain

/obj/item/food/meat/steak/plain/human
	cutlet_type = /obj/item/food/meat/cutlet/plain/human

/obj/item/food/meat/steak/spider
	cutlet_type = /obj/item/food/meat/cutlet/spider

/obj/item/food/meat/steak/xeno
	cutlet_type = /obj/item/food/meat/cutlet/xeno

// De almondega pra patty (quando é usado o rollingpin)
/obj/item/food/meatball
	proc/make_processable()
		if (!src.patty_type)
			return
		AddElement(/datum/element/processable, TOOL_ROLLINGPIN, src.patty_type, 1, table_required = TRUE, screentip_verb = "Flatten")

/obj/item/food/meatball/bear
	patty_type = /obj/item/food/patty/bear

/obj/item/food/meatball/chicken
	patty_type = /obj/item/food/patty/chicken

/obj/item/food/meatball/corgi
	patty_type = /obj/item/food/patty/corgi

/obj/item/food/meatball/xeno
	patty_type = /obj/item/food/patty/xeno

/obj/item/food/meatball/human
	patty_type = /obj/item/food/patty/human