-- Setup vars that are user-dependent.  Can override this in a sidecar file.
function user_job_setup()
    state.IdleMode:options('PDT','MDT','Normal','Magic','Physical')
	state.PhysicalDefenseMode:options('PDT')
	state.OffenseMode:options('Normal','FullAcc')
    state.CastingMode:options('Normal','SIRD')
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
	sets.weapons.MeleeWeapons = {main="Maxentius",sub="Diamond Aspis"}
	
    sets.buff.Sublimation={waist="Embla Sash"}
    sets.buff.DTSublimation={waist="Embla Sash"}
	sets.buff.Sleep={main="Prime Maul"}
	sets.WakeUpWeapons={main="Prime Maul"}
	
    -- Precast Sets

    -- 	 sets for spells
    sets.precast.FC = {main="Grioavolr",sub="Clerisy Strap +1",ammo="Impatiens",
		head="Ebers Cap +2",neck="Cleric's Torque",ear1="Malignance Earring",ear2="Etiolation Earring",
		body="Inyanga Jubbah +2",hands="Fanatic Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
		back="Alaunus's Cape",waist="Witful Belt",legs="Prestige Brais",feet="Regal Pumps +1"}
	
    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {})
    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {})

	sets.precast.FC.Impact =  set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})

	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Thuellaic Ecu +1"})

    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="Piety Bliaut +3"}
	sets.precast.JA.Devotion = {head="Piety Cap"}


    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Oshasha's treatise",
        head="Nyame Helm",neck="Rep. Plat. Medal",ear1="Brutal Earring",ear2="Moonshade Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Cornelia's Ring",Ring2="Sroda Ring",
        back="Alaunus's Cape",waist="Grunfeld Rope",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
    sets.precast.WS['Black Halo'] = {ammo="Oshasha's treatise",
        head="Nyame Helm",neck="Rep. Plat. Medal",ear1="Ishvara Earring",ear2="Moonshade Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Cornelia's Ring",Ring2="Metamor. Ring +1",
        back="Alaunus's Cape",waist="Grunfeld Rope",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.precast.WS['Seraph Strike'] =  {ammo="Oshasha's treatise",
        head="Nyame Helm",neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Moonshade Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Cornelia's Ring",Ring2="Metamor. Ring +1",
        back="Alaunus's Cape",waist="Eschan Stone",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	sets.MaxTP = {ear1="Cessance Earring",ear2="Brutal Earring"}


    -- Midcast Sets

    sets.latent_refresh = {waist="Fucho-no-obi"}
	

	-- Conserve Mp set for spells that don't need anything else, for set_combine.
	
	sets.ConserveMP = {main="Grioavolr",sub="Mensch Strap +1",ammo="Pemphredo Tathlum",
		head="Vanya Hood",waist="Austerity Belt",   
		back="Solemnity Cape",feet="Kaykaus Boots"}
		
	sets.midcast.Teleport = set_combine(sets.ConserveMP,{})
	sets.midcast.Warp=set_combine(sets.ConserveMP,{})
	sets.midcast.Escape=set_combine(sets.ConserveMP,{})
	
	
    sets.midcast.FastRecast = {Main="Grioavolr",sub="Clerisy Strap +1",ammo="Sapience Orb",
		head="Bunzi's Hat",neck="Cleric's Torque",ear1="Malignance Earring",ear2="Alabaster Earring",
		body="Inyanga Jubbah +2",hands="Fanatic Gloves",ring1="Murky Ring",ring2="Defending Ring",
		back="Alaunus's Cape",waist="Witful Belt",legs="Prestige Brais",feet="Regal Pumps +1"}
		
	sets.midcast['Arise']=set_combine(sets.midcast.FastRecast,{})
	sets.midcast['Raise III']=set_combine(sets.midcast.FastRecast,{})
	sets.midcast['Raise II']=set_combine(sets.midcast.FastRecast,{})
	sets.midcast['Raise']=set_combine(sets.midcast.FastRecast,{})
	sets.midcast['Reraise IV']=set_combine(sets.ConserveMP,{})
		
    -- Cure sets

	sets.midcast['Full Cure'] = set_combine(sets.midcast.FastRecast,{})
	
	sets.midcast.Cure = {Main="Queller Rod",sub="Genmei Shield",ammo="Crepuscular Pebble",
		head="Ebers Cap +2",neck="Cleric's Torque",ear1="Glorious Earring",ear2="Nourish. Earring +1",
		body="Theo. Bliaut +4",hands="Theo. Mitts +4",ring1="Murky Ring",ring2="Defending Ring",
		back="Alaunus's Cape",waist="Austerity Belt",legs="Ebers Pant. +2",feet="Kaykaus Boots"}

    sets.midcast.Cure.DT=set_combine(sets.midcast.Cure.SIRD,{})	
	sets.midcast.CureSolace=set_combine(sets.midcast.Cure,{body="Ebers Bliaut +2"})
	sets.midcast.LightWeatherCure=set_combine(sets.midcast.Cure,{Main="Chatoyant Staff",sub="Mensch Strap +1",waist="Hachirin-No-Obi"})
	sets.midcast.LightWeatherCureSolace=set_combine(sets.midcast.LightWeatherCure,{body="Ebers Bliaut +2"})
	sets.midcast.Curaga=set_combine(sets.midcast.Cure,{})
    sets.midcast.Curaga.DT=set_combine(sets.midcast.Curaga.SIRD,{})
	sets.midcast.LightWeatherCuraga=set_combine(sets.midcast.Curaga,{Main="Chatoyant Staff",sub="Mensch Strap +1",waist="Hachirin-No-Obi"})

    sets.midcast.Cure.SIRD={main="Queller Rod",sub="Genmei Shield",ammo="Staunch Tathlum +1",
		head="Ebers Cap +2",neck="Loricate Torque +1",ear1="Glorious Earring",ear2="Nourish. Earring +1",
		body="Theo. Bliaut +4",hands=gear.Chironic_Sirdgloves,ring1="Murky Ring",ring2="Defending Ring",
		back="Alaunus's Cape",waist="Emphatikos Rope",legs="Ebers Pant. +2",feet="Theo. Duckbills +4"}

    sets.midcast.CureSolace.SIRD={main="Queller Rod",sub="Genmei Shield",ammo="Staunch Tathlum +1",
		head="Ebers Cap +2",neck="Loricate Torque +1",ear1="Glorious Earring",ear2="Nourish. Earring +1",
		body="Ebers Bliaut +2",hands=gear.Chironic_Sirdgloves,ring1="Murky Ring",ring2="Defending Ring",
		back="Alaunus's Cape",waist="Emphatikos Rope",legs="Ebers Pant. +2",feet="Theo. Duckbills +4"}

    sets.midcast.Curaga.SIRD=set_combine(sets.midcast.Cure.SIRD,{})	

	sets.midcast.Cursna = {Main="Gada",sub="Thuellaic Ecu +1",ammo="Sapience Orb",
		head="Vanya Hood",neck="Debilis Medallion",ear1="Meili Earring",ear2="Ebers Earring",
		body="Ebers Bliaut +2",hands="Fanatic Gloves",ring1="Menelaus's Ring",ring2="Haoma's Ring",
		back="Alaunus's Cape",waist="Bishop's Sash",legs="Th. Pant. +3",feet="Vanya Clogs"}

    sets.midcast.StatusRemoval = {Main="Queller Rod",sub="Diamond Aspis",ammo="Sapience Orb",
		head="Ebers Cap +2",neck="Cleric's Torque",ear1="Malignance Earring",ear2="Alabaster Earring",
		body="Inyanga Jubbah +2",hands="Fanatic Gloves",ring1="Murky Ring",ring2="Defending Ring",
		back="Alaunus's Cape",waist="Witful Belt",legs="Prestige Brais",feet="Ebers Duckbills +2"}
		
	sets.midcast['Enhancing Magic'] = {main="Gada",sub="Ammurapi Shield",ammo="Crepuscular Pebble",
		head="Telchine Cap",neck="Melic torque",ear1="Mimir Earring",ear2="Andoaa Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1=gear.left_stinky,ring2=gear.right_stinky,
		back="Alaunus's Cape",waist="Embla Sash",legs="Telchine Braconi",feet="Theo. Duckbills +4"}
      
    sets.midcast['Enhancing Magic'].NoSkill= {main="Gada",sub="Ammurapi Shield",ammo="Crepuscular Pebble",
		head="Telchine Cap",neck="Loricate Torque +1",ear1="Alabaster Earring",ear2="Ran Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Murky Ring",ring2="Defending Ring",
		back="Alaunus's Cape",waist="Embla Sash",legs="Telchine Braconi",feet="Theo. Duckbills +4"}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'].NoSkill, {legs="Shedir Seraweels"})
    sets.midcast.Haste= set_combine(sets.midcast['Enhancing Magic'].NoSkill,{})
	sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'].NoSkill, {feet="Ebers Duckbills +2"})
	sets.midcast.Aquaveil= {main="Vadose Rod",sub="Genmei Shield",ammo="Staunch Tathlum +1",
		head="Chironic Hat",neck="Loricate Torque +1",ear1="Mimir Earring",ear2="Ran Earring",
		body="Ros. Jaseran +1",hands=gear.Chironic_Sirdgloves,ring1="Murky Ring",ring2="Defending Ring",
		back="Alaunus's Cape",waist="Emphatikos Rope",legs="Shedir Seraweels",feet="Theo. Duckbills +4"}

	sets.midcast.Regen = {main="Bolelabunga",sub="Ammurapi Shield",ammo="Crepuscular Pebble",
		head="Inyanga Tiara +2",neck="Loricate torque +1",ear1="Alabaster Earring",ear2="Ran Earring",
		body="Piety Bliaut +3",hands="Ebers Mitts +2",ring1="Murky Ring",ring2="Defending Ring",
		back="Alaunus's Cape",waist="Embla Sash",legs="Th. Pant. +3",feet="Theo. Duckbills +4"}
	
    sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'].NoSkill, {ring2="Sheltered Ring"})
    sets.midcast.Protect=set_combine(sets.midcast.Protectra,{})
    sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'].NoSkill, {ring2="Sheltered Ring"})
    sets.midcast.Shell=set_combine(sets.midcast.Shellra,{})
    
	sets.midcast.BarElement = {main="Beneficus",sub="Ammurapi Shield",ammo="Crepuscular Pebble",
		head="Ebers Cap +2",neck="Loricate Torque +1",ear1="Mimir Earring",ear2="Andoaa Earring",
		body="Ebers Bliaut +2",hands="Ebers Mitts +2",ring1="Murky Ring",ring2="Stikini Ring",
		back="Alaunus's Cape",waist="Embla Sash",legs="Piety Pantaln. +3",feet="Ebers Duckbills +2"}
		
	sets.midcast.BarStatus = set_combine(sets.midcast['Enhancing Magic'].NoSkill, {neck="Sroda Necklace"})

    sets.midcast['Enhancing Magic']['Aurorastorm']=set_combine(sets.midcast['Enhancing Magic'].NoSkill)

	sets.midcast.Impact = {main="Bunzi's Rod",sub="Diamond Aspis",ammo="Pemphredo Tathlum",
		head=empty,neck="Null Loop",ear1="Malignance Earring",ear2="Ebers Earring",
		body="Twilight Cloak",hands="Theo. Mitts +4",ring1=gear.left_stinky,ring2="Metamorph Ring +1",
		back="Null Shawl",waist="Null Belt",legs="Th. Pant. +3",feet="Theo. Duckbills +4"}
		
	sets.midcast['Elemental Magic'] = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="Bunzi's Hat",neck="Sibyl Scarf",ear1="Malignance Earring",ear2="Friomisi Earring",
		body="Bunzi's Robe",hands="Bunzi's Gloves",ring1="Freke Ring",ring2="Metamorph Ring +1",
		back="Alaunus's Cape",waist="Eschan Stone",legs="Bunzi's Pants",feet="Bunzi's Sabots"}

	sets.midcast.Holy = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="Bunzi's Hat",neck="Baetyl Pendant",ear1="Malignance Earring",ear2="Friomisi Earring",
		body="Bunzi's Robe",hands="Bunzi's Gloves",ring1="Freke Ring",ring2="Metamorph Ring +1",
		back="Alaunus's Cape",waist="Hachirin-No-Obi",legs="Bunzi's pants",feet="Bunzi's Sabots"}

    sets.midcast.CureNuke=set_combine(sets.midcast.Holy,{})
	sets.midcast.HolyII=set_combine(sets.midcast.Holy,{})
	sets.midcast.Banish=set_combine(sets.midcast.Holy,{})
	sets.midcast.BanishII=set_combine(sets.midcast.Banish,{})
	sets.midcast.BanishIII=set_combine(sets.midcast.Banish,{})
	sets.midcast.Banishga=set_combine(sets.midcast.Holy,{hands="Fanatic Gloves"})
	sets.midcast.BanishgaII=set_combine(sets.midcast.Holy,{hands="Fanatic Gloves"})

    sets.midcast.Flash= {Main="Grioavolr",sub="Clerisy Strap +1",ammo="Sapience Orb",
		head="Null Masque",neck="Unmoving Collar +1",ear1="Friomisi Earring",ear2="Cryptic Earring",
		body="Inyanga Jubbah +2",hands="Nyame Gauntlets",ring1="Supershear Ring",ring2="Eihwaz Ring",
		back="Alaunus's Cape",waist="Embla Sash",legs="Prestige Brais",feet="Ebers Duckbills +2"}
    sets.midcast.Flash.DT=set_combine(sets.midcast.Flash,{})
		
	sets.midcast.Stun = {main="Grioavolr",sub="Clerisy Strap +1",ammo="Sapience Orb",
		head="Bunzi's Hat",neck="Cleric's Torque",ear1="Malignance Earring",ear2="Loquac. Earring",
		body="Inyanga Jubbah +2",hands="Fanatic Gloves",ring1="Murky Ring",ring2="Defending Ring",
		back="Alaunus's Cape",waist="Witful Belt",legs="Prestige Brais",feet="Regal Pumps +1"}

	sets.midcast['Enfeebling Magic'] = {main="Bunzi's Rod",sub="Diamond Aspis",ammo="Pemphredo Tathlum",
		head="Theophany Cap +4",neck="Null Loop",ear1="Malignance Earring",ear2="Ebers Earring",
		body="Theo. Bliaut +4",hands="Theo. Mitts +4",ring1=gear.left_stinky,ring2="Metamor. Ring +1",
		back="Null Shawl",waist="Null Belt",legs=gear.Chironic_Enfeeblingpants,feet="Theo. Duckbills +4"}

    sets.midcast.Repose = set_combine{sets.midcast['Enfeebling Magic'],{legs="Th. Pant. +3"}}
    sets.midcast['Dark Magic'] =  set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {waist="Fucho-no-obi"})
    sets.midcast.Aspir = set_combine(sets.midcast.Drain,{})
    sets.midcast.Tractor=set_combine(sets.midcast.FastRecast,{})

	sets.midcast.Slow = set_combine(sets.midcast['Enfeebling Magic'],{main="Daybreak",sub="Ammurapi Shield",head="Null Masque"})
    sets.midcast.Paralyze=set_combine(sets.midcast['Enfeebling Magic'],{main="Daybreak",sub="Ammurapi Shield",head="Null Masque"})
    sets.midcast.Addle=set_combine(sets.midcast['Enfeebling Magic'],{main="Daybreak",sub="Ammurapi Shield",head="Null Masque"})
	sets.midcast.Dispelga = set_combine(sets.midcast['Enfeebling Magic'],{main="Daybreak"})

	sets.HPCure={main="Daybreak",sub="Thuellaic Ecu +1",ammo="Sapience Orb",
		head="Ebers Cap +2",neck="Unmoving Collar +1",ear1="Tuisto Earring",ear2="Alabaster Earring",
		body="Ebers Bliaut +2",hands="Nyame Gauntlets",ring1="Murky Ring",ring2="Defending Ring",
		back="Alaunus's Cape",waist="Plat. Mog. Belt",legs="Ebers Pant. +2",feet="Nyame Sollerets"}

	sets.midcast.Dia = set_combine(sets.midcast.StatusRemoval, sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast.StatusRemoval, sets.TreasureHunter)
	sets.midcast['Dia II'] = {Main="Queller Rod",sub="Diamond Aspis",ammo="Crepuscular Pebble",
		head="Bunzi's Hat",neck="Loricate Torque +1",ear1="Ran Earring",ear2="Loquac. Earring",
		body="Nyame Mail",hands="Ebers Mitts +2",ring1="Kishar Ring",ring2="Lebeche Ring",
		back="Alaunus's Cape",waist="Obstinate Sash",legs="Prestige Brais",feet="Ebers Duckbills +2"}

    sets.Refresh_Received = {waist="Gishdubar Sash"}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle={main="Daybreak",sub="Archduke's Shield",ammo="Homiliary",
		head=gear.Chironic_refreshhat,neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Eabani Earring",
		body="Ebers Bliaut +2",hands=gear.Chironic_refreshgloves,ring1="Murky Ring",ring2="Shneddick Ring",
		back="Alaunus's Cape",waist="Carrier's Sash",legs="Ebers Pant. +2",feet="Ebers Duckbills +2"}

    sets.idle.PDT={main="Daybreak",sub="Diamond Aspis",ammo="Homiliary",
		head="Null Masque",neck="Loricate Torque +1",ear1="Ran Earring",ear2="Eabani Earring",
		body="Ebers Bliaut +2",hands="Nyame Gauntlets",ring1="Murky Ring",ring2="Defending Ring",
		back="Null Shawl",waist="Carrier's Sash",legs="Prestige Brais",feet="Nyame Sollerets"}

    sets.idle.MDT={main="Daybreak",sub="Diamond Aspis",ammo="Homiliary",
		head="Null Masque",neck="Warder's Charm +1",ear1="Night Earring",ear2="Eabani Earring",
		body="Ebers Bliaut +2",hands="Bunzi's Gloves",ring1="Murky Ring",ring2="Shadow Ring",
		back="Null Shawl",waist="Null Belt",legs="Ebers Pant. +2",feet="Ebers Duckbills +2"}

    sets.idle.Magic=set_combine(sets.idle.MDT,{})
    sets.idle.Physical=set_combine(sets.idle.PDT,{})
    sets.IdleWakeUp = {main="Prime Maul"}
    -- Defense sets

	sets.defense.PDT = {main="Daybreak",sub="Diamond Aspis",ammo="Crepuscular Pebble",
		head="Null Masque",neck="Warder's Charm +1",ear1="Night Earring",ear2="Eabani Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Murky Ring",ring2="Shadow Ring",
		back="Shadow Mantle",waist="Null Belt",legs="Prestige Brais",feet="Nyame Sollerets"}
		-- Resting sets
	sets.resting={main="Daybreak",sub="Archduke's Shield",ammo="Homiliary",
		head=gear.Chironic_refreshhat,neck="Elite Royal Collar",ear1="Infused Earring",ear2="Eabani Earring",
		body="Ebers Bliaut +2",hands=gear.Chironic_refreshgloves,ring1="Murky Ring",ring2="Chirich Ring +1",
		back="Alaunus's Cape",waist="Fucho-No-Obi",legs="Ebers Pant. +2",feet="Ebers Duckbills +2"}
		-- Engaged sets
    sets.engaged = {ammo="Amar Cluster",
        head="Ayanmo Zucchetto +2",neck="Lissome Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Bunzi's Gloves",ring1="Petrov Ring",Ring2="Chirich Ring +1",
        back="Null Shawl",waist="Grunfeld Rope",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.engaged.FullAcc={ammo="Amar Cluster",
        head="Ayanmo Zucchetto +2",neck="Null Loop",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Gazu Bracelets +1",ring1="Murky Ring",Ring2="Chirich Ring +1",
        back="Null Shawl",waist="Grunfeld Rope",legs="Nyame Flanchard",feet="Nyame Sollerets"}	



    
		-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Ebers Mitts +2"}


end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 3)
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 001')
end
