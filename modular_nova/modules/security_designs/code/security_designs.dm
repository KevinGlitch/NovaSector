/datum/design/handlabeler
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE | DEPARTMENT_BITFLAG_SECURITY

/datum/design/paperroll
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE | DEPARTMENT_BITFLAG_SECURITY

/datum/design/mag_c20r // sec printable so that the blueshield can get more mags for the nt20, which takes the c20r mag
	name = "Magazine (.45)"
	desc = "A 24-round magazine designed to fit in submachine guns which fire .45."
	id = "mag_c20r"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 2)
	build_path = /obj/item/ammo_box/magazine/smgm45/empty
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/mag_katyusha // sec printable so that the blueshield can get more mags for the katyusha, which takes the katyusha drum mags
	name = "Magazine (12 Gauge Shells)"
	desc = "A 10-shell magazine designed to fit in the NT-Katyusha which fires 12 gauge"
	id = "mag_katyusha"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 2)
	build_path = /obj/item/ammo_box/magazine/katyusha/empty
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY
