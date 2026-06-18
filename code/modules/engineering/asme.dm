/obj/machinery/arc_sing_mat_extract
	name = "ASME"

	base_icon_state = "idle"
	circuit = /obj/item/circuitboard/machine/arc_sing_mat_extract
	desc = "A heavy, durable, and complicated machine designed by Arcanum Research Corporation to extract matter from a singularity."
	icon = 'icons/obj/machines/asme.dmi'
	pixel_x = -16
	icon_state = "idle"
	max_integrity = 300
	obj_flags = BLOCKS_CONSTRUCTION
	state_open = TRUE
	interaction_flags_mouse_drop = NEED_HANDS | NEED_DEXTERITY
	resistance_flags = INDESTRUCTIBLE
	light_power = 0
	light_color = LIGHT_COLOR_PURPLE
	active_power_usage = BASE_MACHINE_ACTIVE_CONSUMPTION * 25
	critical_machine = TRUE /// Force APC to stay on.

	///Note; Icon states
	///"idle" is the machine with no bluespace crystal.
	///"idle_bsp" is the machine idling with a bluespace crystal.
	///"charge_0" is the machine charging near 20% for startup (has bluespace crystal)
	///"charge_1" is the machine charging near 50% for startup (containment forming)
	///"charge_2" is the machine charging near 80% for startup (containment formed)
	///"active" is the machine running with a contained singularity.
	///"shutdown" is the default shutdown state. This animation runs until the singularity has collapsed, or containment failed.
	///"nocont" is the state in which the machine is no longer able to contain the singularity, releasing it.

	/// Whether we have a crystal or not. A crystal can be given if this is FALSE.
	var/hasBluespaceCrystal = FALSE

	/// Containment Units.
	var/containment = 0

	/// Maximum Containment Units.
	var/containmentMax = 10000

	/// Percent Startup Charge expressed in a number ranging from 0 to 10000.
	var/startCharge = 0

	/// Maintenance Panel Lock State, if FALSE, the panel can be opened. If TRUE, it's locked shut.
	/// This should prevent untimely deconstruction via screwdriver & crowbar, especially if the
	/// machine is actively holding a singularity.
	var/maintLock = FALSE

	/// Operational Status.
	/// Can be the name of the icon states.
	var/opState = "idle"

	/// Extraction Efficiency, controlled by the tier of Micro Lasers.
	var/extractEff = 1

	/// Startup Charging Efficiency, controlled by the tier of Power Cells.
	var/chargeEff = 1

	/// Containment Rebuild Efficiency, controlled by the tier of Capacitors.
	var/contBuildEff = 1

	/// Storage Space per material, Controlled by the tier of Matter Bins.
	var/storageSpace = 20

	/// Current storage contents.
	var/list/storedSheets = list(
		"iron" = 0
		"glass" = 0
		"plastic" = 0
		"titanium" = 0
		"plasma" = 0
		"silver" = 0
		"gold" = 0
		"uranium" = 0
		"diamond" = 0
		"bluespace" = 0
	)
	/// Don't even get me started on bananium.

	/// Current storage contents.
	var/list/genRates = list(
		"iron" = 0.0015
		"glass" = 0.0015
		"plastic" = 0.00125
		"titanium" = 0.001
		"plasma" = 0.0009
		"silver" = 0.00075
		"gold" = 0.0003
		"uranium" = 0.00075
		"diamond" = 0.00044
		"bluespace" = 0.0008
	)
	/// Don't even get me started on bananium.

	/// General purpose clock.
	var/asmeClock = 0

/obj/machinery/arc_sing_mat_extract/default_deconstruction_screwdriver(mob/user, icon_state_open, icon_state_closed, obj/item/screwdriver)
	if(screwdriver.tool_behaviour != TOOL_SCREWDRIVER)
		return FALSE

	if(maintLock) ///maintLock is only ever true if the machine is running, which requires the panel to be closed.
		to_chat(user, span_notice("The maintenance panel on the ASME is locked, and can't be opened."))
		return FALSE

	screwdriver.play_tool_sound(src, 50)
	toggle_panel_open()
	if(panel_open)
		icon_state = icon_state_open
		to_chat(user, span_notice("You open the maintenance hatch of [src]."))
	else
		icon_state = icon_state_closed
		to_chat(user, span_notice("You close the maintenance hatch of [src]."))
	return TRUE

/obj/machinery/arc_sing_mat_extract/examine(mob/user)
	. = ..()

	switch(opState)
		if("idle") . += span_notice("The ASME is [EXAMINE_HINT("idle")], waiting for a Bluespace Crystal.")
		if("idle_bsp") . += span_notice("The ASME is [EXAMINE_HINT("idle")], waiting for the command to begin Startup.")
		if("charge_0","charge_1","charge_2") . += span_notice("The ASME is [EXAMINE_HINT("charging")] for Startup.")
		if("active") . += span_notice("The ASME is [EXAMINE_HINT("active")] and extracting resources from its singularity.")
		if("shutdown","shutdown_fail") . += span_notice("The ASME is [EXAMINE_HINT("Attempting to Shutdown")]...")
		if("nocont") . += span_notice("The ASME has released its singularity! (You shouldn't be able to see this!!!)")
		else . += span_notice("The ASME is in a bugged operating status; [EXAMINE_HINT(opState)]")

	. += span_notice("The ASME's Matter Extraction efficiency is at [EXAMINE_HINT(extractEff + "x")].")
	. += span_notice("The ASME's Startup Charging efficiency is at [EXAMINE_HINT(chargeEff + "x")].")
	. += span_notice("The ASME's Containment Recovery efficiency is at [EXAMINE_HINT(contBuildEff + "x")].")
	. += span_notice("The ASME's Sheet Storage Capacity is at [EXAMINE_HINT(storageSpace)].")

	if(!maintLock)
		. += span_notice("Its maintenance panel can be [EXAMINE_HINT("screwed")] [panel_open ? "close" : "open"].")
	else
		. += span_notice("Its maintenance panel is locked shut. Shut down the ASME to access it.")

/obj/machinery/arc_sing_mat_extract/exchange_parts(mob/living/user,obj/item/storage/part_replacer)
	var/list/obj/item/part_list = part_replacer/get_sorted_parts()
	///component_parts = this machine's part list.

	if(!istype(replacer_tool) || !component_parts)
		return FALSE

	var/works_from_distance = istype(replacer_tool, /obj/item/storage/part_replacer/bluespace)
	if(!panel_open && !works_from_distance)
		to_chat(user, display_parts(user))
		return FALSE

	///Forego circuitboard searching. We already have one.
	/**
	 * sorting is very important especially because we are breaking out when required part is found in the inner for loop
	 * if the rped first picked up a tier 3 part AND THEN a tier 4 part
	 * tier 3 would be installed and the loop would break and check for the next required component thus
	 * completly ignoring the tier 4 component inside
	 * we also ignore stack components inside the RPED cause we dont exchange that
	 */
	var/shouldplaysound = FALSE
	var/list/part_list = replacer_tool.get_sorted_parts(ignore_stacks = TRUE)
	var/list/part_list_stacks = replacer_tool.get_sorted_parts(ignore_stacks = FALSE)

	if(!hasBluespaceCrystal) ///Must not already have one.
		if(!part_list_stacks.len)
			/// We've got PARTS!!!
			/// Find a stack of bluespace crystal or polycrystal. Remove one and set hasBluespaceCrystal to TRUE.
			/// - /obj/item/stack/ore/bluespace_crystal
			/// - /obj/item/stack/sheet/bluespace_crystal
			for(var/replacer_sheet in part_list_stacks)
				if(istype(replacer_sheet,/obj/item/stack/ore/bluespace_crystal) || istype(replacer_sheet,/obj/item/stack/sheet/bluespace_crystal))
					/// Use Following code to indicate a crystal was inserted.
					to_chat(user, span_notice("Gave a [capitalize(replacer_sheet.name)] to the ASME."))
					shouldplaysound = TRUE
					break

	if(!part_list.len)
		return FALSE
	for(var/primary_part_base in component_parts)
		//we exchanged all we could time to bail
		if(!part_list.len)
			break

		var/current_rating
		var/required_type

		//we dont exchange circuitboards cause thats dumb
		if(istype(primary_part_base, /obj/item/circuitboard))
			continue
		else if(istype(primary_part_base, /datum/stock_part))
			var/datum/stock_part/primary_stock_part = primary_part_base
			current_rating = primary_stock_part.tier
			required_type = primary_stock_part.physical_object_base_type
		else
			var/obj/item/primary_stock_part_item = primary_part_base
			current_rating = primary_stock_part_item.get_part_rating()
			for(var/design_type in machine_board.req_components)
				if(ispath(primary_stock_part_item.type, design_type))
					required_type = design_type
					break

		for(var/obj/item/secondary_part in part_list)
			if(!istype(secondary_part, required_type))
				continue
			// If it's a corrupt or rigged cell, attempting to send it through Bluespace could have unforeseen consequences.
			if(istype(secondary_part, /obj/item/stock_parts/power_store/cell) && works_from_distance)
				var/obj/item/stock_parts/power_store/cell/checked_cell = secondary_part
				// If it's rigged or corrupted, max the charge. Then explode it.
				if(checked_cell.rigged || checked_cell.corrupted)
					checked_cell.charge = checked_cell.maxcharge
					checked_cell.explode()
					break
			if(secondary_part.get_part_rating() > current_rating)
				//store name of part incase we qdel it below
				var/secondary_part_name = secondary_part.name
				if(replacer_tool.atom_storage.attempt_remove(secondary_part, src))
					if (istype(primary_part_base, /datum/stock_part))
						var/stock_part_datum = GLOB.stock_part_datums_per_object[secondary_part.type]
						if (isnull(stock_part_datum))
							CRASH("[secondary_part] ([secondary_part.type]) did not have a stock part datum (was trying to find [primary_part_base])")
						component_parts += stock_part_datum
						part_list -= secondary_part //have to manually remove cause we are no longer refering replacer_tool.contents
						qdel(secondary_part)
					else
						component_parts += secondary_part
						secondary_part.forceMove(src)
						part_list -= secondary_part //have to manually remove cause we are no longer refering replacer_tool.contents

				component_parts -= primary_part_base

				var/obj/physical_part
				if (istype(primary_part_base, /datum/stock_part))
					var/datum/stock_part/stock_part_datum = primary_part_base
					var/physical_object_type = stock_part_datum.physical_object_type
					physical_part = new physical_object_type
				else
					physical_part = primary_part_base

				replacer_tool.atom_storage.attempt_insert(physical_part, user, TRUE, force = STORAGE_SOFT_LOCKED)
				to_chat(user, span_notice("[capitalize(physical_part.name)] replaced with [secondary_part_name]."))
				shouldplaysound = TRUE //Only play the sound when parts are actually replaced!
				break

	RefreshParts()

	if(shouldplaysound)
		replacer_tool.play_rped_effect()
	return TRUE

/obj/machinery/arc_sing_mat_extract/RefreshParts(mob/living/user,obj/item/storage/part_replacer/replacer_toolsrc)
	var laserAvg = 0
	var capAvg = 0
	var megacellAvg = 0
	var binAvg = 0
	var cellAvg = 0

	for(var/datum/stock_part/part in component_parts)
		switch(part)
			if(/datum/stock_part/micro_laser)
				laserAvg += part.tier
			if(/datum/stock_part/capacitor)
				capAvg += part.tier
			if(/obj/item/stock_parts/power_store/battery)
				megacellAvg += part.tier
			if(/obj/item/stock_parts/power_store/cell)
				cellAvg += part.tier
			if(/datum/stock_part/matter_bin)
				binAvg += part.tier

	/// Add an extra 6% to resource extraction at T4 Micro-Lasers.
	extractEff = 1 + ((laserAvg/12)*0.06)

	/// Add up to 30,000 extra containment units for T4 Megacells.
	containmentMax = 10000 + ((megacellAvg/6)*30000)

	/// Add an extra 2x to startup charging speed.
	chargeEff = 1 + ((cellAvg/5)*2)

	/// Add an extra 5x to Containment Rebuild Speed.
	contBuildEff = 1 + ((capAvg/12)*5)

	/// Add an extra 80 stack size.
	storageSpace = 20 + ((binAvg/5)*80)

/obj/machinery/arc_sing_mat_extract/ui_status(mob/user, datum/ui_state/state)
	if(!is_operational)
		return UI_CLOSE

	if(opState == "nocont")
		return UI_CLOSE

	return ..()

/obj/machinery/arc_sing_mat_extract/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "Arcanum Singularity Matter Extractor")
		ui.open()

/obj/machinery/arc_sing_mat_extract/ui_data(mob/user)
	var/list/data = list()
	data["status"] = opState
	data["containment"] = containment
	data["containment_max"] = containmentMax
	data["start_charge"] = startCharge
	data["eff_extract"] = extractEff
	data["eff_charge"] = chargeEff
	data["eff_contBuild"] = contBuildEff
	data["storage_cap"] = storageSpace
	for(var/genIndex in list("iron","glass","plastic","titanium","plasma","silver","gold","uranium","diamond","bluespace"))
		data["genrate_" + genIndex] = genRates[genIndex]
		data["storage_" + genIndex] = storedSheets[genIndex]

	return data

/obj/machinery/arc_sing_mat_extract/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	switch(action)
		if("startup")
			if(hasBluespaceCrystal)
				to_chat(usr, span_info("The ASME begins starting..."))
				opState = "charge"
				icon_state = "charge_0"
			else
				to_chat(usr, span_info("The ASME requires a Bluespace Crystal to perform startup."))
		if("shutdown")
			to_chat(usr, span_info("The ASME begins shutting down..."))
			///TODO: Make shutdown animations.
			if(opState == "active")
				asmeClock = 200 ///20 Seconds
				if(containment > 250)
					///Shutdown can't work if we've already deteriorated too far.
					opState = "shutdown"
				else
					///Shutdown fail!
					opState = "shutdown_fail"
					/// Remember those 20 seconds? Run.

/obj/machinery/arc_sing_mat_extract/process()
	///Ticker.
	switch(opState)
		if("idle")
			if(containment < containmentMax)
				containment += (contBuildEff*200) ///2% base recovery. 10% max.
				use_energy(contBuildEff*active_power_usage)
				if(containment > containmentMax)
					containment = containmentMax
		if("charge")
			startCharge += (chargeEff*150) ///1.5% charge speed. 3% max.
			use_energy(chargeEff*active_power_usage)
			if(startCharge > 10000)
				startCharge = 10000
				opState = "active"
				containment = containmentMax
		if("active")
			use_energy(active_power_usage)
			for(var/genIndex in list("iron","glass","plastic","titanium","plasma","silver","gold","uranium","diamond","bluespace"))
				storedSheets[genIndex] += genRates[genIndex]
				if(storedSheets[genIndex] > storageSpace)
					storedSheets[genIndex] = storageSpace
		if("shutdown_fail")
			if(asmeClock > 0)
				asmeClock -= 1
			else
				opState = "nocont"
		if("nocont")
			/// Spawn the singularity. Unleash all chaos upon this world.
			/// TODO: Spawn a singularity at the coordinates of the ASME.

/obj/machinery/arc_sing_mat_extract/update_icon_state()
	///Check machine status values. Set icon state accordingly.
	switch(opState)
		if("idle")
			icon_state = "idle"
			return ..()
		if("charge")
			if(startCharge <= 2500)
				icon_state = "charge_0"
				return ..()
			if(startCharge <= 6000)
				icon_state = "charge_1"
				return ..()
			icon_state = "charge_2"
			return ..()
		if("active")
			icon_state = "active"
			return ..()

/obj/machinery/arc_sing_mat_extract/emp_act(severity)
	switch(opState)
		if("active")
			containment -= severity*250 /// Sev. 5 = -1250 Containment units. ~12.5%
		if("shutdown")
			///Interrupt shutdown at a critical point.
			containment -= 5000 /// -50%
			if(containment <= 0)
				containment = 0
				opState = "nocont"
