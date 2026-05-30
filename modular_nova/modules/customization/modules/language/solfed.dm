/datum/language/solfed
	name = "Terran English"
	desc = "Although by now outdated and largely replaced by other more widespread languages such as Sol Common, the English language remains in use within predominantly Terran factions, \
		such as the Sol Federation's territories. English also sees use as a secondary language within the Phoenix Collective, mainly by its allies within \"Sol Force\"."
	key = "e"
	flags = TONGUELESS_SPEECH
	sentence_chance = 0
	between_word_sentence_chance = 10
	between_word_space_chance = 75
	additional_syllable_low = 0
	additional_syllable_high = 0
	syllables = list(
		"aa","ae","ah","ao","aw","ax","ay","ea","eh","er","ey","ia","ih","iy","oh","ow","oy","ua","uh","uw",
		"th","dh","sh","zh","ch","jh","ng","hh" // Literally just the two-letter phoneme transcriptions of the BEEP dictionary. I didn't have much to pull from here.
	)
	icon_state = "solforce"
	icon = 'modular_nova/master_files/icons/misc/language.dmi'