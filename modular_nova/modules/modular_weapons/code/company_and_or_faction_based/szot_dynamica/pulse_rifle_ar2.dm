/obj/item/gun/ballistic/automatic/pulse_rifle/phoenix
	name = "\improper Žaibas Phoenix-DEF pulse rifle"
	desc = "A lightweight, military-grade retrofit of the Žaibas plasma pulse projector. This version, though cheaper for the Phoenix Collective to produce, \
		makes use of a cheaper heatsink that requires the weapon to be limited to providing 3-round-burst and semi-automatic fire. It still needs extended \
		magazines, though."

	icon = 'modular_nova/modules/modular_weapons/icons/obj/company_and_or_faction_based/szot_dynamica/guns_48.dmi'
	icon_state = "zaibas"

	worn_icon = 'modular_nova/modules/modular_weapons/icons/mob/company_and_or_faction_based/szot_dynamica/guns_worn.dmi'
	worn_icon_state = "zaibas"

	lefthand_file = 'modular_nova/modules/modular_weapons/icons/mob/company_and_or_faction_based/szot_dynamica/guns_lefthand.dmi'
	righthand_file = 'modular_nova/modules/modular_weapons/icons/mob/company_and_or_faction_based/szot_dynamica/guns_righthand.dmi'
	inhand_icon_state = "zaibas"

	SET_BASE_PIXEL(-8, 0)
	slot_flags = ITEM_SLOT_BACK
	bolt_type = BOLT_TYPE_LOCKING
	accepted_magazine_type = /obj/item/ammo_box/magazine/pulse/extended
	semi_auto = FALSE
	fire_sound = 'modular_nova/modules/modular_weapons/sounds/par2_fire.ogg'
	fire_sound_volume = 50
	lock_back_sound = 'modular_nova/modules/modular_weapons/sounds/par2_pull.ogg'
	bolt_drop_sound = 'modular_nova/modules/modular_weapons/sounds/par2_push.ogg'

	burst_size = 3
	fire_delay = 0.4 SECONDS
	burst_delay = 0.1 SECONDS

	spread = 10
	recoil = 0.3

	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	lore_blurb = "Žaibas represents the Heliostatic Coalition's pinnacle of plasma weapon miniaturization - at a cost.<br><br>\
		Where conventional plasma weapons use bulky rechargeable cells, Žaibas employs revolutionary crystalline compression \"plugs\" that store plasma \
		in a metastable state. When discharged, these plugs unleash their energy content in controlled pulses before shattering, providing unmatched \
		armor penetration at the expense of sustainability. Each military-grade magazine contains enough for approximately one hundred discharges.<br>\
		Early prototypes lacked simulated recoil, causing seasoned marksmen to overcompensate and miss shots. The solution? \
		A kinetic feedback system that mimics the kick of a .27-54 rifle, ensuring soldiers used to ballistic weapons could transition seamlessly. \
		This 'illusion of recoil' remains a signature feature.<br><br>\
		Developed during the Coalition's formative years, the weapon's origins are reflected in both its name and its operating principle - \
		delivering overwhelming force in brief, devastating strikes. While standard plasma weapons remain more practical for \
		most users, the Žaibas has found particular favor among Coalition shock troops and anti-materiel teams who value its ability to punch through \
		fortifications and powered armor with equal ease.<br><br>\
		A warning etched near the ejection port reminds users: 'NEPONOVLJATI NAPAJANJE - Kristalna matrika može srušiti se'."

/obj/item/gun/ballistic/automatic/pulse_rifle/phoenix/prenerf
	name = "\improper Žaibas Phoenix-MIL pulse rifle"
	desc = "A military-grade version of the Žaibas plasma pulse projector, refitted with a higher-quality heatsink allowing for sustained \
		fully automatic fire. It requires the usage of extended magazines to be combat-viable."

	icon = 'modular_nova/modules/modular_weapons/icons/obj/company_and_or_faction_based/szot_dynamica/guns_48.dmi'
	icon_state = "zaibas"

	worn_icon = 'modular_nova/modules/modular_weapons/icons/mob/company_and_or_faction_based/szot_dynamica/guns_worn.dmi'
	worn_icon_state = "zaibas"

	lefthand_file = 'modular_nova/modules/modular_weapons/icons/mob/company_and_or_faction_based/szot_dynamica/guns_lefthand.dmi'
	righthand_file = 'modular_nova/modules/modular_weapons/icons/mob/company_and_or_faction_based/szot_dynamica/guns_righthand.dmi'
	inhand_icon_state = "zaibas"

	SET_BASE_PIXEL(-8, 0)
	slot_flags = ITEM_SLOT_BACK
	bolt_type = BOLT_TYPE_LOCKING
	accepted_magazine_type = /obj/item/ammo_box/magazine/pulse/extended
	semi_auto = FALSE
	fire_sound = 'modular_nova/modules/modular_weapons/sounds/par2_fire.ogg'
	fire_sound_volume = 50
	lock_back_sound = 'modular_nova/modules/modular_weapons/sounds/par2_pull.ogg'
	bolt_drop_sound = 'modular_nova/modules/modular_weapons/sounds/par2_push.ogg'

	burst_size = 1
	fire_delay = 0.1 SECONDS
	actions_types = list()

	spread = 10
	recoil = 0.3

	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	lore_blurb = "Žaibas represents the Heliostatic Coalition's pinnacle of plasma weapon miniaturization - at a cost.<br><br>\
		Where conventional plasma weapons use bulky rechargeable cells, Žaibas employs revolutionary crystalline compression \"plugs\" that store plasma \
		in a metastable state. When discharged, these plugs unleash their energy content in controlled pulses before shattering, providing unmatched \
		armor penetration at the expense of sustainability. Each military-grade magazine contains enough for approximately one hundred discharges.<br>\
		Early prototypes lacked simulated recoil, causing seasoned marksmen to overcompensate and miss shots. The solution? \
		A kinetic feedback system that mimics the kick of a .27-54 rifle, ensuring soldiers used to ballistic weapons could transition seamlessly. \
		This 'illusion of recoil' remains a signature feature.<br><br>\
		Developed during the Coalition's formative years, the weapon's origins are reflected in both its name and its operating principle - \
		delivering overwhelming force in brief, devastating strikes. While standard plasma weapons remain more practical for \
		most users, the Žaibas has found particular favor among Coalition shock troops and anti-materiel teams who value its ability to punch through \
		fortifications and powered armor with equal ease.<br><br>\
		A warning etched near the ejection port reminds users: 'NEPONOVLJATI NAPAJANJE - Kristalna matrika može srušiti se'."

/obj/item/gun/ballistic/automatic/pulse_rifle/phoenix/prenerf/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.1 SECONDS)

/obj/item/gun/ballistic/automatic/pulse_rifle/phoenix/give_manufacturer_examine()
	AddElement(/datum/element/manufacturer_examine, COMPANY_REMOVED)
