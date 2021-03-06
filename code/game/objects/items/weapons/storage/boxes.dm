/*
 *	Everything derived from the common cardboard box.
 *	Basically everything except the original is a kit (starts full).
 *
 *	Contains:
 *		Empty box, starter boxes (survival/engineer),
 *		Latex glove and sterile mask boxes,
 *		Syringe, beaker, dna injector boxes,
 *		Blanks, flashbangs, and EMP grenade boxes,
 *		Tracking and chemical implant boxes,
 *		Prescription glasses and drinking glass boxes,
 *		Condiment bottle and silly cup boxes,
 *		Donkpocket and monkeycube boxes,
 *		ID and security PDA cart boxes,
 *		Handcuff, mousetrap, and pillbottle boxes,
 *		Snap-pops and matchboxes,
 *		Replacement light boxes.
 *
 *		For syndicate call-ins see uplink_kits.dm
 */

/obj/item/weapon/storage/box
	name = "box"
	desc = "It's just an ordinary box."
	icon_state = "box"
	item_state = "syringe_kit"
	max_storage_space = DEFAULT_BOX_STORAGE
	var/foldable = /obj/item/stack/material/cardboard	// BubbleWrap - if set, can be folded (when empty) into a sheet of cardboard

/obj/item/weapon/storage/box/large
	name = "large box"
	icon_state = "largebox"
	w_class = ITEM_SIZE_LARGE
	max_w_class = ITEM_SIZE_NORMAL
	max_storage_space = DEFAULT_LARGEBOX_STORAGE

// BubbleWrap - A box can be folded up to make card
/obj/item/weapon/storage/box/attack_self(mob/user as mob)
	if(..()) return

	//try to fold it.
	if ( contents.len )
		return

	if ( !ispath(src.foldable) )
		return
	var/found = 0
	// Close any open UI windows first
	for(var/mob/M in range(1))
		if (M.s_active == src)
			src.close(M)
		if ( M == user )
			found = 1
	if ( !found )	// User is too far away
		return
	// Now make the cardboard
	to_chat(user, "<span class='notice'>You fold [src] flat.</span>")
	if(ispath(foldable, /obj/item/stack))
		var/stack_amt = max(2**(w_class - 3), 1)
		new src.foldable(get_turf(src), stack_amt)
	else
		new src.foldable(get_turf(src))
	qdel(src)

/obj/item/weapon/storage/box/make_exact_fit()
	..()
	foldable = null //special form fitted boxes should not be foldable.

/obj/item/weapon/storage/box/survival/
	startswith = list(/obj/item/clothing/mask/breath = 1,
					/obj/item/weapon/tank/emergency/oxygen = 1)

/obj/item/weapon/storage/box/vox/
	startswith = list(/obj/item/clothing/mask/breath = 1,
					/obj/item/weapon/tank/emergency/nitrogen = 1)

/obj/item/weapon/storage/box/engineer/
	startswith = list(/obj/item/clothing/mask/breath = 1,
					/obj/item/weapon/tank/emergency/oxygen/engi = 1)

/obj/item/weapon/storage/box/gloves
	name = "box of sterile gloves"
	desc = "Contains sterile gloves."
	icon_state = "latex"
	startswith = list(/obj/item/clothing/gloves/latex = 5,
					/obj/item/clothing/gloves/latex/nitrile = 2)

/obj/item/weapon/storage/box/masks
	name = "box of sterile masks"
	desc = "This box contains masks of sterility."
	icon_state = "sterile"
	startswith = list(/obj/item/clothing/mask/surgical = 7)


/obj/item/weapon/storage/box/syringes
	name = "box of syringes"
	desc = "A box full of syringes."
	icon_state = "syringe"
	startswith = list(/obj/item/weapon/reagent_containers/syringe = 7)



/obj/item/weapon/storage/box/beakers
	name = "box of beakers"
	icon_state = "beaker"
	startswith = list(/obj/item/weapon/reagent_containers/glass/beaker = 7)

/obj/item/weapon/storage/box/injectors
	name = "box of DNA injectors"
	desc = "This box contains injectors it seems."
	startswith = list(/obj/item/weapon/dnainjector/h2m = 6)


/obj/item/weapon/storage/box/blanks
	name = "box of blank shells"
	desc = "It has a picture of a gun and several warning symbols on the front."
	startswith = list(/obj/item/ammo_casing/shotgun/blank = 7)

/obj/item/weapon/storage/box/beanbags
	name = "box of beanbag shells"
	desc = "It has a picture of a gun and several warning symbols on the front.<br>WARNING: Live ammunition. Misuse may result in serious injury or death."
	startswith = list(/obj/item/ammo_casing/shotgun/beanbag = 7)

/obj/item/weapon/storage/box/shotgunammo
	name = "box of shotgun slugs"
	desc = "It has a picture of a gun and several warning symbols on the front.<br>WARNING: Live ammunition. Misuse may result in serious injury or death."
	startswith = list(/obj/item/ammo_casing/shotgun = 7)

/obj/item/weapon/storage/box/shotgunshells
	name = "box of shotgun shells"
	desc = "It has a picture of a gun and several warning symbols on the front.<br>WARNING: Live ammunition. Misuse may result in serious injury or death."
	startswith = list(/obj/item/ammo_casing/shotgun/pellet = 7)

/obj/item/weapon/storage/box/flashshells
	name = "box of illumination shells"
	desc = "It has a picture of a gun and several warning symbols on the front.<br>WARNING: Live ammunition. Misuse may result in serious injury or death."
	startswith = list(/obj/item/ammo_casing/shotgun/flash = 7)

/obj/item/weapon/storage/box/stunshells
	name = "box of stun shells"
	desc = "It has a picture of a gun and several warning symbols on the front.<br>WARNING: Live ammunition. Misuse may result in serious injury or death."
	startswith = list(/obj/item/ammo_casing/shotgun/stunshell = 7)

/obj/item/weapon/storage/box/practiceshells
	name = "box of practice shells"
	desc = "It has a picture of a gun and several warning symbols on the front.<br>WARNING: Live ammunition. Misuse may result in serious injury or death."
	startswith = list(/obj/item/ammo_casing/shotgun/practice = 7)

/obj/item/weapon/storage/box/sniperammo
	name = "box of 14.5mm shells"
	desc = "It has a picture of a gun and several warning symbols on the front.<br>WARNING: Live ammunition. Misuse may result in serious injury or death."
	startswith = list(/obj/item/ammo_casing/a145 = 7)

/obj/item/weapon/storage/box/flashbangs
	name = "box of flashbangs"
	desc = "A box containing 7 antipersonnel flashbang grenades.<br> WARNING: These devices are extremely dangerous and can cause blindness or deafness from repeated use."
	icon_state = "flashbang"
	startswith = list(/obj/item/weapon/grenade/flashbang = 7)

/obj/item/weapon/storage/box/teargas
	name = "box of pepperspray grenades"
	desc = "A box containing 7 tear gas grenades. A gas mask is printed on the label.<br> WARNING: Exposure carries risk of serious injury or death. Keep away from persons with lung conditions."
	icon_state = "flashbang"
	startswith = list(/obj/item/weapon/grenade/chem_grenade/teargas = 7)

/obj/item/weapon/storage/box/emps
	name = "box of emp grenades"
	desc = "A box containing 5 military grade EMP grenades.<br> WARNING: Do not use near unshielded electronics or biomechanical augmentations, death or permanent paralysis may occur."
	icon_state = "flashbang"
	startswith = list(/obj/item/weapon/grenade/empgrenade = 5)

/obj/item/weapon/storage/box/frags
	name = "box of frag grenades"
	desc = "A box containing 5 military grade fragmentation grenades.<br> WARNING: Live explosives. Misuse may result in serious injury or death."
	icon_state = "flashbang"
	startswith = list(/obj/item/weapon/grenade/frag = 5)

/obj/item/weapon/storage/box/fragshells
	name = "box of frag shells"
	desc = "A box containing 5 military grade fragmentation shells.<br> WARNING: Live explosive munitions. Misuse may result in serious injury or death."
	icon_state = "flashbang"
	startswith = list(/obj/item/weapon/grenade/frag/shell = 5)

/obj/item/weapon/storage/box/smokes
	name = "box of smoke bombs"
	desc = "A box containing 5 smoke bombs."
	icon_state = "flashbang"
	startswith = list(/obj/item/weapon/grenade/smokebomb = 5)

/obj/item/weapon/storage/box/anti_photons
	name = "box of anti-photon grenades"
	desc = "A box containing 5 experimental photon disruption grenades."
	icon_state = "flashbang"
	startswith = list(/obj/item/weapon/grenade/anti_photon = 5)

/obj/item/weapon/storage/box/supermatters
	name = "box of supermatter grenades"
	desc = "A box containing 5 highly experimental supermatter grenades."
	icon_state = "radbox"
	startswith = list(/obj/item/weapon/grenade/supermatter = 5)

/obj/item/weapon/storage/box/trackimp
	name = "boxed tracking implant kit"
	desc = "Box full of scum-bag tracking utensils."
	icon_state = "implant"
	startswith = list(/obj/item/weapon/implantcase/tracking = 4,
		/obj/item/weapon/implanter = 1,
		/obj/item/weapon/implantpad = 1,
		/obj/item/weapon/locator = 1)

/obj/item/weapon/storage/box/chemimp
	name = "boxed chemical implant kit"
	desc = "Box of stuff used to implant chemicals."
	icon_state = "implant"
	startswith = list(/obj/item/weapon/implantcase/chem = 5,
					/obj/item/weapon/implanter = 1,
					/obj/item/weapon/implantpad = 1)

/obj/item/weapon/storage/box/rxglasses
	name = "box of prescription glasses"
	desc = "This box contains nerd glasses."
	icon_state = "glasses"
	startswith = list(/obj/item/clothing/glasses/regular = 7)

/obj/item/weapon/storage/box/cdeathalarm_kit
	name = "death alarm kit"
	desc = "Box of stuff used to implant death alarms."
	icon_state = "implant"
	item_state = "syringe_kit"
	startswith = list(/obj/item/weapon/implanter = 1,
				/obj/item/weapon/implantcase/death_alarm = 6)

/obj/item/weapon/storage/box/condimentbottles
	name = "box of condiment bottles"
	desc = "It has a large ketchup smear on it."
	startswith = list(/obj/item/weapon/reagent_containers/food/condiment = 6)

/obj/item/weapon/storage/box/cups
	name = "box of paper cups"
	desc = "It has pictures of paper cups on the front."
	startswith = list(/obj/item/weapon/reagent_containers/food/drinks/sillycup = 7)

/obj/item/weapon/storage/box/donkpockets
	name = "box of donk-pockets"
	desc = "<B>Instructions:</B> <I>Heat in microwave. Product will cool if not eaten within seven minutes.</I>"
	icon_state = "donk_kit"
	startswith = list(/obj/item/weapon/reagent_containers/food/snacks/donkpocket = 6)

/obj/item/weapon/storage/box/sinpockets
	name = "box of sin-pockets"
	desc = "<B>Instructions:</B> <I>Crush bottom of package to initiate chemical heating. Wait for 20 seconds before consumption. Product will cool if not eaten within seven minutes.</I>"
	icon_state = "donk_kit"
	startswith = list(/obj/item/weapon/reagent_containers/food/snacks/donkpocket/sinpocket = 6)

/obj/item/weapon/storage/box/monkeycubes
	name = "monkey cube box"
	desc = "Drymate brand monkey cubes. Just add water!"
	icon = 'icons/obj/food.dmi'
	icon_state = "monkeycubebox"
	can_hold = list(/obj/item/weapon/reagent_containers/food/snacks/monkeycube)
	startswith = list(/obj/item/weapon/reagent_containers/food/snacks/monkeycube/wrapped = 5)

/obj/item/weapon/storage/box/monkeycubes/farwacubes
	name = "farwa cube box"
	desc = "Drymate brand farwa cubes, shipped from Ahdomai. Just add water!"
	startswith = list(/obj/item/weapon/reagent_containers/food/snacks/monkeycube/wrapped/farwacube = 5)

/obj/item/weapon/storage/box/monkeycubes/stokcubes
	name = "stok cube box"
	desc = "Drymate brand stok cubes, shipped from Moghes. Just add water!"
	startswith = list(/obj/item/weapon/reagent_containers/food/snacks/monkeycube/wrapped/stokcube = 5)

/obj/item/weapon/storage/box/monkeycubes/neaeracubes
	name = "neaera cube box"
	desc = "Drymate brand neaera cubes, shipped from Jargon 4. Just add water!"
	startswith = list(/obj/item/weapon/reagent_containers/food/snacks/monkeycube/wrapped/neaeracube = 5)

/obj/item/weapon/storage/box/ids
	name = "box of spare IDs"
	desc = "Has so many empty IDs."
	icon_state = "id"
	startswith = list(/obj/item/weapon/card/id = 7)

/obj/item/weapon/storage/box/seccarts
	name = "box of spare R.O.B.U.S.T. Cartridges"
	desc = "A box full of R.O.B.U.S.T. Cartridges, used by Security."
	icon_state = "pda"
	startswith = list(/obj/item/weapon/cartridge/security = 7)

/obj/item/weapon/storage/box/handcuffs
	name = "box of spare handcuffs"
	desc = "A box full of handcuffs."
	icon_state = "handcuff"
	startswith = list(/obj/item/weapon/handcuffs = 7)

/obj/item/weapon/storage/box/mousetraps
	name = "box of Pest-B-Gon mousetraps"
	desc = "<B><FONT color='red'>WARNING:</FONT></B> <I>Keep out of reach of children</I>."
	icon_state = "mousetraps"
	startswith = list(/obj/item/device/assembly/mousetrap = 6)

/obj/item/weapon/storage/box/pillbottles
	name = "box of pill bottles"
	desc = "It has pictures of pill bottles on its front."
	startswith = list(/obj/item/weapon/storage/pill_bottle = 7)

/obj/item/weapon/storage/box/snappops
	name = "snap pop box"
	desc = "Eight wrappers of fun! Ages 8 and up. Not suitable for children."
	icon = 'icons/obj/toy.dmi'
	icon_state = "spbox"
	can_hold = list(/obj/item/toy/snappop)
	startswith = list(/obj/item/toy/snappop = 8)

/obj/item/weapon/storage/box/matches
	name = "matchbox"
	desc = "A small box of 'Space-Proof' premium matches."
	icon = 'icons/obj/cigarettes.dmi'
	icon_state = "matchbox"
	item_state = "zippo"
	w_class = ITEM_SIZE_TINY
	slot_flags = SLOT_BELT
	can_hold = list(/obj/item/weapon/flame/match)
	startswith = list(/obj/item/weapon/flame/match = 10)

	attackby(obj/item/weapon/flame/match/W as obj, mob/user as mob)
		if(istype(W) && !W.lit && !W.burnt)
			W.lit = 1
			W.damtype = "burn"
			W.icon_state = "match_lit"
			processing_objects.Add(W)
		W.update_icon()
		return

/obj/item/weapon/storage/box/autoinjectors
	name = "box of injectors"
	desc = "Contains autoinjectors."
	icon_state = "syringe"

	startswith = list(/obj/item/weapon/reagent_containers/hypospray/autoinjector = 7)

/obj/item/weapon/storage/box/lights
	name = "box of replacement bulbs"
	icon = 'icons/obj/storage.dmi'
	icon_state = "light"
	desc = "This box is shaped on the inside so that only light tubes and bulbs fit."
	item_state = "syringe_kit"
	use_to_pickup = 1 // for picking up broken bulbs, not that most people will try

/obj/item/weapon/storage/box/lights/New()
	..()
	make_exact_fit()

/obj/item/weapon/storage/box/lights/bulbs
	startswith = list(/obj/item/weapon/light/bulb = 21)

/obj/item/weapon/storage/box/lights/tubes
	name = "box of replacement tubes"
	icon_state = "lighttube"
	startswith = list(/obj/item/weapon/light/tube = 17,
					/obj/item/weapon/light/tube/large = 4)

/obj/item/weapon/storage/box/lights/mixed
	name = "box of replacement lights"
	icon_state = "lightmixed"
	startswith = list(/obj/item/weapon/light/tube = 12,
					/obj/item/weapon/light/tube/large = 4,
					/obj/item/weapon/light/bulb = 5)

/obj/item/weapon/storage/box/glowsticks
	name = "box of mixed glowsticks"
	icon_state = "box"
	startswith = list(/obj/item/device/flashlight/glowstick = 1, /obj/item/device/flashlight/glowstick/red = 1,
					/obj/item/device/flashlight/glowstick/blue = 1, /obj/item/device/flashlight/glowstick/orange = 1,
					/obj/item/device/flashlight/glowstick/yellow = 1, /obj/item/device/flashlight/glowstick/random = 1)

/obj/item/weapon/storage/box/freezer
	name = "portable freezer"
	desc = "This nifty shock-resistant device will keep your 'groceries' nice and non-spoiled."
	icon = 'icons/obj/storage.dmi'
	icon_state = "portafreezer"
	item_state = "medicalpack"
	foldable = null
	max_w_class = ITEM_SIZE_NORMAL
	w_class = ITEM_SIZE_HUGE
	can_hold = list(/obj/item/organ, /obj/item/weapon/reagent_containers/food, /obj/item/weapon/reagent_containers/glass)
	max_storage_space = DEFAULT_BACKPACK_STORAGE
	use_to_pickup = 1 // for picking up broken bulbs, not that most people will try

/obj/item/weapon/storage/box/checkers
	name = "checkers box"
	desc = "This box holds a nifty portion of checkers. Foam-shaped on the inside so that only checkers may fit."
	icon_state = "checkers"
	max_storage_space = 24
	foldable = null
	can_hold = list(/obj/item/weapon/reagent_containers/food/snacks/checker)
	startswith = list(/obj/item/weapon/reagent_containers/food/snacks/checker = 12,
					/obj/item/weapon/reagent_containers/food/snacks/checker/red = 12)

/obj/item/weapon/storage/box/checkers/chess
	name = "black chess box"
	desc = "This box holds all the pieces needed for the black side of the chess board."
	icon_state = "chess_b"
	startswith = list(/obj/item/weapon/reagent_containers/food/snacks/checker/pawn = 8,
				/obj/item/weapon/reagent_containers/food/snacks/checker/knight = 2,
				/obj/item/weapon/reagent_containers/food/snacks/checker/bishop = 2,
				/obj/item/weapon/reagent_containers/food/snacks/checker/rook = 2,
				/obj/item/weapon/reagent_containers/food/snacks/checker/queen = 1,
				/obj/item/weapon/reagent_containers/food/snacks/checker/king = 1)

/obj/item/weapon/storage/box/checkers/chess/red
	name = "red chess box"
	desc = "This box holds all the pieces needed for the red side of the chess board."
	icon_state = "chess_r"
	startswith = list(/obj/item/weapon/reagent_containers/food/snacks/checker/pawn/red = 8,
				/obj/item/weapon/reagent_containers/food/snacks/checker/knight/red = 2,
				/obj/item/weapon/reagent_containers/food/snacks/checker/bishop/red = 2,
				/obj/item/weapon/reagent_containers/food/snacks/checker/rook/red = 2,
				/obj/item/weapon/reagent_containers/food/snacks/checker/queen/red = 1,
				/obj/item/weapon/reagent_containers/food/snacks/checker/king/red = 1)


/obj/item/weapon/storage/box/headset
	name = "box of spare headsets"
	desc = "A box full of headsets."
	startswith = list(/obj/item/device/radio/headset = 7)


// AMMOCANS //


/obj/item/weapon/storage/box/ammocan/sa
	name = "ammo can (5.45x39mm)"
	icon_state = "sa"
	w_class = ITEM_SIZE_LARGE
	can_hold = list(/obj/item/ammo_magazine/ammobox/box545x39)
	startswith = list(/obj/item/ammo_magazine/ammobox/box545x39 = 20)
	allow_quick_empty = 1

/obj/item/weapon/storage/box/ammocan/csla
	name = "ammo can (7.62x39mm)"
	icon_state = "csla"
	w_class = ITEM_SIZE_LARGE
	can_hold = list(/obj/item/ammo_magazine/ammobox/box762x39)
	startswith = list(/obj/item/ammo_magazine/ammobox/box762x39 = 20)
	allow_quick_empty = 1

/obj/item/weapon/storage/box/ammocan/usmc
	name = "ammo can (5.56x45mm)"
	icon_state = "usmc"
	w_class = ITEM_SIZE_LARGE
	can_hold = list(/obj/item/ammo_magazine/ammobox/box556x45)
	startswith = list(/obj/item/ammo_magazine/ammobox/box556x45 = 20)
	allow_quick_empty = 1

/obj/item/weapon/storage/box/ammocan/bdw
	name = "ammo can (7.62x51mm)"
	icon_state = "bdw"
	w_class = ITEM_SIZE_LARGE
	can_hold = list(/obj/item/ammo_magazine/ammobox/box762x51)
	startswith = list(/obj/item/ammo_magazine/ammobox/box762x51 = 20)
	allow_quick_empty = 1


// CARGO BOXES //

/obj/item/weapon/storage/box/cargo
	name = "kit box"
	desc = "Box with standart kit."
	w_class = ITEM_SIZE_LARGE
	can_hold = list(/obj/structure/bed/roller)
	foldable = /obj/item/stack/material/cardboard

/obj/item/weapon/storage/box/cargo/chem
	name = "kit box"
	desc = "Box with medical supplies."
	icon_state = "med_cargo"
	w_class = ITEM_SIZE_LARGE
	can_hold = list(/obj/structure/bed/roller)
	foldable = /obj/item/stack/material/cardboard
	startswith = list(
		/obj/item/weapon/storage/box/syringes,
		/obj/item/weapon/reagent_containers/glass/bottle/escalation/morphine = 2,
		/obj/item/weapon/reagent_containers/glass/bottle/escalation/naloxone = 2,
		/obj/item/weapon/reagent_containers/glass/bottle/escalation/aminocap = 2,
		/obj/item/weapon/reagent_containers/glass/bottle/escalation/salbutamol = 2,
		/obj/item/weapon/reagent_containers/glass/bottle/escalation/ethaperazine = 2,
		/obj/item/weapon/reagent_containers/glass/bottle/escalation/promethazine = 2,
		/obj/item/weapon/reagent_containers/glass/bottle/escalation/amidopyrinum = 2,
		/obj/item/weapon/reagent_containers/glass/bottle/escalation/sydnocarbum = 2,
		/obj/item/weapon/reagent_containers/glass/bottle/escalation/doxycicline = 2,
		/obj/item/weapon/reagent_containers/glass/bottle/escalation/epinephrine = 2
		)

// SA //

/obj/item/weapon/storage/box/cargo/sa
	name = "SA kit."
	desc = "Box with kit."
	icon_state = "sa_cargo"

/obj/item/weapon/storage/box/cargo/sa/standart
	name = "SA strelok kit."
	desc = "Box with standart kit."
	startswith = list(
		/obj/item/ammo_magazine/c545x39m = 7,
		/obj/item/weapon/storage/firstaid/combat/wp,
		/obj/item/weapon/material/knife/bayonet/sa,
		/obj/item/weapon/grenade/frag = 2
		)

/obj/item/weapon/storage/box/cargo/sa/medic
	name = "SA sanitar kit."
	desc = "Box with medical kit."
	startswith = list(
		/obj/item/weapon/storage/firstaid/regular = 2,
		/obj/item/ammo_magazine/c545x39m = 3,
		/obj/item/weapon/material/knife/bayonet/sa,
		/obj/item/device/healthanalyzer,
		/obj/item/roller,
		/obj/item/weapon/storage/box/syringes
		)

/obj/item/weapon/storage/box/cargo/sa/grenadier
	name = "SA granatometchik kit."
	desc = "Box with rockets inside."
	startswith = list(
		/obj/item/ammo_magazine/c545x39m = 7,
		/obj/item/weapon/storage/firstaid/combat/wp,
		/obj/item/weapon/storage/backpack/rpgsa,
		/obj/item/ammo_casing/rpg_missile = 3,
		/obj/item/weapon/material/knife/bayonet/sa
		)

/obj/item/weapon/storage/box/cargo/sa/grenadier/assistant
	name = "SA pomoshnik granatometchika kit."
	desc = "Box with rockets inside."
	startswith = list(
		/obj/item/ammo_magazine/c545x39m = 7,
		/obj/item/weapon/storage/firstaid/combat/wp,
		/obj/item/weapon/storage/backpack/rpgsa/assistant,
		/obj/item/ammo_casing/rpg_missile = 3,
		/obj/item/weapon/material/knife/bayonet/sa,
		/obj/item/weapon/grenade/frag
		)

/obj/item/weapon/storage/box/cargo/sa/sniper
	name = "SA snayper kit."
	desc = "Box with marksman kit inside."
	startswith = list(
		/obj/item/ammo_magazine/c762x54s = 7,
		/obj/item/weapon/storage/firstaid/combat/wp,
		/obj/item/weapon/material/knife/bayonet/sa,
		/obj/item/weapon/mine/soviet = 2,
		/obj/item/device/binoculars/wp
		)

/obj/item/weapon/storage/box/cargo/sa/machinegunner
	name = "SA pulemetchik kit."
	desc = "Box with machinegunner kit inside."
	startswith = list(
		/obj/item/ammo_magazine/c762x54b = 3,
		/obj/item/weapon/storage/firstaid/combat/wp,
		/obj/item/weapon/material/knife/bayonet/sa,
		/obj/item/weapon/storage/belt/suit/ammo/sa/lmg = 2
		)

/obj/item/weapon/storage/box/cargo/sa/sergeant
	name = "SA komadir otdeleniya kit."
	desc = "Box with sergeant kit."
	startswith = list(
		/obj/item/ammo_magazine/c545x39m = 5,
		/obj/item/weapon/storage/firstaid/combat/wp,
		/obj/item/weapon/material/knife/bayonet/sa,
		/obj/item/weapon/grenade/frag,
		/obj/item/weapon/grenade/frag/high_yield,
		/obj/item/device/binoculars/wp,
		/obj/item/ammo_magazine/a9x18 = 2
		)

/obj/item/weapon/storage/box/cargo/sa/advanced
	name = "SA starshiy srelok kit."
	desc = "Box with grenades and ammo inside."
	startswith = list(
		/obj/item/ammo_magazine/c545x39m = 7,
		/obj/item/weapon/storage/firstaid/combat/wp,
		/obj/item/weapon/material/knife/bayonet/sa,
		/obj/item/weapon/grenade/frag/high_yield = 2,
		/obj/item/weapon/storage/backpack/gl/sa
		)

// CSLA //

/obj/item/weapon/storage/box/cargo/csla
	name = "CSLA kit."
	desc = "Box with kit."
	icon_state = "csla_cargo"

/obj/item/weapon/storage/box/cargo/csla/standart
	name = "CSLA strelec kit."
	desc = "Box with standart kit."
	startswith = list(
		/obj/item/ammo_magazine/c762x39m = 7,
		/obj/item/weapon/storage/firstaid/combat/wp,
		/obj/item/weapon/material/knife/bayonet/csla,
		/obj/item/weapon/grenade/frag = 2
		)

/obj/item/weapon/storage/box/cargo/csla/medic
	name = "CSLA sanitar kit."
	desc = "Box with medical kit."
	startswith = list(
		/obj/item/weapon/storage/firstaid/regular = 2,
		/obj/item/ammo_magazine/c762x39m = 3,
		/obj/item/weapon/material/knife/bayonet/csla,
		/obj/item/device/healthanalyzer,
		/obj/item/roller,
		/obj/item/weapon/storage/box/syringes
		)

/obj/item/weapon/storage/box/cargo/csla/grenadier
	name = "CSLA pancerovnik kit."
	desc = "Box with rockets inside."
	startswith = list(
		/obj/item/ammo_magazine/c762x39m = 7,
		/obj/item/weapon/storage/firstaid/combat/wp,
		/obj/item/weapon/storage/backpack/rpgcsla,
		/obj/item/ammo_casing/rpg_missile = 3,
		/obj/item/weapon/material/knife/bayonet/csla
		)

/obj/item/weapon/storage/box/cargo/csla/grenadier/assistant
	name = "CSLA pomocnik panzerovnika kit."
	desc = "Box with rockets inside."
	startswith = list(
		/obj/item/ammo_magazine/c762x39m = 7,
		/obj/item/weapon/storage/firstaid/combat/wp,
		/obj/item/weapon/storage/backpack/rpgcsla/assistant,
		/obj/item/ammo_casing/rpg_missile = 3,
		/obj/item/weapon/material/knife/bayonet/csla,
		/obj/item/weapon/grenade/frag
		)

/obj/item/weapon/storage/box/cargo/csla/sniper
	name = "CSLA nadstrelec kit."
	desc = "Box with marksman kit inside."
	startswith = list(
		/obj/item/ammo_magazine/c762x54s = 7,
		/obj/item/weapon/storage/firstaid/combat/wp,
		/obj/item/weapon/material/knife/bayonet/csla,
		/obj/item/weapon/mine/soviet = 2,
		/obj/item/device/binoculars/wp
		)

/obj/item/weapon/storage/box/cargo/csla/machinegunner
	name = "CSLA delostrelec kit."
	desc = "Box with machinegunner kit inside."
	startswith = list(
		/obj/item/ammo_magazine/c762x54b/csla = 3,
		/obj/item/weapon/storage/firstaid/combat/wp,
		/obj/item/weapon/material/knife/bayonet/csla,
		/obj/item/weapon/storage/belt/suit/ammo/csla/lmg = 2
		)

/obj/item/weapon/storage/box/cargo/csla/sergeant
	name = "CSLA chetar kit."
	desc = "Box with squad leader kit."
	startswith = list(
		/obj/item/ammo_magazine/c762x39m = 5,
		/obj/item/weapon/storage/firstaid/combat/wp,
		/obj/item/weapon/material/knife/bayonet/csla,
		/obj/item/weapon/grenade/frag,
		/obj/item/weapon/grenade/frag/high_yield,
		/obj/item/device/binoculars/wp,
		/obj/item/ammo_magazine/a9x18 = 2
		)

/obj/item/weapon/storage/box/cargo/csla/advanced
	name = "CSLA subchetar kit."
	desc = "Box with grenades and ammo inside."
	startswith = list(
		/obj/item/ammo_magazine/c762x39m = 7,
		/obj/item/weapon/storage/firstaid/combat/wp,
		/obj/item/weapon/material/knife/bayonet/csla,
		/obj/item/weapon/grenade/frag/high_yield = 2,
		/obj/item/weapon/storage/backpack/gl/csla
		)

// USMC //

/obj/item/weapon/storage/box/cargo/usmc
	name = "USMC kit."
	desc = "Box with kit."
	icon_state = "usmc_cargo"

/obj/item/weapon/storage/box/cargo/usmc/standart
	name = "USMC rifleman kit."
	desc = "Box with standart kit."
	startswith = list(
		/obj/item/ammo_magazine/c556x45m = 7,
		/obj/item/weapon/storage/firstaid/combat/nato,
		/obj/item/weapon/material/knife/bayonet/usmc,
		/obj/item/weapon/grenade/frag = 2
		)

/obj/item/weapon/storage/box/cargo/usmc/medic
	name = "USMC corpsman kit."
	desc = "Box with medical kit."
	startswith = list(
		/obj/item/weapon/storage/firstaid/regular = 2,
		/obj/item/ammo_magazine/c556x45m = 3,
		/obj/item/weapon/material/knife/bayonet/usmc,
		/obj/item/device/healthanalyzer,
		/obj/item/roller,
		/obj/item/weapon/storage/box/syringes
		)

/obj/item/weapon/storage/box/cargo/usmc/grenadier
	name = "USMC grenadier kit."
	desc = "Box with rockets inside."
	startswith = list(
		/obj/item/ammo_magazine/c556x45m = 7,
		/obj/item/weapon/storage/firstaid/combat/nato,
		/obj/item/weapon/storage/backpack/smaw,
		/obj/item/ammo_casing/rpg_missile = 3,
		/obj/item/weapon/material/knife/bayonet/usmc
		)

/obj/item/weapon/storage/box/cargo/usmc/grenadier/assistant
	name = "USMC grenadier assistant kit."
	desc = "Box with rockets inside."
	startswith = list(
		/obj/item/ammo_magazine/c556x45m = 7,
		/obj/item/weapon/storage/firstaid/combat/nato,
		/obj/item/weapon/storage/backpack/smaw,
		/obj/item/ammo_casing/rpg_missile = 3,
		/obj/item/weapon/material/knife/bayonet/usmc,
		/obj/item/weapon/grenade/frag
		)

/obj/item/weapon/storage/box/cargo/usmc/sniper
	name = "USMC designated marksman kit."
	desc = "Box with marksman kit inside."
	startswith = list(
		/obj/item/ammo_magazine/c762x51s = 7,
		/obj/item/weapon/storage/firstaid/combat/nato,
		/obj/item/weapon/material/knife/bayonet/usmc,
		/obj/item/weapon/mine/usmc = 2,
		/obj/item/device/binoculars/nato
		)

/obj/item/weapon/storage/box/cargo/usmc/machinegunner
	name = "USMC machinegunner kit."
	desc = "Box with machinegunner kit inside."
	startswith = list(
		/obj/item/ammo_magazine/c762x51b = 3,
		/obj/item/weapon/storage/firstaid/combat,
		/obj/item/weapon/material/knife/bayonet/usmc,
		/obj/item/weapon/storage/belt/suit/ammo/usmc/lmg = 2
		)

/obj/item/weapon/storage/box/cargo/usmc/sergeant
	name = "USMC sergeant kit."
	desc = "Box with squad leader kit."
	startswith = list(
		/obj/item/ammo_magazine/c556x45m = 5,
		/obj/item/weapon/storage/firstaid/combat/nato,
		/obj/item/weapon/material/knife/bayonet/usmc,
		/obj/item/weapon/grenade/frag,
		/obj/item/weapon/grenade/frag/high_yield,
		/obj/item/device/binoculars/nato,
		/obj/item/ammo_magazine/c45m = 2
		)

/obj/item/weapon/storage/box/cargo/usmc/advanced
	name = "USMC corporal kit."
	desc = "Box with fireteam leader kit."
	startswith = list(
		/obj/item/ammo_magazine/c556x45m = 7,
		/obj/item/weapon/storage/firstaid/combat/nato,
		/obj/item/weapon/material/knife/bayonet/usmc,
		/obj/item/weapon/grenade/frag/high_yield = 2,
		/obj/item/weapon/storage/backpack/gl/usmc
		)

// BDW //

/obj/item/weapon/storage/box/cargo/bdw
	name = "BDW kit."
	desc = "Box with kit."
	icon_state = "bdw_cargo"

/obj/item/weapon/storage/box/cargo/bdw/standart
	name = "BDW schutze kit."
	desc = "Box with standart kit."
	startswith = list(
		/obj/item/ammo_magazine/c762x51s = 7,
		/obj/item/weapon/storage/firstaid/combat/nato,
		/obj/item/weapon/material/knife/bayonet/bdw,
		/obj/item/weapon/grenade/frag = 2
		)

/obj/item/weapon/storage/box/cargo/bdw/medic
	name = "BDW sanitater kit."
	desc = "Box with medical kit."
	startswith = list(
		/obj/item/weapon/storage/firstaid/regular = 2,
		/obj/item/device/healthanalyzer,
		/obj/item/ammo_magazine/c762x51s = 3,
		/obj/item/roller,
		/obj/item/weapon/storage/box/syringes,
		/obj/item/weapon/material/knife/bayonet/bdw
		)

/obj/item/weapon/storage/box/cargo/bdw/grenadier
	name = "BDW grenadier kit."
	desc = "Box with grenades inside."
	startswith = list(
		/obj/item/ammo_magazine/c762x51s = 7,
		/obj/item/weapon/storage/firstaid/combat/nato,
		/obj/item/weapon/storage/backpack/gl/bdw/big,
		/obj/item/weapon/material/knife/bayonet/bdw
		)

/obj/item/weapon/storage/box/cargo/bdw/grenadier/assistant
	name = "BDW grenadier assistant kit."
	desc = "Box with grenades inside."
	startswith = list(
		/obj/item/ammo_magazine/c762x51s = 7,
		/obj/item/weapon/storage/firstaid/combat/nato,
		/obj/item/weapon/storage/backpack/gl/bdw/big,
		/obj/item/weapon/material/knife/bayonet/bdw,
		/obj/item/weapon/grenade/frag
		)

/obj/item/weapon/storage/box/cargo/bdw/sniper
	name = "BDW marksman kit."
	desc = "Box with marksman kit inside."
	startswith = list(
		/obj/item/ammo_magazine/c762x51s = 7,
		/obj/item/weapon/storage/firstaid/combat/nato,
		/obj/item/weapon/material/knife/bayonet/bdw,
		/obj/item/weapon/mine/usmc = 2,
		/obj/item/device/binoculars/nato
		)

/obj/item/weapon/storage/box/cargo/bdw/machinegunner
	name = "BDW maschinengewehrschutze kit."
	desc = "Box with machinegunner kit inside."
	startswith = list(
		/obj/item/ammo_magazine/c762x51b/bdw = 5,
		/obj/item/weapon/storage/firstaid/combat/nato,
		/obj/item/weapon/material/knife/bayonet/bdw,
		/obj/item/weapon/storage/belt/suit/ammo/bdw/lmg = 2
		)

/obj/item/weapon/storage/box/cargo/bdw/sergeant
	name = "BDW gruppenfuhrer kit."
	desc = "Box with squad leader kit."
	startswith = list(
		/obj/item/ammo_magazine/c762x51s = 5,
		/obj/item/weapon/storage/firstaid/combat/nato,
		/obj/item/weapon/material/knife/bayonet/bdw,
		/obj/item/weapon/grenade/frag,
		/obj/item/weapon/grenade/frag/high_yield,
		/obj/item/device/binoculars/nato,
		/obj/item/ammo_magazine/a9x19 = 2
		)

/obj/item/weapon/storage/box/cargo/bdw/advanced
	name = "BDW gruppenfuhrer stellvertreter kit."
	desc = "Box with fireteam leader kit."
	startswith = list(
		/obj/item/ammo_magazine/c762x51s = 7,
		/obj/item/weapon/storage/firstaid/combat/nato,
		/obj/item/weapon/material/knife/bayonet/bdw,
		/obj/item/weapon/grenade/frag/high_yield = 2,
		/obj/item/weapon/storage/backpack/gl/bdw
		)

/obj/item/weapon/storage/box/rations
	name = "MRE No.1"
	w_class = 2
	max_storage_space = 8
	desc = "That's a meal-ready-to eat, a 12-hour ration pack used by US army."
	icon_state = "mre"
	startswith = list(/obj/item/weapon/storage/box/matches = 1,
				/obj/item/weapon/reagent_containers/food/snacks/armymaindish/armychocolate = 1,
				/obj/item/weapon/reagent_containers/food/snacks/armymaindish/meatpatty = 1,
				/obj/item/weapon/reagent_containers/food/snacks/armymaindish = 1,
				/obj/item/weapon/reagent_containers/food/snacks/armymaindish/crackers = 1,
				/obj/item/weapon/material/kitchen/utensil/spoon = 1)

/obj/item/weapon/storage/box/rations/beef
	name = "MRE No.2"
	max_storage_space = 8
	desc = "That's a meal-ready-to eat, a 12-hour ration pack used by US army."
	icon_state = "mre"
	startswith = list(/obj/item/weapon/storage/box/matches = 1,
				/obj/item/weapon/reagent_containers/food/snacks/armymaindish/armychocolate = 1,
				/obj/item/weapon/reagent_containers/food/snacks/armymaindish/beef = 1,
				/obj/item/weapon/reagent_containers/food/snacks/armymaindish/frankfurters = 1,
				/obj/item/weapon/reagent_containers/food/snacks/armymaindish/crackers = 1,
				/obj/item/weapon/material/kitchen/utensil/spoon = 1)

/obj/item/weapon/storage/box/rations/vegan
	name = "MRE No.3"
	max_storage_space = 8
	desc = "That's a meal-ready-to eat, a 12-hour ration pack used by US army."
	icon_state = "mre"
	startswith = list(/obj/item/weapon/storage/box/matches = 1,
				/obj/item/weapon/reagent_containers/food/snacks/armymaindish/armychocolate = 1,
				/obj/item/weapon/reagent_containers/food/snacks/armymaindish/vegan = 1,
				/obj/item/weapon/reagent_containers/food/snacks/armymaindish/potatopatty = 1,
				/obj/item/weapon/reagent_containers/food/snacks/armymaindish/crackers = 1,
				/obj/item/weapon/material/kitchen/utensil/spoon = 1)

/obj/item/weapon/storage/box/rations/lasagna
	name = "MRE No.4"
	max_storage_space = 8
	desc = "That's a meal-ready-to eat, a 12-hour ration pack used by US army."
	icon_state = "mre"
	startswith = list(/obj/item/weapon/storage/box/matches = 1,
				/obj/item/weapon/reagent_containers/food/snacks/armymaindish/armychocolate = 1,
				/obj/item/weapon/reagent_containers/food/snacks/armymaindish/burrito = 1,
				/obj/item/weapon/reagent_containers/food/snacks/armymaindish/crackers = 1,
				/obj/item/weapon/reagent_containers/food/snacks/armymaindish/lasagna = 1,
				/obj/item/weapon/material/kitchen/utensil/spoon = 1)

/obj/item/weapon/storage/box/rations/breads
	name = "MRE No.5"
	max_storage_space = 8
	desc = "That's a meal-ready-to eat, a 12-hour ration pack used by US army."
	icon_state = "mre"
	startswith = list(/obj/item/weapon/storage/box/matches = 1,
				/obj/item/weapon/reagent_containers/food/snacks/armymaindish/armychocolate = 1,
				/obj/item/weapon/reagent_containers/food/snacks/armymaindish/hotdog = 2,
				/obj/item/weapon/reagent_containers/food/snacks/armymaindish/crackers = 1,
				/obj/item/weapon/material/kitchen/utensil/spoon = 1)

/obj/item/weapon/storage/box/irp/var1
	name = "'Etalon-1' rations"
	w_class = 2
	max_storage_space = 12
	desc = "That's a ration pack used by Soviet army."
	icon_state = "irp"
	startswith = list(/obj/item/weapon/storage/box/matches = 1,
				/obj/item/weapon/reagent_containers/food/snacks/tincan/stew = 1,
				/obj/item/weapon/reagent_containers/food/snacks/tincan/stewpearlbarley = 1,
				/obj/item/weapon/reagent_containers/food/condiment/sovietsugar/zheldor = 1,
				/obj/item/weapon/reagent_containers/food/condiment/sovietsugar/morflot = 1,
				/obj/item/weapon/reagent_containers/food/snacks/armymaindish/crackers_sov =1,
				/obj/item/weapon/storage/fancy/cigarettes/prima = 1,
				/obj/item/weapon/material/kitchen/utensil/spoon = 1)

/obj/item/weapon/storage/box/irp/var2
	name = "'Etalon-2' rations"
	w_class = 2
	max_storage_space = 12
	desc = "That's a ration pack used by Soviet army."
	icon_state = "irp"
	startswith = list(/obj/item/weapon/storage/box/matches = 1,
				/obj/item/weapon/reagent_containers/food/snacks/tincan/stew = 1,
				/obj/item/weapon/reagent_containers/food/snacks/tincan/stewbuckwheat = 1,
				/obj/item/weapon/reagent_containers/food/condiment/sovietsugar/ = 1,
				/obj/item/weapon/reagent_containers/food/condiment/sovietsugar/tsukor = 1,
				/obj/item/weapon/reagent_containers/food/snacks/armymaindish/crackers_sov = 1,
				/obj/item/weapon/storage/fancy/cigarettes/prima = 1,
				/obj/item/weapon/material/kitchen/utensil/spoon = 1)