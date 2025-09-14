-- Setup vars that are user-dependent.  Can override this in a sidecar file.
function user_job_setup()
    state.IdleMode:options('PDT','MDT','Normal')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','MeleeWeapons')
	state.AutoCelerity 			= M(false, 'Auto Celerity Mode')
    state.AutoCaress = M(false, 'Auto Caress Mode')
	state.WakeUpWeapons = M(true, 'Swap Weapons To Wake Up')
    state.UnlockWeapons = M(true, 'Unlock Weapons')

		-- Additional local binds
	
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

	-- Weapons sets
	sets.weapons.MeleeWeapons = {main="Kaja Rod",sub="Diamond Aspis"}
	
    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	sets.buff.Sleep= {main="Prime Maul"}
	sets.WakeUpWeapons ={main="Prime Maul"}
	
    -- Precast Sets

    -- 	 sets for spells
    sets.precast.FC = { main="Grioavolr", -- 11 with aug
    sub="Clerisy Strap", -- 2
    ammo="Sapience Orb", --2 
    head="Ebers Cap +2", --10 
    body="Inyanga Jubbah +2", --14
    hands={ name="Fanatic Gloves", augments={'MP+5','"Fast Cast"+7',}}, --7
    legs="Aya. Cosciales +2", --6
    feet="Regal Pumps +1", --5-7 Depending on unity
    neck="Cleric's Torque", --6 
    waist="Witful Belt", --3 and 3 QC 
    left_ear="Etiolation Earring", --1 i do have a loq but this still caps and has higher hp in FC
    right_ear="Malignance Earring", --4 
    left_ring="Eihwaz Ring", -- 0 but pads hp so i don't drop a bunch
    right_ring="Lebeche Ring", --2 QC
    back="Alaunus's Cape" } --10 
	
 sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {legs="Ebers Pant. +2"})
 sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {})

--	sets.precast.FC.Impact =  set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})

	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Thuellaic Ecu +1"})

    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="Piety Bliaut +3"}
	sets.precast.JA.Devotion = {head="Piety Cap"}


    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Oshasha's treatise",
        head="Nyame Helm",neck="Rep. Plat. Medal",ear1="Brutal Earring",ear2="Moonshade Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Sroda Ring",Ring2="Cornelia's Ring",
        back="Alaunus's Cape",waist="Grunfeld Rope",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
 
		
	sets.MaxTP = {ear1="Cessance Earring",ear2="Brutal Earring"}


    --sets.precast.WS['Flash Nova'] = {}

    --sets.precast.WS['Mystic Boon'] = {}

    -- Midcast Sets

   --  sets.Kiting = {ring1="Shneddick Ring"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	

	-- Conserve Mp set for spells that don't need anything else, for set_combine.
	
	sets.ConserveMP = {main="Grioavolr",sub="Mensch Strap",ammo="Pemphredo Tathlum",
		head="Vanya Hood",waist="Austerity Belt",   
		back="Solemnity Cape",feet="Kaykaus Boots"}
		
	sets.midcast.Teleport = set_combine(sets.ConserveMP,{})
	sets.midcast.Warp=set_combine(sets.ConserveMP,{})
	sets.midcast.Escape=set_combine(sets.ConserveMP,{})
	
	
    sets.midcast.FastRecast = {Main="Grioavolr",sub="Clerisy Strap",ammo="Sapience Orb",
		head="Bunzi's Hat",neck="Cleric's Torque",ear1="Loquac. Earring",ear2="Malignance Earring",
		body="Inyanga Jubbah +2",hands={ name="Fanatic Gloves", augments={'MP+5','"Fast Cast"+7',}},ring1="Murky Ring",ring2="Defending Ring",
		back="Alaunus's Cape",waist="Witful Belt",legs="Aya. Cosciales +2",feet="Ebers Duckbills +2"}
		
		sets.midcast['Arise']=set_combine(sets.midcast.FastRecast,{})
		sets.midcast['Raise III']=set_combine(sets.midcast.FastRecast,{})
		sets.midcast['Raise II']=set_combine(sets.midcast.FastRecast,{})
		sets.midcast['Raise']=set_combine(sets.midcast.FastRecast,{})
		sets.midcast['Reraise IV']=set_combine(sets.ConserveMP,{})
		
    -- Cure sets

	sets.midcast['Full Cure'] = set_combine(sets.midcast.FastRecast,{})
	
	sets.midcast.Cure = {main="Queller Rod",
    sub="Genmei Shield",
    ammo="Staunch Tathlum",
    head="Ebers cap +2",
    body="Theo. Bliaut +2",
    hands="Theophany Mitts +4",
    legs="Ebers Pant. +2",
    feet="Kaykaus Boots",
    neck="Cleric's Torque",
    waist="Austerity Belt",
    left_ear="Glorious Earring",
    right_ear="Nourish. Earring +1",
    left_ring="Murky Ring",
    right_ring="Defending Ring",
    back="Alaunus's Cape",
}
		
	sets.midcast.CureSolace = {
	main="Queller Rod",
    sub="Genmei Shield",
    ammo="Staunch Tathlum",
    head="Ebers cap +2",
    body="Ebers Bliaut +2",
    hands="Theophany Mitts +4",
    legs="Ebers Pant. +2",
    feet="Kaykaus Boots",
    neck="Cleric's Torque",
    waist="Austerity Belt",
    left_ear="Glorious Earring",
    right_ear="Nourish. Earring +1",
    left_ring="Murky Ring",
    right_ring="Defending Ring",
    back="Alaunus's Cape",}

	sets.midcast.LightWeatherCure = {main="Chatoyant Staff",
    sub="Mensch Strap",
    ammo="Staunch Tathlum",
    head="Ebers cap +2",
    body="Theo. Bliaut +2",
    hands="Theophany Mitts +4",
    legs="Ebers Pant. +2",
    feet="Kaykaus Boots",
    neck="Cleric's Torque",
    waist="Korin Obi",
    left_ear="Glorious Earring",
    right_ear="Nourish. Earring +1",
    left_ring="Murky Ring",
    right_ring="Defending Ring",
    back="Alaunus's Cape",}

	sets.midcast.LightWeatherCureSolace = {main="Chatoyant Staff",
    sub="Mensch Strap",
    ammo="Staunch Tathlum",
    head="Ebers cap +2",
    body="Ebers Bliaut +2",
    hands="Theophany Mitts +4",
    legs="Ebers Pant. +2",
    feet="Kaykaus Boots",
    neck="Cleric's Torque",
    waist="Korin Obi",
    left_ear="Glorious Earring",
    right_ear="Nourish. Earring +1",
    left_ring="Murky Ring",
    right_ring="Defending Ring",
    back="Alaunus's Cape",}
		

	sets.midcast.Curaga = {main="Queller Rod",
    sub="Genmei Shield",
    ammo="Staunch Tathlum",
    head="Ebers cap +2",
    body="Theo. Bliaut +2",
    hands="Theophany Mitts +4",
    legs="Ebers Pant. +2",
    feet="Kaykaus Boots",
    neck="Cleric's Torque",
    waist="Austerity Belt",
    left_ear="Glorious Earring",
    right_ear="Nourish. Earring +1",
    left_ring="Murky Ring",
    right_ring="Defending Ring",
   back="Alaunus's Cape",}
		
	sets.midcast.LightWeatherCuraga = {main="Chatoyant Staff",
    sub="Mensch Strap",
    ammo="Staunch Tathlum",
    head="Ebers cap +2",
    body="Theo. Bliaut +2",
    hands="Theophany Mitts +4",
    legs="Ebers Pant. +2",
    feet="Kaykaus Boots",
    neck="Cleric's Torque",
    waist="Korin Obi",
    left_ear="Glorious Earring",
    right_ear="Nourish. Earring +1",
    left_ring="Murky Ring",
    right_ring="Defending Ring",
    back="Alaunus's Cape",}
		

	sets.midcast.Cursna = {main="Gada",
    sub="Thuellaic Ecu +1",
    ammo="Sapience Orb",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body="Ebers Bliaut +2",
    hands="Fanatic Gloves",
    legs="Th. Pantaloons +2",
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Malison Medallion",
    waist="Witful Belt",
    left_ear="Meili Earring",
    right_ear="Ebers Earring",
    left_ring="Menelaus's Ring",
    right_ring="Ephedra Ring",
    back="Alaunus's Cape",}


    sets.midcast.Erase = {Main="Grioavolr",sub="Clerisy Strap",ammo="Staunch Tathlum",
		head="Ebers Cap +2",neck="Cleric's Torque",ear1="Loquac. Earring",ear2="Malignance Earring",
		body="Inyanga Jubbah +2",hands="Ebers Mitts +2",ring1="Murky Ring",ring2="Defending Ring",
		back="Alaunus's Cape",waist="Witful Belt",legs="Aya. Cosciales +2",feet="Ebers Duckbills +2"}

	sets.midcast.StatusRemoval = {Main="Daybreak",sub="Diamond Aspis",ammo="Staunch Tathlum",
		head="Ebers Cap +2",neck="Loricate Torque +1",ear1="Loquac. Earring",ear2="Malignance Earring",
		body="Nyame Mail",hands="Ebers Mitts +2",ring1="Murky Ring",ring2="Lebeche Ring",
		back="Alaunus's Cape",waist="Witful Belt",legs="Nyame Flanchard",feet="Ebers Duckbills +2"}
		

	sets.midcast['Enhancing Magic'] = {main="Gada",sub="Genmei Shield",ammo="Staunch Tathlum",
		head="Telchine Cap",neck="Melic torque",ear1="Mimir Earring",ear2="Andoaa Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1=gear.left_stinky,ring2=gear.right_stinky,
		back="Alaunus's Cape",waist="Embla Sash",legs="Telchine Braconi",feet="Theo. Duckbills +4"}
      
    sets.midcast['Enhancing Magic'].NoSkill= {main="Gada",sub="Genmei Shield",ammo="Staunch Tathlum",
		head="Telchine Cap",neck="Loricate Torque +1",ear1="Mimir Earring",ear2="Eabani Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Murky Ring",ring2="Defending Ring",
		back="Alaunus's Cape",waist="Embla Sash",legs="Telchine Braconi",feet="Theo. Duckbills +4"}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'].NoSkill, {legs="Shedir Seraweels"})

    sets.midcast.Haste= set_combine(sets.midcast['Enhancing Magic'].NoSkill,{})

	sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'].NoSkill, {feet="Ebers Duckbills +2"})

	sets.midcast.Aquaveil= {main="Vadose Rod",sub="Genmei Shield",ammo="Staunch Tathlum",
		head="Chironic Hat",neck="Loricate Torque +1",ear1="Mimir Earring",ear2="Eabani Earring",
		body="Ros. Jaseran +1",hands="Chironic Gloves",ring1="Murky Ring",ring2="Defending Ring",
		back="Alaunus's Cape",waist="Emphatikos Rope",legs="Shedir Seraweels",feet="Theo. Duckbills +4"}


	sets.midcast.Regen = {main="Bolelabunga",sub="Genmei Shield",ammo="Staunch Tathlum",
		head="Inyanga Tiara +2",neck="Loricate torque +1",ear1="Mimir Earring",ear2="Eabani Earring",
		body="Piety Bliaut +3",hands="Ebers Mitts +2",ring1="Murky Ring",ring2="Defending Ring",
		back="Alaunus's Cape",waist="Embla Sash",legs="Th. Pantaloons +2",feet="Theo. Duckbills +4"}
	
    sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'].NoSkill, {ring1="Sheltered Ring"})
    sets.midcast.Protect=set_combine(sets.midcast.Protectra,{})
    sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'].NoSkill, {ring1="Sheltered Ring"})
    sets.midcast.Shell=set_combine(sets.midcast.Shellra,{})
	sets.midcast.BarElement = {main="Beneficus",sub="Diamond Aspis",ammo="Staunch Tathlum",
		head="Ebers Cap +2",neck="Loricate Torque +1",ear1="Mimir Earring",ear2="Andoaa Earring",
		body="Ebers Bliaut +2",hands="Ebers Mitts +2",ring1="Stikini Ring",ring2="Murky Ring",
		back="Alaunus's Cape",waist="Embla Sash",legs="Piety Pantaln. +3",feet="Ebers Duckbills +2"}
		
	sets.midcast.BarStatus = set_combine(sets.midcast['Enhancing Magic'].NoSkill, {neck="Sroda Necklace"})

--	sets.midcast.Impact = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
--		head=empty,neck="Null Loop",ear1="Regal Earring",ear2="Ebers Earring",
--		body="Twilight Cloak",hands="Inyan. Dastanas +2",ring1=gear.left_stinky,ring2=gear.right_stinky,
--		back="Toro Cape",waist="Eschan Stone",legs="Th. Pantaloons +2",feet="Theo. Duckbills +4"}
		
	sets.midcast['Elemental Magic'] = {main="Bunzi's Rod",sub="Diamond Aspis",ammo="Pemphredo Tathlum",
		head="Bunzi's Hat",neck="Sibyl Scarf",ear1="Friomisi Earring",ear2="Malignance Earring",
		body="Bunzi's Robe",hands="Bunzi's Gloves",ring1=gear.left_stinky,ring2=gear.right_stinky,
		back="Alaunus's Cape",waist="Eschan Stone",legs="Bunzi's Pants",feet="Bunzi's Sabots"}


	sets.midcast['Divine Magic'] = {main="Daybreak",sub="Diamond Aspis",ammo="Pemphredo Tathlum",
		head="Ebers Cap +2",neck="Null Loop",ear1="Malignance Earring",ear2="Ebers Earring",
		body="Ebers Bliaut +2",hands="Inyanga Dastanas +2",ring1=gear.left_stinky,ring2=gear.right_stinky,
		back="Alaunus's Cape",waist="Eschan Stone",legs="Th. Pantaloons +2",feet="Theo. Duckbills +4"}
		
	sets.midcast.Holy = {main="Daybreak",sub="Diamond Aspis",ammo="Pemphredo Tathlum",
		head="Bunzi's Hat",neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Malignance Earring",
		body="Bunzi's Robe",hands="Bunzi's Gloves",ring1=gear.left_stinky,ring2=gear.right_stinky,
		back="Alaunus's Cape",waist="Korin Obi",legs="Bunzi's pants",feet="Bunzi's Sabots"}
		
	sets.midcast.CureNuke=set_combine(sets.midcast.Holy,{})
	sets.midcast.HolyII=set_combine(sets.midcast.Holy,{})
	sets.midcast.Banish=set_combine(sets.midcast.Holy,{})
	sets.midcast.BanishII=set_combine(sets.midcast.Banish,{})
	sets.midcast.BanishIII=set_combine(sets.midcast.Banish,{})
	sets.midcast.Banishga=set_combine(sets.midcast.Holy, {hands={ name="Fanatic Gloves", augments={'MP+5','"Fast Cast"+7',}}})
	sets.midcast.BanishgaII=set_combine(sets.midcast.Holy, {hands={ name="Fanatic Gloves", augments={'MP+5','"Fast Cast"+7',}}})
	
	
	sets.midcast['Dark Magic'] = {main="Bunzi's Rod",sub="Diamond Aspis",ammo="Pemphredo Tathlum",
		head="Ebers Cap +2",neck="Null Loop",ear1="Malignance Earring",ear2="Ebers Earring",
		body="Ebers Bliaut +2",hands="Inyanga Dastanas +2",ring1=gear.left_stinky,ring2=gear.right_stinky,
		back="Alaunus's Cape",waist="Eschan Stone",legs="Th. Pantaloons +2",feet="Theo. Duckbills +4"}

    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {waist="Fucho-no-obi"})


    sets.midcast.Aspir = set_combine(sets.midcast.Drain,{})
    sets.midcast.Tractor=set_combine(sets.midcast.FastRecast,{})

	sets.midcast.Stun = {main="Grioavolr",sub="Clerisy Strap",ammo="Sapience Orb",
		head="Bunzi's Hat",neck="Cleric's Torque",ear1="Loquac. Earring",ear2="Malignance Earring",
		body="Inyanga Jubbah +2",hands={ name="Fanatic Gloves", augments={'MP+5','"Fast Cast"+7',}},ring1="Murky Ring",ring2="Defending Ring",
		back="Alaunus's Cape",waist="Witful Belt",legs="Aya. Cosciales +2",feet="Regal Pumps +1"}
		
	

	sets.midcast['Enfeebling Magic'] = {main="Bunzi's Rod",
    sub="Diamond Aspis",
    ammo="Pemphredo Tathlum",
    head="Theophany Cap +2",
    body="Theo. Bliaut +2",
    hands="Theophany Mitts +4",
    legs=gear.Chironic_Enfeeblingpants,
    feet="Theo. Duckbills +4",
    neck="Null Loop",
    waist="Eschan Stone",
    left_ear="Malignance Earring",
    right_ear="Ebers Earring",
    left_ring=gear.left_stinky,
    right_ring=gear.right_stinky,
    back="Alaunus's Cape" }


	sets.midcast.Slow = set_combine(sets.midcast['Enfeebling Magic'],{main="Daybreak"})
    sets.midcast.Paralyze=set_combine(sets.midcast['Enfeebling Magic'],{main="Daybreak"})
    sets.midcast.Addle=set_combine(sets.midcast['Enfeebling Magic'],{main="Daybreak"})
	sets.midcast.Dispelga = set_combine(sets.midcast['Enfeebling Magic'],{main="Daybreak"})

	sets.HPCure={main="Daybreak",sub="Thuellaic Ecu +1",ammo="Staunch Tathlum",
		head="Bunzi's Hat",neck="Unmoving Collar +1",ear1="Tuisto Earring",ear2="Malignance Earring",
		body="Ebers Bliaut +2",hands="Nyame Gauntlets",ring1="Murky Ring",ring2="Defending Ring",
		back="Alaunus's Cape",waist="Plat. Mog. Belt",legs="Ebers Pant. +2",feet="Nyame Sollerets"}

	sets.midcast.Dia = set_combine(sets.midcast.StatusRemoval, sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast.StatusRemoval, sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast.StatusRemoval,{})
	sets.midcast.Bio = set_combine(sets.midcast.StatusRemoval, sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast.StatusRemoval,{})

 --   sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})

--	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {waist="Acuity Belt +1"})

--	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {back="Alaunus's Cape"})
    -- Sets to return to when not performing an action.

sets.Refresh_Received = {waist="Gishdubar Sash"}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
sets.idle={
    main="Daybreak",
    sub="Diamond Aspis",
    ammo="Homiliary",
    head=gear.Chironic_refreshhat,
    body="Ebers Bliaut +2",
    hands=gear.Chironic_refreshgloves,
    legs="Ebers Pant. +2",
    feet="Ebers Duckbills +2",
    neck="Loricate Torque +1",
    waist="Carrier's Sash",
    left_ear="Etiolation Earring",
    right_ear="Eabani Earring",
    left_ring="Murky Ring",
    right_ring="Shneddick Ring",
    back="Alaunus's Cape"
}

	sets.idle.PDT = {main="Daybreak",
   sub="Diamond Aspis",
   ammo="Homiliary",
   head="Null Masque",
   body="Ebers Bliaut +2",
   hands="Nyame Gauntlets",
   legs="Nyame Flanchard",
   feet="Nyame Sollerets",
   neck="Loricate Torque +1",
   waist="Carrier's Sash",
   left_ear="Mimir Earring",
   right_ear="Eabani Earring",
   left_ring="Murky Ring", 
   right_ring="Defending Ring",
   back="Shadow Mantle" }

	sets.idle.MDT = {main="Daybreak",
   sub="Diamond Aspis",
   ammo="Homiliary",
   head="Null Masque",
   body="Ebers Bliaut +2",
   hands="Bunzi's Gloves",
   legs="Bunzi's Pants",
   feet="Ebers Duckbills +2",
   neck="Warder's Charm +1",
   waist="Carrier's Sash",
   left_ear="Etiolation Earring",
   right_ear="Eabani Earring",
   left_ring="Murky Ring", 
   right_ring="Shadow Ring",
    back="Alaunus's Cape"
}
sets.IdleWakeUp = {main="Prime Maul"}
    -- Defense sets

	sets.defense.PDT = {main="Daybreak",sub="Diamond Aspis",ammo="Eluder's Sachet",
		head="Null Masque",neck="Loricate Torque +1",ear1="Tuisto Earring",ear2="Eabani Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Murky Ring",ring2="Shadow Ring",
		back="Shadow Mantle",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

  
		
		
		
		-- Resting sets
	sets.resting={
    main="Chatoyant Staff",
    sub="Mensch Strap",
    ammo="Homiliary",
    head=gear.Chironic_refreshhat,
    body="Ebers Bliaut +2",
    hands=gear.Chironic_refreshgloves,
    legs="Ebers Pant. +2",
    feet="Ebers Duckbills +2",
    neck="Warder's Charm +1",
    waist="Austerity Belt",
    left_ear="Meili Earring",
    right_ear="Eabani Earring",
    left_ring="Murky Ring",
    right_ring="Chirich Ring +1",
    back="Alaunus's Cape"
}
		-- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Basic set for if no TP weapon is defined.
    sets.engaged = {main="Maxentius",sub="Diamond Aspis",ammo="Oshasha's treatise",
        head="Nyame Helm",neck="Lissome Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Nyame Mail",hands="Gazu Bracelets +1",ring1="Chirich Ring +1",Ring2="Chirich Ring",
        back="Alaunus's Cape",waist="Grunfeld Rope",legs="Nyame Flanchard",feet="Nyame Sollerets"}

		-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Ebers Mitts +2"}

--	sets.buff.Doom = set_combine(sets.buff.Doom, {})

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 3)
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 001')
end
