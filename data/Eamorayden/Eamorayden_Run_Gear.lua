function user_job_setup()

    -- Options: Override default values	

    state.CastingMode:options('Normal','SIRD') 
	state.IdleMode:options('Idle','Magic') 
	state.Weapons:options('Aettir','Agwu','Lycurgos')
	state.UnlockWeapons = M(true, 'Unlock Weapons')
	state.HybridMode:options('Parry','Meva','Normal')
    state.WeaponskillMode:options('Normal','DD')

    gear.parry_jse_back ={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}}
    gear.enmity_jse_back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}}
    gear.fc_jse_back={ name="Ogma's Cape", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10',}}
	
    select_blu_spells()
	-- Additional local binds
	

    select_default_macro_book()

   
end

function init_gear_sets()

	--------------------------------------
	-- Precast sets
	--------------------------------------
	
  sets.Enmity = {ammo={name="Sapience Orb",priority=3},
        head={name="Halitus Helm",priority=88},neck={name="Moonlight Necklace",priority=2},ear1={name="Alabaster Earring",priority=100},ear2={name="Cryptic Earring",priority=40},
        body={name="Emet Harness +1",priority=61},hands={name="Nyame Gauntlets",priority=91},ring1={name="Eihwaz Ring",priority=70},ring2={name="Supershear Ring",priority=30},
        back=gear.enmity_jse_back,{priority=60},waist={name="Plat. Mog. Belt",priority=250},legs={name="Erilaz Leg Guards +2",priority=89},feet={name="Erilaz Greaves +1",priority=18}}
    
    sets.Enmity.SIRD={ammo={name="Staunch Tathlum +1",priority=3}, -- this fucking sucks just don't have everything to make it suck less so this is at least some dt sird cap and a fart of enmity
        head={name="Agwu's Cap",priority=38},neck={name="Moonlight Necklace",priority=2},ear1={name="Alabaster Earring",priority=100},ear2={name="Tuisto Earring",priority=150},
       body={name="Nyame mail",priority=136},hands={name="Rawhide Gloves",priority=75},ring1={name="Murky Ring",priority=7},ring2={name="Moonlight Ring"},{priority=110},
       back=gear.enmity_jse_back,{priority=60},waist={name="Audumbla Sash",priority=8},legs={name="Carmine Cuisses +1",priority=130},feet={name="Taeon Boots",priority=13}}

	

  

    
		
	
   
		
    -- Precast sets to enhance JAs
   
   --RUN stuff 
   	sets.precast.JA['Vallation'] = set_combine(sets.Enmity,{body={name="Runeist Coat +4",priority=228},legs={name="Futhark Trousers +3",priority=107}})
	sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']
	sets.precast.JA['Pflug'] = set_combine(sets.Enmity,{})
	sets.precast.JA['Battuta'] = set_combine(sets.Enmity,{head={name="Fu. Bandeau +2",priority=46}})
	sets.precast.JA['Liement'] = set_combine(sets.Enmity,{})
	sets.precast.JA['Gambit'] = set_combine(sets.Enmity,{hands={name="Runeist Mitons +3",priority=85}})
	sets.precast.JA['Rayke'] = set_combine(sets.Enmity,{feet={name="Futhark Boots +1",priority=13}})
	sets.precast.JA['Elemental Sforzo'] = set_combine(sets.Enmity,{})
	sets.precast.JA['Swordplay'] = set_combine(sets.Enmity,{})
	sets.precast.JA['Embolden'] = set_combine(sets.Enmity,{})
	sets.precast.JA['One for All'] = set_combine(sets.Enmity,{})
	
	-- Pulse sets, different stats for different rune modes, stat aligned.
	sets.precast.JA['Vivacious Pulse'] = {legs={name="Runeist Trousers +3",priority=80}}
	sets.precast.JA['Vivacious Pulse']['Ignis'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Gelus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Flabra'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tellus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Sulpor'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Unda'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Lux'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tenebrae'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})

    -- Fast cast sets for spells
    
   sets.precast.FC ={ ammo={name="Sapience Orb",priority=3},
        head={name="Rune. Bandeau +3",priority=109},neck={name="Baetyl Pendant",priority=1},ear1={name="Loquac. Earring",priority=4},ear2={name="Tuisto Earring",priority=150},
        body=gear.TaeonFCBody,{priority=102},hands={name="Leyline Gloves",priority=25},ring1={name="Prolix Ring",priority=7},ring2={name="Kishar Ring",priority=7},
        back=gear.fc_jse_back,{priority=6},waist={name="Plat. Mog. Belt",priority=250},legs={name="Prestige Brais",priority=159},feet={name="Carmine Greaves +1",priority=95}}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {legs={name="Futhark Trousers +3",priority=107}})
    sets.precast.FC.DT=set_combine(sets.precast.FC,{})
	
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo={name="Knobkierrie",priority=3},
        head={name="Nyame Helm",priority=91},neck={name="Unmoving Collar +1",priority=200},ear1={name="Moonshade Earring",priority=4},ear2={name="Sherida Earring",priority=1},
        body={name="Nyame Mail",priority=136},hands={name="Nyame Gauntlets",priority=91},ring1={name="Cornelia's Ring",priority=6},ring2={name="Moonlight Ring",priority=110},
        back={name="Null Shawl",priority=8},waist={name="Plat. Mog. Belt",priority=300},legs={name="Nyame Flanchard",priority=114},feet={name="Nyame Sollerets",priority=68}}

	 sets.precast.WS.DD = {ammo={name="Knobkierrie",priority=3},
        head={name="Nyame Helm",priority=91},neck={name="Rep. Plat. Medal",priority=7},ear1={name="Moonshade Earring",priority=4},ear2={name="Sherida Earring",priority=1},
        body={name="Nyame Mail",priority=136},hands={name="Nyame Gauntlets",priority=91},ring1={name="Cornelia's Ring",priority=6},ring2={name="Epaminondas's Ring",priority=11},
        back={name="Null Shawl",priority=8},waist={name="Sailfi Belt +1",priority=3},legs={name="Nyame Flanchard",priority=114},feet={name="Nyame Sollerets",priority=68}}

    sets.precast.WS["Armor Break"]={ammo={name="Pemphredo Tathlum",priority=3},
        head={name="Null Masque",priority=100},neck={name="Null Loop",priority=50},ear1={name="Alabaster Earring",priority=100},ear2={name="Erilaz Earring +1",priority=1},
        body={name="Runeist Coat +4",priority=228},hands={name="Nyame Gauntlets",priority=91},ring1={name="Murky Ring",priority=6},ring2={name="Metamor. Ring +1",priority=11},
        back={name="Null Shawl",priority=8},waist={name="Null Belt",priority=3},legs={name="Erilaz Leg Guards +2",priority=90},feet={name="Sworn Sabatons",priority=116}}


    sets.precast.WS["Shockwave"]=set_combine(sets.precast.WS["Armor Break"],{})

    sets.precast.WS["Dimidiation"]= {ammo={name="Knobkierrie",priority=3},
        head={name="Nyame Helm",priority=91},neck={name="Unmoving Collar +1",priority=200},ear1={name="Moonshade Earring",priority=4},ear2={name="Odr Earring",priority=1},
        body={name="Nyame Mail",priority=136},hands={name="Nyame Gauntlets",priority=91},ring1={name="Cornelia's Ring",priority=6},ring2={name="Moonlight Ring",priority=110},
        back={name="Null Shawl",priority=8},waist={name="Plat. Mog. Belt",priority=300},legs={name="Nyame Flanchard",priority=114},feet={name="Nyame Sollerets",priority=68}}

        sets.precast.WS["Dimidiation"].DD={ammo={name="Knobkierrie",priority=3},
        head={name="Nyame Helm",priority=91},neck={name="Rep. Plat. Medal",priority=7},ear1={name="Moonshade Earring",priority=4},ear2={name="Odr Earring",priority=1},
        body={name="Nyame Mail",priority=136},hands={name="Nyame Gauntlets",priority=91},ring1={name="Niqmaddu Ring",priority=6},ring2={name="Cornelia's Ring",priority=11},
        back={name="Null Shawl",priority=8},waist={name="Sailfi Belt +1",priority=3},legs={name="Nyame Flanchard",priority=114},feet={name="Nyame Sollerets",priority=68}}

        sets.precast.WS.DT=set_combine(sets.precast.WS,{})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
   
		

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Cessance Earring",ear2="Brutal Earring",}


	--------------------------------------
	-- Midcast sets
	--------------------------------------
		

    
    sets.midcast.Flash = set_combine(sets.Enmity,{})
	sets.midcast.Foil= set_combine(sets.Enmity,{})
	sets.midcast.Flash.SIRD = set_combine(sets.midcast.Flash,{})
	sets.midcast['Blue Magic'] = set_combine(sets.Enmity.SIRD,{})
	sets.midcast['Blue Magic']['Blank Gaze'] = set_combine(sets.Enmity, {})

	sets.midcast['Blue Magic']['Jettatura'] = set_combine(sets.Enmity,{})
	sets.midcast['Blue Magic']['Healing Breeze']={ammo={name="Staunch Tathlum +1",priority=3},
        head={name="Null Masque",priority=100},neck={name="Futhark Torque +1",priority=45},ear1={name="Alabaster Earring",priority=100},ear2={name="Mendi. Earring",priority=5},
        body={name="Runeist Coat +4",priority=228},hands={name="Nyame Gauntlets",priority=91},ring1={name="Moonbeam Ring",priority=100},ring2={name="Moonlight Ring"},{priority=110},
        back=gear.enmity_jse_back,{priority=60},waist={name="Sroda Belt",priority=5},legs={name="Erilaz Leg Guards +2",priority=90},feet={name="Sworn Sabatons",priority=116}}

    sets.midcast['Blue Magic']['Wild Carrot']=set_combine(sets.midcast['Blue Magic']['Healing Breeze'],{})

    sets.midcast['Enhancing Magic']={ammo={name="Staunch Tathlum +1",priority=3},
        head={name="Erilaz Galea +1",priority=91},neck={name="Futhark Torque +1",priority=45},ear1={name="Alabaster Earring",priority=100},ear2={name="Erilaz Earring +1",priority=6},
        body={name="Nyame Mail",priority=136},hands={name="Nyame Gauntlets",priority=91},ring1={name="Murky Ring",priority=7},ring2={name="Sheltered Ring"},{priority=7},
        back=gear.enmity_jse_back,{priority=60},waist={name="Plat. Mog. Belt",priority=250},legs={name="Futhark Trousers +3",priority=107},feet={name="Nyame Sollerets",priority=68}}

    sets.midcast.Temper={ammo={name="Staunch Tathlum +1",priority=3},
        head={name="Carmine Mask +1",priority=38},neck={name="Hoxne Torque",priority=2},ear1={name="Alabaster Earring",priority=100},ear2={name="Mimir Earring",priority=5},
        body={name="Nyame Mail",priority=136},hands={name="Runeist Mitons +3",priority=85},ring1={name="Murky Ring"},{priority=110},ring2={name="Moonlight Ring"},{priority=110},
        back=gear.enmity_jse_back,{priority=60},waist={name="Plat. Mog. Belt",priority=250},legs={name="Carmine Cuisses +1",priority=130},feet={name="Sworn Sabatons",priority=116}}

    sets.midcast.BarElement=set_combine(sets.midcast.Temper,{head={name="Erilaz Galea +1",priority=91},legs={name="Futhark Trousers +3",priority=107},})

    sets.midcast.Refresh={ammo={name="Staunch Tathlum +1",priority=3},
        head={name="Erilaz Galea +1",priority=91},neck={name="Unmoving Collar +1",priority=200},ear1={name="Alabaster Earring",priority=100},ear2={name="Erilaz Earring +1",priority=6},
        body={name="Nyame Mail",priority=136},hands={name="Nyame Gauntlets",priority=91},ring1={name="Murky Ring",priority=7},ring2={name="Moonlight Ring"},{priority=110},
        back=gear.enmity_jse_back,{priority=60},waist={name="Gishdubar Sash",priority=5},legs={name="Futhark Trousers +3",priority=107},feet={name="Sworn Sabatons",priority=116}}
        
    sets.midcast.Regen={ammo={name="Staunch Tathlum +1",priority=3},
        head={name="Rune. Bandeau +3",priority=109},neck={name="Futhark Torque +1",priority=45},ear1={name="Alabaster Earring",priority=100},ear2={name="Erilaz Earring +1",priority=6},
        body={name="Runeist Coat +4",priority=228},hands={name="Nyame Gauntlets",priority=91},ring1={name="Moonbeam Ring",priority=100},ring2={name="Moonlight Ring"},{priority=110},
        back=gear.enmity_jse_back,{priority=60},waist={name="Sroda Belt",priority=5},legs={name="Futhark Trousers +3",priority=107},feet={name="Sworn Sabatons",priority=116}}

    sets.midcast.Aquaveil={ammo={name="Staunch Tathlum +1",priority=3},
        head={name="Agwu's Cap",priority=38},neck={name="Moonlight Necklace",priority=2},ear1={name="Alabaster Earring",priority=100},ear2={name="Tuisto Earring",priority=150},
       body={name="Nyame Mail",priority=136},hands={name="Rawhide Gloves",priority=75},ring1={name="Murky Ring",priority=7},ring2={name="Moonlight Ring"},{priority=110},
       back=gear.enmity_jse_back,{priority=60},waist={name="Audumbla Sash",priority=8},legs={name="Carmine Cuisses +1",priority=130},feet={name="Taeon Boots",priority=13}}
	
	sets.midcast.Phalanx = {ammo={name="Staunch Tathlum +1",priority=3},
        head={name="Fu. Bandeau +2",priority=46},neck={name="Hoxne Torque",priority=4},ear1={name="Alabaster Earring",priority=100},ear2={name="Tuisto Earring",priority=150},
        body=gear.TaeonPhalanxBody,{priority=59},hands={name="Taeon Gloves",priority=25},ring1={name="Murky Ring",priority=7},ring2={name="Moonlight Ring"},{priority=110},
        back=gear.enmity_jse_back,{priority=60},waist={name="Plat. Mog. Belt",priority=250},legs={name="Taeon Tights",priority=47},feet={name="Taeon Boots",priority=13}}

    sets.midcast.Phalanx.DT=set_combine(sets.midcast.Phalanx,{})

    sets.midcast.Stoneskin={ammo={name="Sapience Orb",priority=3},
    head={name="Rune. Bandeau +3",priority=109},neck={name="Futhark Torque +1",priority=45},ear1={name="Alabaster Earring",priority=100},ear2={name="Earthcry Earring",priority=6},
    body={name="Nyame Mail",priority=136},hands={name="Nyame Gauntlets",priority=91},ring1={name="Murky Ring",priority=3},ring2={name="Moonlight Ring",priority=110},
    back=gear.enmity_jse_back,{priority=60},waist={name="Siegel Sash",priority=8},legs={name="Prestige Brais",priority=159},feet={name="Sworn Sabatons",priority=116}}


	

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

    -- Idle sets
    sets.idle = {ammo={name="Staunch Tathlum +1",priority=3},
    head={name="Null Masque",priority=100},neck={name="Unmoving Collar +1",priority=200},ear1={name="Alabaster Earring",priority=100},ear2={name="Erilaz Earring +1",priority=6},
    body={name="Runeist Coat +4",priority=228},hands={name="Nyame Gauntlets",priority=91},ring1={name="Murky Ring",priority=3},ring2={name="Fortified Ring",priority=4},
    back=gear.enmity_jse_back,{priority=60},waist={name="Null Belt",priority=2},legs={name="Prestige Brais",priority=159},feet={name="Sworn Sabatons",priority=119}}

    sets.idle.Magic={ammo={name="Staunch Tathlum +1",priority=3},
    head={name="Null Masque",priority=91},neck={name="Warder's Charm +1",priority=1},ear1={name="Alabaster Earring",priority=100},ear2={name="Erilaz Earring +1",priority=4},
    body={name="Runeist Coat +4",priority=228},hands={name="Nyame Gauntlets",priority=91},ring1={name="Murky Ring",priority=6},ring2={name="Shadow Ring",priority=7},
    back=gear.enmity_jse_back,{priority=60},waist={name="Plat. Mog. Belt",priority=250},legs={name="Prestige Brais",priority=159},feet={name="Sworn Sabatons",priority=116}}

	sets.idle.ResistCharm={ammo={name="Staunch Tathlum +1",priority=3},
    head={name="Nyame Helm",priority=91},neck={name="Unmoving Collar +1",priority=200},ear1={name="Alabaster Earring",priority=1},ear2={name="Erilaz Earring +1",priority=6},
    body={name="Runeist Coat +4",priority=228},hands={name="Nyame Gauntlets",priority=91},ring1={name="Murky Ring",priority=3},ring2={name="Moonlight Ring",priority=110},
    back={name="Solemnity Cape",priority=5},{priority=60},waist={name="Null Belt",priority=20},legs={name="Prestige Brais",priority=159},feet={name="Sworn Sabatons",priority=116}}


sets.Kiting={ring2={name="Shneddick Ring",priority=4},}
	--------------------------------------
    -- Defense sets
    --------------------------------------
    
    -- Extra defense sets.  Apply these on top of melee or defense sets.
 
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})

    sets.defense.PDT=set_combine(sets.idle,{})
    sets.defense.MDT=set_combine(sets.idle.Magic,{})
    sets.defense.Resist=set_combine(sets.idle,{})
    
	-- Weapons sets
    sets.weapons.Aettir={main="Aettir",sub="Refined Grip +1"}
	sets.weapons.Agwu={main="Agwu's Claymore",sub="Utu Grip"}
	sets.weapons.Lycurgos={main="Lycurgos",sub="Utu Grip"}
	--------------------------------------
	-- Engaged sets
	--------------------------------------
    
	 sets.engaged = {ammo={name="Coiste Bodhar",priority=3},
        head={name="Nyame Helm",priority=91},neck={name="Unmoving Collar +1",priority=200},ear1={name="Cessance Earring",priority=5},ear2={name="Sherida Earring",priority=6},
        body={name="Ashera Harness",priority=182},hands={name="Nyame Gauntlets",priority=91},ring1=gear.left_moonbeam,{priority=99},ring2={name="Moonlight Ring",priority=110},
        back={name="Null Shawl",priority=7},waist={name="Sailfi Belt +1",priority=7},legs={name="Nyame Flanchard",priority=114},feet={name="Nyame sollerets",priority=68}}

    sets.engaged.Meva={ammo={name="Staunch Tathlum +1",priority=3},
        head={name="Nyame Helm",priority=91},neck={name="Futhark Torque +1",priority=45},ear1={name="Alabaster Earring",priority=100},ear2={name="Erilaz Earring +1",priority=6},
        body={name="Runeist Coat +4",priority=228},hands={name="Turms Mittens +1",priority=74},ring1={name="Moonbeam Ring",priority=100},ring2={name="Moonlight Ring",priority=110},
        back=gear.parry_jse_back,{priority=60},waist={name="Null Belt",priority=5},legs={name="Erilaz Leg Guards +2",priority=89},feet={name="Nyame sollerets",priority=68}}

    sets.engaged.Parry={ammo={name="Staunch Tathlum +1",priority=3},
        head={name="Nyame Helm",priority=91},neck={name="Futhark Torque +1",priority=45},ear1={name="Alabaster Earring",priority=100},ear2={name="Tuisto Earring",priority=150},
        body={name="Nyame Mail",priority=136},hands={name="Turms Mittens +1",priority=74},ring1={name="Murky Ring",priority=3},ring2={name="Moonlight Ring",priority=110},
        back=gear.parry_jse_back,{priority=60},waist={name="Carrier's Sash",priority=20},legs={name="Erilaz Leg Guards +2",priority=89},feet={name="Turms Leggings",priority=61}}

	sets.engaged.DD={ammo={name="Coiste Bodhar",priority=3},
        head={name="Nyame Helm",priority=91},neck={name="Anu Torque",priority=10},ear1={name="Cessance Earring",priority=5},ear2={name="Sherida Earring",priority=6},
        body={name="Ashera Harness",priority=182},hands={name="Nyame Gauntlets",priority=91},ring1={name="Niqmaddu Ring",priority=16},ring2={name="Moonlight Ring",priority=110},
        back={name="Null Shawl",priority=7},waist={name="Ioskeha Belt +1",priority=7},legs={name="Nyame Flanchard",priority=114},feet={name="Carmine Greaves +1",priority=15}}





   


	--------------------------------------
	-- Custom buff sets
	--------------------------------------
    sets.buff.Battuta = {hands="Turms Mittens +1"}
	sets.buff.Embolden = {back="Evasionist's Cape"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
   
    if player.sub_job == 'BLU' then
        set_macro_page(1, 7)
    elseif player.sub_job == 'DRK' then
        set_macro_page(3, 5)
    elseif player.sub_job =='SCH' then
        set_macro_page(5, 5)
    else
        set_macro_page(1,7)
    end
end


function select_blu_spells() 
    if player.sub_job =='BLU' then
    send_command('azuresets spellset runsub') else
    end
end
function user_job_lockstyle()
	windower.chat.input('/lockstyleset 012')
end
