/datum/quirk/bouncy
	name = "Bouncy!"
	desc = "You have a waddle in your step!"
	gain_text = span_notice("You're hopping around!")
	lose_text = span_notice("You've lost the pep in your step...")
	medical_record_text = "Patient walks irregularly."
	value = 0
	icon = FA_ICON_TURN_UP

/datum/quirk/bouncy/add(client/client_source)
	quirk_holder.AddElementTrait(TRAIT_WADDLING, QUIRK_TRAIT, /datum/element/waddling)

/datum/quirk/bouncy/remove()
	REMOVE_TRAIT(quirk_holder, TRAIT_WADDLING, QUIRK_TRAIT)
