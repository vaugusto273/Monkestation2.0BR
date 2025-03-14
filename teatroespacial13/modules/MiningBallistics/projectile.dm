/obj/item/ammo_casing/c27_54cesarzowa/hunter
    name = "hunter c27_54 shell"
    desc = "A c27_54 shell that fires specially designed shells that deal extra damage to the local planetary fauna"
    icon = 'monkestation/code/modules/blueshift/icons/obj/company_and_or_faction_based/szot_dynamica/ammo.dmi'
    icon_state = "27-54cesarzowa"
    projectile_type = /obj/projectile/bullet/c27_54cesarzowa/hunter

/obj/projectile/bullet/c27_54cesarzowa/hunter
    name = "c27_54 Hunter shell"
    damage = 8
    range = 20
    /// How much the damage is multiplied by when we hit a mob with the correct biotype
    var/biotype_damage_multiplier = 3
    /// What biotype we look for
    var/biotype_we_look_for = MOB_BEAST

/obj/projectile/bullet/c27_54cesarzowa/hunter/on_hit(atom/target, blocked, pierce_hit)
    if(ismineralturf(target))
        var/turf/closed/mineral/mineral_turf = target
        mineral_turf.gets_drilled(firer, FALSE)
        if(range > 0)
            return BULLET_ACT_FORCE_PIERCE
        return ..()
    if(!isliving(target) || (damage > initial(damage)))
        return ..()
    var/mob/living/target_mob = target
    if(target_mob.mob_biotypes & biotype_we_look_for || istype(target_mob, /mob/living/simple_animal/hostile/megafauna))
        damage *= biotype_damage_multiplier
    return ..()

/obj/projectile/bullet/c27_54cesarzowa/hunter/Initialize(mapload)
    . = ..()
    AddElement(/datum/element/bane, mob_biotypes = MOB_BEAST, damage_multiplier = 3)
