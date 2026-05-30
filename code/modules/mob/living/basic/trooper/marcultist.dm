/// Marele Maestru's cultists. Glory to Peace.
/mob/living/basic/trooper/marcultist
	name = "Heretic Peacekeeper"
	desc = "Laturcae! Alatabae! Ectonae!"
	faction = list(FACTION_HERETIC)
	corpse = /obj/effect/mob_spawn/corpse/human/marcultist
	mob_spawner = /obj/effect/mob_spawn/corpse/human/marcultist
	unsuitable_atmos_damage = 0
	minimum_survivable_temperature = 0
	var/projectile_deflect_chance = 0

	maxHealth = 100
	health = 100

/mob/living/basic/trooper/marcultist/melee/bullet_act(obj/projectile/projectile)
	if(prob(projectile_deflect_chance))
		visible_message(span_danger("[src] blocks [projectile] with its shield!"))
		return BULLET_ACT_BLOCK
	return ..()

/mob/living/basic/trooper/marcultist/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_SPACEWALK, INNATE_TRAIT)

/// Melee Enemies Setup
/mob/living/basic/trooper/marcultist/melee // knife guy
	melee_damage_lower = 15
	melee_damage_upper = 15
	attack_verb_continuous = "slashes"
	attack_verb_simple = "slash"
	attack_sound = 'sound/items/weapons/bladeslice.ogg'
	attack_vis_effect = ATTACK_EFFECT_SLASH
	r_hand = /obj/item/knife/combat/survival

/mob/living/basic/trooper/marcultist/melee/axe // fire axe guy
	melee_damage_lower = 25
	melee_damage_upper = 25
	attack_verb_continuous = "chops"
	attack_verb_simple = "chop"
	attack_sound = 'sound/items/weapons/bladeslice.ogg'
	attack_vis_effect = ATTACK_EFFECT_SMASH
	r_hand = /obj/item/fireaxe

/mob/living/basic/trooper/marcultist/melee/hfblade // high frequency guy
	name = "Heretic Elite Peacecutter"
	corpse = /obj/effect/mob_spawn/corpse/human/marcultist
	mob_spawner = /obj/effect/mob_spawn/corpse/human/marcultist

	melee_damage_lower = 20
	melee_damage_upper = 40
	attack_verb_continuous = "slashes"
	attack_verb_simple = "slash"
	attack_sound = 'sound/items/weapons/bladeslice.ogg'
	attack_vis_effect = ATTACK_EFFECT_SLASH
	r_hand = /obj/item/highfrequencyblade

/// Ranged Enemies Setup
/mob/living/basic/trooper/marcultist/ranged
	ai_controller = /datum/ai_controller/basic_controller/trooper/ranged
	r_hand = /obj/item/gun/ballistic/automatic/pistol
	/// Type of bullet we use
	var/casingtype = /obj/item/ammo_casing/c9mm
	/// Type of bullet we use (projectile ver.)
	var/projectiletype
	/// Sound to play when firing weapon
	var/projectilesound = 'sound/items/weapons/gun/pistol/shot.ogg'
	/// number of burst shots
	var/burst_shots
	/// Time between taking shots
	var/ranged_cooldown = 1 SECONDS

/mob/living/basic/trooper/marcultist/ranged/Initialize(mapload)
	. = ..()
	AddComponent(\
		/datum/component/ranged_attacks,\
		casing_type = casingtype,\
		projectile_type = projectiletype,\
		projectile_sound = projectilesound,\
		cooldown_time = ranged_cooldown,\
		burst_shots = burst_shots,\
	)
	if (ranged_cooldown <= 1 SECONDS)
		AddComponent(/datum/component/ranged_mob_full_auto)

/// Actually interesting ranged enemies
/mob/living/basic/trooper/marcultist/ranged/plaspistol // plasma pistol guy
	casingtype = null
	projectiletype = /obj/item/ammo_casing/energy/laser/plasma_glob
	projectilesound = 'modular_nova/modules/modular_weapons/sounds/laser_firing/incinerate.ogg'
	ranged_cooldown = 2 SECONDS
	r_hand = /obj/item/gun/ballistic/automatic/pistol/plasma_thrower

/mob/living/basic/trooper/marcultist/ranged/pulserifle // civilian AR2 guy
	casingtype = null
	projectiletype = /obj/projectile/beam/laser/plasma_glob/pulse
	projectilesound = 'modular_nova/modules/modular_weapons/sounds/pulse_shoot.ogg'
	ai_controller = /datum/ai_controller/basic_controller/trooper/ranged/burst
	burst_shots = 3
	ranged_cooldown = 3 SECONDS
	r_hand = /obj/item/gun/ballistic/automatic/pulse_rifle

/mob/living/basic/trooper/marcultist/ranged/pulsesniper // pulse sniper guy
	casingtype = null
	projectiletype = /obj/projectile/beam/laser/plasma_glob/pulse
	projectilesound = 'modular_nova/modules/modular_weapons/sounds/pulse_shoot.ogg'
	ranged_cooldown = 5 SECONDS
	r_hand = /obj/item/gun/ballistic/rifle/pulse_sniper
