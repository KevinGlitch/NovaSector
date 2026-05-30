/// ------------------------------------------------------------------------------------------ ///
/// ATMOSPHERIC THRESHOLDS
/// ------------------------------------------------------------------------------------------ ///

// The minimum atmos pressure that an MAPU's tile can be at before its energy production begins to stall, in kPA
#define MAPU_ATMOS_KPA_STALL_THRESHOLD 10

// The maximum atmos temperature that an MAPU's tile can be at before it starts spouting "temperature too high" warnings
#define MAPU_ATMOS_TEMP_WARNING_THRESHOLD 1000
// The maximum atmos temperature that an MAPU's tile can be at before it starts losing superstructure integrity
#define MAPU_ATMOS_TEMP_DAMAGE_THRESHOLD 5000
// The maximum atmos temperature that an MAPU's tile can be at before it begins losing integrity exponentially
#define MAPU_ATMOS_TEMP_DANGER_THRESHOLD 10000

// Maximum (and default) superstructure integrity.
#define MAPU_INTEG_SUPER_MAX 10000
// Maximum (and default) core structure integrity.
#define MAPU_INTEG_CORE_MAX 10000
