/// ------------------------------------------------------------------------------------------ ///
/// MAPU BASE CLASS (NON-INTERACTIVE VERSION)
/// ------------------------------------------------------------------------------------------ ///

/obj/machinery/power/micro_reactor/mapu
	name = "PC MAPU"
	desc = "A modification of the micro reactor design, the Modular Antimatter Power Unit is a self-sustaining matter-antimatter \
		reaction chamber producing a steady stream of high-power output. Phoenix Collective says it's safe. Mostly."
	icon_state = "amreactor0_0"
	base_icon_state = "amreactor0"
	resistance_flags = INDESTRUCTIBLE

	interaction_flags_atom = INTERACT_ATOM_ATTACK_HAND

	power_gen = 5 MEGA WATTS
	is_mapu = TRUE

	light_color = COLOR_BIOLUMINESCENCE_PURPLE

	var/datum/looping_sound/generator/antimatter/soundloop2

/obj/machinery/power/micro_reactor/mapu/proc/TogglePowerMAPU()
	if(active)
		active = FALSE
		set_light_power(0)
		set_light_on(0)
		update_appearance()
		soundloop2.stop()
	else
		active = TRUE
		START_PROCESSING(SSmachines, src)
		set_light_power(4)
		set_light_range(5)
		set_light_on(TRUE)
		update_appearance()
		soundloop2.start()

/obj/machinery/power/micro_reactor/mapu/attack_hand(mob/user, list/modifiers)
	. = ..()
	TogglePowerMAPU()

/obj/machinery/power/micro_reactor/mapu/attack_robot(mob/user)
	. = ..()
	TogglePowerMAPU()

/obj/machinery/power/micro_reactor/mapu/Destroy()
	QDEL_NULL(soundloop2)
	return ..()

/obj/machinery/power/micro_reactor/mapu/Initialize(mapload)
	. = ..()
	soundloop2 = new(src, active)

/// ------------------------------------------------------------------------------------------ ///
/// FULLY FUNCTIONAL MAPU (INTERACTIVE, CAN MELTDOWN/DELAM/WHATEVER)
/// ------------------------------------------------------------------------------------------ ///

/obj/machinery/power/micro_reactor/mapu/functional
	desc = "EXTREME WIP DO NOT SPAWN - A modification of the micro reactor design, the Modular Antimatter Power Unit is a self-sustaining matter-antimatter \
		reaction chamber producing a steady stream of high-power output. Phoenix Collective says it's safe. Mostly."

	flags_1 = PREVENT_CONTENTS_EXPLOSION_1
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF | FREEZE_PROOF
	critical_machine = TRUE
	power_gen = 2 MEGA WATTS

	///Our current superstructure and core integrity levels.
	var/ss_integ = MAPU_INTEG_SUPER_MAX
	var/core_integ = MAPU_INTEG_CORE_MAX

	/// Disables all methods of taking damage. Effectively makes the MAPU immortal.
	var/disable_damage = FALSE
