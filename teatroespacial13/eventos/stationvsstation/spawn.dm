/obj/effect/step_trigger/armbandgiver
    var/obj/armband
    var/obj/headset
    var/obj/suit

/obj/effect/step_trigger/armbandgiver/syndicate
    armband = /obj/item/clothing/accessory/armband
    headset = /obj/item/radio/headset/syndicate/alt
    suit = /obj/item/clothing/under/syndicate/nova/baseball

/obj/effect/step_trigger/armbandgiver/nanotrasen
    armband = /obj/item/clothing/accessory/armband/deputy/lopland/nonsec
    headset = /obj/item/radio/headset/heads/captain/alt
    suit = /obj/item/clothing/under/rank/security/peacekeeper/jumpsuit

/obj/effect/step_trigger/armbandgiver/Trigger(atom/movable/A)
    if(!ishuman(A))
        return

    var/mob/living/carbon/human/H = A

    if(suit)
        var/obj/item/clothing/under/new_suit = new suit()
        if(!H.equip_to_appropriate_slot(new_suit))
            if(!H.dropItemToGround(H.w_uniform)) // Remove uniforme atual se existir
                qdel(new_suit)
                return
            H.equip_to_appropriate_slot(new_suit)
        to_chat(H, span_notice("Você recebeu um novo uniforme: [new_suit.name]!"))

    if(armband)
        var/obj/item/clothing/accessory/new_armband = new armband()
        var/obj/item/clothing/under/uniform = H.w_uniform
        if(uniform && !uniform.attach_accessory(new_armband, H))
            qdel(new_armband)
        else
            to_chat(H, span_notice("Uma braçadeira [new_armband.name] foi adicionada ao seu uniforme!"))

    if(headset)
        var/obj/item/radio/headset/new_headset = new headset()
        if(!H.equip_to_slot_if_possible(new_headset, ITEM_SLOT_EARS, disable_warning = TRUE))
            qdel(new_headset)
        else
            to_chat(H, span_notice("Um headset [new_headset.name] foi equipado em você!"))
