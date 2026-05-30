#define ALERT_COEFF_NOVA 1.5 // 1.5x the default value, normally 10 minutes, which give us 15 minutes.

/**
 * Contains some overrides and our sec levels.
 */

/datum/security_level/green
	name = "Green"
	sound = 'modular_nova/modules/alerts/sound/security_levels/green.ogg'
	shuttle_call_time_mod = ALERT_COEFF_NOVA

/datum/security_level/blue
	name = "Blue"
	sound = 'modular_nova/modules/alerts/sound/security_levels/blue.ogg'
	shuttle_call_time_mod = ALERT_COEFF_NOVA

/datum/security_level/red
	name = "Red"
	sound = 'modular_nova/modules/alerts/sound/security_levels/red.ogg'
	shuttle_call_time_mod = (ALERT_COEFF_NOVA / 1.5)

/datum/security_level/delta
	name = "Delta"
	announcement_color = "pink"
	lowering_to_configuration_key = /datum/config_entry/string/alert_delta_downto
	elevating_to_configuration_key = /datum/config_entry/string/alert_delta_upto
	sound = 'modular_nova/modules/alerts/sound/security_levels/delta.ogg'
	looping_sound = 'modular_nova/modules/alerts/sound/misc/alarm_delta.ogg'
	looping_sound_interval = 8 SECONDS
	shuttle_call_time_mod = (ALERT_COEFF_NOVA / 3)


/**
 * Violet
 *
 * Medical emergency
 */
/datum/security_level/violet
	name = "Violet"
	name_shortform = "VLT"
	announcement_color = "purple"
	number_level = SEC_LEVEL_VIOLET
	status_display_icon_state = "violetalert"
	fire_alarm_light_color = COLOR_VIOLET
	lowering_to_configuration_key = /datum/config_entry/string/alert_violet_downto
	elevating_to_configuration_key = /datum/config_entry/string/alert_violet_upto
	sound = 'modular_nova/modules/alerts/sound/security_levels/violet.ogg'
	shuttle_call_time_mod = ALERT_COEFF_NOVA

/**
 * Orange
 *
 * Engineering emergency
 */
/datum/security_level/orange
	name = "Orange"
	name_shortform = "ORNG"
	announcement_color = "orange"
	number_level = SEC_LEVEL_ORANGE
	status_display_icon_state = "orangealert"
	fire_alarm_light_color = LIGHT_COLOR_ORANGE
	lowering_to_configuration_key = /datum/config_entry/string/alert_orange_downto
	elevating_to_configuration_key = /datum/config_entry/string/alert_orange_upto
	sound = 'modular_nova/modules/alerts/sound/security_levels/orange.ogg'
	shuttle_call_time_mod = ALERT_COEFF_NOVA

/**
 * Amber
 *
 * Securty emergency
 */

/datum/security_level/amber
	name = "Amber"
	name_shortform = "AMBR"
	announcement_color = "yellow"
	number_level = SEC_LEVEL_AMBER
	status_display_icon_state = "amberalert"
	fire_alarm_light_color = LIGHT_COLOR_DIM_YELLOW
	lowering_to_configuration_key = /datum/config_entry/string/alert_amber_downto
	elevating_to_configuration_key = /datum/config_entry/string/alert_amber_upto
	sound = 'modular_nova/modules/alerts/sound/security_levels/amber.ogg'
	shuttle_call_time_mod = ALERT_COEFF_NOVA

/**
 * Epsilon
 *
 * Centcom Emergency Intervention
 */

/datum/security_level/epsilon
	name = "Epsilon"
	name_shortform = "ε"
	announcement_color = "purple"
	number_level = SEC_LEVEL_EPSILON
	status_display_icon_state = "epsilonalert"
	fire_alarm_light_color = COLOR_BIOLUMINESCENCE_PURPLE
	lowering_to_configuration_key = /datum/config_entry/string/alert_epsilon_downto
	elevating_to_configuration_key = /datum/config_entry/string/alert_epsilon_upto
	shuttle_call_time_mod = (ALERT_COEFF_NOVA / 4)
	sound = 'modular_nova/modules/alerts/sound/security_levels/epsilon.ogg'
	looping_sound = 'modular_nova/modules/alerts/sound/security_levels/epsilon_loop.ogg'
	looping_sound_interval = 15 SECONDS
	disables_mail = TRUE

/**
 * Gamma
 *
 * XK-Class EOW Event
 */
/datum/security_level/gamma
	name = "Gamma"
	name_shortform = "γ"
	announcement_color = "pink"
	number_level = SEC_LEVEL_GAMMA
	status_display_icon_state = "gammaalert"
	fire_alarm_light_color = COLOR_ASSEMBLY_PURPLE
	lowering_to_configuration_key = /datum/config_entry/string/alert_gamma_downto
	elevating_to_configuration_key = /datum/config_entry/string/alert_gamma_upto
	shuttle_call_time_mod = (ALERT_COEFF_NOVA / 150)
	sound = 'modular_nova/modules/alerts/sound/security_levels/gamma_alert.ogg'
	looping_sound = 'modular_nova/modules/alerts/sound/security_levels/gamma_alert_vol50.ogg'
	looping_sound_interval = 13 SECONDS
	disables_mail = TRUE

/**
 * Federal
 *
 * Solfed Military Takeover
 */
/datum/security_level/federal
	name = "Federal"
	name_shortform = "FED"
	announcement_color = "blue"
	number_level = SEC_LEVEL_FEDERAL
	status_display_icon_state = "federalalert"
	fire_alarm_light_color = COLOR_THEME_GLASS
	elevating_to_configuration_key = /datum/config_entry/string/alert_federal
	sound = 'modular_nova/modules/alerts/sound/security_levels/gamma_alert.ogg'
	looping_sound = 'modular_nova/modules/alerts/sound/security_levels/gamma_alert_vol50.ogg'
	looping_sound_interval = 13 SECONDS
	shuttle_call_time_mod = ALERT_COEFF_NOVA
	disables_mail = TRUE

/**
 * Black (EXOBYTECHNOVA UPD)
 *
 * MAPU Reactor Meltdown, or similar
 */
/datum/security_level/black
	name = "Black"
	name_shortform = "BLK"
	announcement_color = "pink"
	number_level = SEC_LEVEL_BLACK
	status_display_icon_state = "blackalert"
	fire_alarm_light_color = COLOR_SECURITY_RED
	lowering_to_configuration_key = /datum/config_entry/string/alert_black_downto
	elevating_to_configuration_key = /datum/config_entry/string/alert_black_upto
	shuttle_call_time_mod = (ALERT_COEFF_NOVA / 15)
	sound = 'modular_nova/modules/alerts/sound/security_levels/blackalert_start.ogg'
	looping_sound = 'modular_nova/modules/alerts/sound/security_levels/xen_alarm1_lower.ogg'
	looping_sound_interval = 4.5 SECONDS
	disables_mail = TRUE

#undef ALERT_COEFF_NOVA
