// Cold
/datum/disease/advance/cold
	copy_type = /datum/disease/advance

/datum/disease/advance/cold/New()
	name = "Cold"
	symptoms = list(new/datum/symptom/sneeze)
	..()

// Flu
/datum/disease/advance/flu
	copy_type = /datum/disease/advance

/datum/disease/advance/flu/New()
	name = "Flu"
	symptoms = list(new/datum/symptom/cough)
	..()

// 3D3N Retrovirus, this is a VERY dangerous and finicky one to use
/datum/disease/advance/edenretro
	copy_type = /datum/disease/advance/edenretro // Have to do this because otherwise it screws with the hardcoded cure/transmission.

/datum/disease/advance/edenretro/New()
	name = "3D3N Retrovirus"
	agent = "Bio-engineered Viral Spores"
	hardcoded_adv_transmission = DISEASE_SPREAD_AIRBORNE
	hardcoded_adv_cure = list(/datum/reagent/drug/aphrodisiac/camphor/pentacamphor)
	mutable = FALSE
	symptoms = list(
		new/datum/symptom/bimbo,
		new/datum/symptom/viraladaptation,
		new/datum/symptom/viralevolution,
		new/datum/symptom/inorganic_adaptation,
		new/datum/symptom/heal/metabolism,
		new/datum/symptom/sensory_restoration,
		new/datum/symptom/youth
	)
	..()

/**********************************************************************/
//Randomly generated Disease, for virus crates and events
/datum/disease/advance/random
	name = "Experimental Disease"
	copy_type = /datum/disease/advance

/datum/disease/advance/random/New(max_symptoms, max_level = 8)
	if(!max_symptoms)
		max_symptoms = rand(1, VIRUS_SYMPTOM_LIMIT)
	var/list/datum/symptom/possible_symptoms = list()
	for(var/symptom in subtypesof(/datum/symptom))
		var/datum/symptom/S = symptom
		if(initial(S.level) > max_level)
			continue
		if(initial(S.level) <= 0) //unobtainable symptoms
			continue
		possible_symptoms += S
	for(var/i in 1 to max_symptoms)
		var/datum/symptom/chosen_symptom = pick_n_take(possible_symptoms)
		if(chosen_symptom)
			var/datum/symptom/S = new chosen_symptom
			symptoms += S
	Refresh()

	name = "Sample #[rand(1,10000)]"
