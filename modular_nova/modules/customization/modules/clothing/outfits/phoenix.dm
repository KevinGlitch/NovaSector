/// ------------------------------------------------------------------------------------------ ///
/// PHOENIX IMPERIAL PERSONNEL OUTFITS
/// ------------------------------------------------------------------------------------------ ///

/// ASSISTANT DEFAULT OUTFIT
/datum/outfit/phoenix
	name = "Phoenix Collective Imperial"

	id = /obj/item/card/id/advanced/black/phoenix
	belt = /obj/item/modular_computer/pda/assistant
	uniform = /obj/item/clothing/under/misc/nova/utility
	shoes = /obj/item/clothing/shoes/jackboots/peacekeeper
	gloves = /obj/item/clothing/gloves/color/black
	back = /obj/item/storage/backpack/industrial/frontier_colonist

/// ASSISTANT PLASMAMAN OUTFIT
/datum/outfit/phoenix/pm
	name = "Phoenix Collective Imperial (Plasmaman)"

	head = /obj/item/clothing/head/helmet/space/plasmaman/security
	uniform = /obj/item/clothing/under/plasmaman/black
	gloves = /obj/item/clothing/gloves/color/plasmaman/black
	mask = /obj/item/clothing/mask/gas/sechailer/plasmaman
	r_pocket = /obj/item/tank/internals/plasmaman/belt/full

/// AUTOMATIC MINDSHIELD IMPLANTING
/datum/outfit/phoenix/post_equip(mob/living/carbon/human/phoenixguy, visuals_only = FALSE)
	if(visuals_only)
		return
	var/obj/item/implant/mindshield/mindshield = new /obj/item/implant/mindshield(phoenixguy)
	mindshield.implant(phoenixguy, null, silent = TRUE)

	var/obj/item/card/id/ID = phoenixguy.wear_id
	ID.registered_name = phoenixguy.real_name
	ID.update_label()

/// ------------------------------------------------------------------------------------------ ///
/// EMERGENCY RESPONSE TEAMS
/// ------------------------------------------------------------------------------------------ ///

/datum/outfit/phoenix/ert/command
	name = "Phoenix Collective ERT - Commander"

	id = /obj/item/card/id/advanced/black/phoenix/ert/cmdr
	belt = /obj/item/storage/medkit/frontier/phoenix/stocked
	suit = /obj/item/clothing/suit/armor/vest/sol/marine/mk2
	suit_store = /obj/item/gun/ballistic/automatic/pulse_rifle/phoenix
	head = /obj/item/clothing/head/helmet/solfed/mk2
	uniform = /obj/item/clothing/under/rank/security/nova/utility
	shoes = /obj/item/clothing/shoes/winterboots/ice_boots/eva
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	back = /obj/item/mod/control/pre_equipped/phoenix/command
	box = /obj/item/storage/box/survival/centcom
	ears = /obj/item/radio/headset/phoenix/ert/cmdr
	glasses = /obj/item/clothing/glasses/hud/health/night/science
	mask = /obj/item/clothing/mask/gas/sechailer
	l_pocket = /obj/item/melee/energy/sword/saber/red
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/plasma_marksman = 1,
		/obj/item/ammo_box/magazine/pulse/extended = 3,
		/obj/item/ammo_box/magazine/recharge/plasma_battery = 2,
		/obj/item/storage/box/alienhandcuffs = 1,
		/obj/item/storage/box/nri_flares = 1,
		/obj/item/beamout_tool = 1,
		/obj/item/modular_computer/pda/ceti = 1,
	)
	l_hand = null
	r_hand = null

/datum/outfit/phoenix/ert/command/elite
	name = "Phoenix Collective ERT - Cmd-Elite"

	id = /obj/item/card/id/advanced/black/phoenix/ert/cmdr/elite
	suit_store = /obj/item/gun/ballistic/automatic/pulse_rifle/phoenix/prenerf
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/plasma_marksman = 1,
		/obj/item/ammo_box/magazine/pulse/extended = 3,
		/obj/item/ammo_box/magazine/recharge/plasma_battery = 2,
		/obj/item/storage/box/alienhandcuffs = 1,
		/obj/item/storage/box/fragnades = 1,
		/obj/item/storage/box/flashbangs = 1,
		/obj/item/storage/box/nri_flares = 1,
		/obj/item/beamout_tool = 1,
		/obj/item/modular_computer/pda/ceti = 1,
	)

/datum/outfit/phoenix/ert/command/pm
	name = "Phoenix Collective ERT - Commander (Plasmaman)"

	head = /obj/item/clothing/head/helmet/space/plasmaman/security
	uniform = /obj/item/clothing/under/plasmaman/security
	gloves = /obj/item/clothing/gloves/color/plasmaman/black
	mask = /obj/item/clothing/mask/gas/sechailer/plasmaman
	r_pocket = /obj/item/tank/internals/plasmaman/belt/full

/datum/outfit/phoenix/ert/command/elite/pm
	name = "Phoenix Collective ERT - Cmd-Elite (Plasmaman)"

	head = /obj/item/clothing/head/helmet/space/plasmaman/security
	uniform = /obj/item/clothing/under/plasmaman/security
	gloves = /obj/item/clothing/gloves/color/plasmaman/black
	mask = /obj/item/clothing/mask/gas/sechailer/plasmaman
	r_pocket = /obj/item/tank/internals/plasmaman/belt/full

/datum/outfit/phoenix/ert/security
	name = "Phoenix Collective ERT - Security"

	id = /obj/item/card/id/advanced/black/phoenix/ert/sec
	belt = /obj/item/storage/medkit/frontier/phoenix/stocked
	suit = /obj/item/clothing/suit/armor/vest/sol/marine/mk2
	suit_store = /obj/item/gun/ballistic/automatic/pulse_rifle/phoenix
	head = /obj/item/clothing/head/helmet/solfed/mk2
	uniform = /obj/item/clothing/under/rank/security/nova/utility
	shoes = /obj/item/clothing/shoes/winterboots/ice_boots/eva
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	back = /obj/item/mod/control/pre_equipped/phoenix/security
	box = /obj/item/storage/box/survival/centcom
	ears = /obj/item/radio/headset/phoenix/ert
	glasses = /obj/item/clothing/glasses/hud/health/night/science
	l_pocket = /obj/item/melee/energy/sword/saber/red
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double
	mask = /obj/item/clothing/mask/gas/sechailer
	backpack_contents = list(
		/obj/item/ammo_box/magazine/pulse/extended = 4,
		/obj/item/gun/energy/disabler/smg = 1,
		/obj/item/storage/box/alienhandcuffs = 1,
		/obj/item/storage/box/flashbangs = 1,
		/obj/item/storage/box/nri_flares = 1,
		/obj/item/beamout_tool = 1,
		/obj/item/modular_computer/pda/ceti = 1,
	)
	l_hand = null
	r_hand = null

/datum/outfit/phoenix/ert/security/elite
	name = "Phoenix Collective ERT - Sec-Elite"

	id = /obj/item/card/id/advanced/black/phoenix/ert/sec/elite
	suit_store = /obj/item/gun/ballistic/automatic/pulse_rifle/phoenix/prenerf
	backpack_contents = list(
		/obj/item/ammo_box/magazine/pulse/extended = 6,
		/obj/item/storage/box/fragnades = 1,
		/obj/item/storage/box/flashbangs = 1,
		/obj/item/storage/box/nri_flares = 1,
		/obj/item/beamout_tool = 1,
		/obj/item/modular_computer/pda/ceti = 1,
	)

/datum/outfit/phoenix/ert/security/pm
	name = "Phoenix Collective ERT - Security (Plasmaman)"

	head = /obj/item/clothing/head/helmet/space/plasmaman/security
	uniform = /obj/item/clothing/under/plasmaman/security
	gloves = /obj/item/clothing/gloves/color/plasmaman/black
	mask = /obj/item/clothing/mask/gas/sechailer/plasmaman
	r_pocket = /obj/item/tank/internals/plasmaman/belt/full

/datum/outfit/phoenix/ert/security/elite/pm
	name = "Phoenix Collective ERT - Sec-Elite (Plasmaman)"

	head = /obj/item/clothing/head/helmet/space/plasmaman/security
	uniform = /obj/item/clothing/under/plasmaman/security
	gloves = /obj/item/clothing/gloves/color/plasmaman/black
	mask = /obj/item/clothing/mask/gas/sechailer/plasmaman
	r_pocket = /obj/item/tank/internals/plasmaman/belt/full

/datum/outfit/phoenix/ert/medic
	name = "Phoenix Collective ERT - Medical"

	id = /obj/item/card/id/advanced/black/phoenix/ert/med
	belt = /obj/item/storage/belt/medical/ert
	suit = /obj/item/clothing/suit/armor/vest/sol/marine/mk2
	suit_store = /obj/item/gun/medbeam
	head = /obj/item/clothing/head/helmet/solfed/mk2
	uniform = /obj/item/clothing/under/rank/security/nova/utility
	shoes = /obj/item/clothing/shoes/winterboots/ice_boots/eva
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	back = /obj/item/mod/control/pre_equipped/phoenix/medical/surgical
	box = /obj/item/storage/box/survival/centcom
	ears = /obj/item/radio/headset/phoenix/ert
	glasses = /obj/item/clothing/glasses/hud/health/night/science
	mask = /obj/item/clothing/mask/gas/sechailer
	l_pocket = /obj/item/melee/energy/sword/saber/red
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double
	backpack_contents = list(
		/obj/item/storage/medkit/frontier/phoenix/stocked = 1,
		/obj/item/storage/medkit/frontier/phoenix/toxin/stocked = 1,
		/obj/item/storage/medkit/frontier/phoenix/oxygen/stocked = 1,
		/obj/item/bodybag/stasis = 2,
		/obj/item/gun/ballistic/automatic/pistol/plasma_thrower = 1,
		/obj/item/ammo_box/magazine/recharge/plasma_battery = 3,
		/obj/item/storage/box/nri_flares = 1,
		/obj/item/beamout_tool = 1,
		/obj/item/modular_computer/pda/ceti = 1,
	)
	l_hand = null
	r_hand = null

/datum/outfit/phoenix/ert/medic/pm
	name = "Phoenix Collective ERT - Medical (Plasmaman)"

	head = /obj/item/clothing/head/helmet/space/plasmaman/security
	uniform = /obj/item/clothing/under/plasmaman/security
	gloves = /obj/item/clothing/gloves/color/plasmaman/black
	mask = /obj/item/clothing/mask/gas/sechailer/plasmaman
	r_pocket = /obj/item/tank/internals/plasmaman/belt/full

/datum/outfit/phoenix/ert/engie
	name = "Phoenix Collective ERT - Engineering"

	id = /obj/item/card/id/advanced/black/phoenix/ert/eng
	belt = /obj/item/storage/belt/utility/chief/full
	suit = /obj/item/clothing/suit/armor/vest/sol/marine/mk2
	suit_store = /obj/item/gun/ballistic/automatic/napad
	head = /obj/item/clothing/head/helmet/solfed/mk2
	uniform = /obj/item/clothing/under/rank/security/nova/utility
	shoes = /obj/item/clothing/shoes/winterboots/ice_boots/eva
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	back = /obj/item/mod/control/pre_equipped/phoenix/engineer
	box = /obj/item/storage/box/survival/centcom
	ears = /obj/item/radio/headset/phoenix/ert
	glasses = /obj/item/clothing/glasses/hud/health/night/science
	mask = /obj/item/clothing/mask/gas/sechailer
	l_pocket = /obj/item/melee/energy/sword/saber/red
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double
	backpack_contents = list(
		/obj/item/ammo_box/magazine/napad = 6,
		/obj/item/lightreplacer/blue = 1,
		/obj/item/storage/box/nri_flares = 1,
		/obj/item/beamout_tool = 1,
		/obj/item/modular_computer/pda/ceti = 1,
	)
	l_hand = null
	r_hand = null

/datum/outfit/phoenix/ert/engie/pm
	name = "Phoenix Collective ERT - Engineering (Plasmaman)"

	head = /obj/item/clothing/head/helmet/space/plasmaman/security
	uniform = /obj/item/clothing/under/plasmaman/security
	gloves = /obj/item/clothing/gloves/color/plasmaman/black
	mask = /obj/item/clothing/mask/gas/sechailer/plasmaman
	r_pocket = /obj/item/tank/internals/plasmaman/belt/full

/// ------------------------------------------------------------------------------------------ ///
/// CENTRAL COMMAND AND SECTOR OPERATIONS
/// ------------------------------------------------------------------------------------------ ///
/datum/outfit/phoenix/centcom
	name = "Phoenix Collective CentCom Official"

	id = /obj/item/card/id/advanced/black/phoenix/centcom/secops
	suit = /obj/item/clothing/suit/armor/vest/darkcarapace
	suit_store = null
	uniform = /obj/item/clothing/under/rank/captain/nova/utility
	shoes = /obj/item/clothing/shoes/laceup
	back = /obj/item/mod/control/pre_equipped/phoenix/command
	box = /obj/item/storage/box/survival/centcom
	ears = /obj/item/radio/headset/phoenix/cc
	glasses = /obj/item/clothing/glasses/hud/medsechud
	l_pocket = /obj/item/melee/energy/sword/saber/red
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/clandestine/unrestricted = 1,
		/obj/item/ammo_box/magazine/m10mm/hp = 3,
		/obj/item/flashlight/seclite = 1,
		/obj/item/beamout_tool = 1,
		/obj/item/modular_computer/pda/ceti = 1,
	)
	l_hand = null
	r_hand = null

/datum/outfit/phoenix/centcom/cutefrisk
	name = "Phoenix Collective CC - Azre's Loadout"

	id = /obj/item/card/id/advanced/black/phoenix/centcom/secops
	belt = /obj/item/storage/belt/utility/chief
	suit = /obj/item/clothing/suit/armor/vest/darkcarapace
	suit_store = null
	head = null
	uniform = /obj/item/clothing/under/rank/security/head_of_security/nova/alt
	shoes = /obj/item/clothing/shoes/winterboots/ice_boots/eva
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	back = /obj/item/mod/control/pre_equipped/phoenix/engineer/cutefrisk
	box = /obj/item/storage/box/survival/centcom
	ears = /obj/item/radio/headset/phoenix/cc
	glasses = /obj/item/clothing/glasses/hud/diagnostic/night
	mask = /obj/item/clothing/mask/gas/sechailer
	l_pocket = /obj/item/storage/bag/sheetsnatcher/debug
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double
	backpack_contents = list(
		/obj/item/storage/part_replacer/bluespace/tier4maxout = 1,
		/obj/item/storage/toolbox/guncase/nova/opfor/phoenix/pulserifle/def/cutefrisk = 1,
		/obj/item/storage/box/phoenixcc/azre = 1,
		/obj/item/storage/box/cables = 1,
		/obj/item/modular_computer/pda/heads/rd = 1,
		/obj/item/stock_parts/power_store/cell/infinite/nif_cell = 1,
		/obj/item/dualsaber/purple = 1,
		/obj/item/flashlight/seclite = 1,
		/obj/item/beamout_tool = 1,
	)
	belt_contents = list(
		/obj/item/weldingtool/experimental = 1,
		/obj/item/construction/rcd/ce = 1,
		/obj/item/crowbar/power = 1,
		/obj/item/construction/rtd/loaded = 1,
		/obj/item/construction/rld = 1,
		/obj/item/pipe_dispenser/bluespace = 1,
		/obj/item/analyzer/ranged = 1,
	)
	l_hand = null
	r_hand = null

/datum/outfit/phoenix/centcom/cutefrisk/post_equip(mob/living/carbon/human/phoenixguy, visuals_only = FALSE)
	if(visuals_only)
		return
	. = ..()

	var/obj/item/organ/cyberimp/arm/toolkit/toolset/engtools = new /obj/item/organ/cyberimp/arm/toolkit/toolset()
	var/obj/item/organ/cyberimp/chest/nutriment/plus/nutri = new /obj/item/organ/cyberimp/chest/nutriment/plus()
	var/obj/item/organ/cyberimp/chest/spine/spinal = new /obj/item/organ/cyberimp/chest/spine()
	engtools.Insert(phoenixguy)
	nutri.Insert(phoenixguy)
	spinal.Insert(phoenixguy)
