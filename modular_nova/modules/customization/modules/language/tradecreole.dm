/datum/language/creole
	name = "Trade Creole"
	desc = "An incredibly foreign and largely unknown language spoken by the Morrigi of the Phoenix Collective, characterized by corvid-like caws, clicks, soft hisses, and rattling screeches. It's somewhat structurally similar to languages used by winged anthromorphs like Draconic or Vox Standard. It's said to be most similar to Ashtongue, though some may say this is just coincidence."
	key = "T"
	flags = TONGUELESS_SPEECH
	secret = TRUE
	space_chance = 55
	sentence_chance = 13
	between_word_sentence_chance = 10
	between_word_space_chance = 75
	additional_syllable_low = 1
	additional_syllable_high = 2
	syllables = list (
		"zi","zi","zi","ki","ki","ki","ka","ka","ka","za","za","za","ra","ra","ra",
		"zi","zi","zi","ki","ki","ki","ka","ka","ka","za","za","za","ra","ra","ra",
		"zi","zi","zi","ki","ki","ki","ka","ka","ka","za","za","za","ra","ra","ra",
		"zi","zi","zi","ki","ki","ki","ka","ka","ka","za","za","za","ra","ra","ra",
		"cra","cra","kra","kra","zha","zha","zho","kaa","chi","cho","cro","rak","keke",
		"cra","cra","kra","kra","zha","zha","zho","kaa","chi","cho","cro","rak","keke",
		"cra","cra","kra","kra","zha","zha","zho","kaa","chi","cho","cro","rak","keke",
		"cra","cra","kra","kra","zha","zha","zho","kaa","chi","cho","cro","rak","keke",
		"cs'eer","tun'da","zii'qua","zi'qa","ka'ka","e'kah","czer","craz","zraa","raak",
		"cs'eer","tun'da","zii'qua","zi'qa","ka'ka","e'kah","czer","craz","zraa","raak",
		"kraah","zhaa'ck","za'raa","kr'aawk","ee'raa","ratata","rr'ta","ka'raa","rrraa",
		"kraah","zhaa'ck","za'raa","kr'aawk","ee'raa","ratata","rr'ta","ka'raa","rrraa",
		"KREE","SKRE","AWK","RAWK","KRA","KRI",
	)
	icon_state = "creole"
	icon = 'modular_nova/master_files/icons/misc/language.dmi'
	default_priority = 94
	default_name_syllable_min = 1
	default_name_syllable_max = 2

	mutual_understanding = list(
		/datum/language/draconic = 70,
		/datum/language/vox = 70,
		/datum/language/ashtongue = 50,
	)
