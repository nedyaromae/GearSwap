function user_job_setup()

    -- Options: Override default values	

    state.CastingMode:options('SIRD','Normal') 
	state.IdleMode:options('Idle','Magic') 
	state.Weapons:options('Aettir','Agwu','Lycurgos')
	state.UnlockWeapons = M(true, 'Unlock Weapons')
	state.HybridMode:options('Normal','DD')
    state.WeaponskillMode:options('Normal','DD')
	
    select_blu_spells()
	-- Additional local binds
	
    select_default_macro_book()
end

function init_gear_sets()
	
	--------------------------------------
	-- Precast sets
	--------------------------------------
	
  sets.Enmity = {ammo={name="Sapience Orb",priority=3},
        head={name="Halitus Helm",priority=88},neck={name="Unmoving Collar +1",priority=200},ear1={name="Friomisi earring",priority=1},ear2={name="Cryptic Earring",priority=40},
        body={name="Nyame Mail",priority=131},hands={name="Nyame Gauntlets",priority=91},ring1={name="Eihwaz Ring",priority=70},ring2={name="Supershear Ring",priority=30},
        back={name="Solemnity Cape",priority=6},waist={name="Kasiri Belt",priority=30},legs={name="Nyame Flanchard",priority=114},feet={name="Nyame Sollerets",priority=68}}
	

  

    
		
	
   
		
    -- Precast sets to enhance JAs
   
   --RUN stuff 
   	sets.precast.JA['Vallation'] = set_combine(sets.Enmity,{})
	sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']
	sets.precast.JA['Pflug'] = set_combine(sets.Enmity,{})
	sets.precast.JA['Battuta'] = set_combine(sets.Enmity,{head={name="Fu. Bandeau +2",priority=46}})
	sets.precast.JA['Liement'] = set_combine(sets.Enmity,{})
	sets.precast.JA['Gambit'] = set_combine(sets.Enmity,{})
	sets.precast.JA['Rayke'] = set_combine(sets.Enmity,{feet={name="Futhark Boots +1",priority=13}})
	sets.precast.JA['Elemental Sforzo'] = set_combine(sets.Enmity,{})
	sets.precast.JA['Swordplay'] = set_combine(sets.Enmity,{})
	sets.precast.JA['Embolden'] = set_combine(sets.Enmity,{})
	sets.precast.JA['One for All'] = set_combine(sets.Enmity,{})
	
	-- Pulse sets, different stats for different rune modes, stat aligned.
	sets.precast.JA['Vivacious Pulse'] = {}
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
        head={name="Carmine Mask",priority=38},neck={name="Baetyl Pendant",priority=1},ear1={name="Tuisto Earring",priority=150},ear2={name="Loquac. Earring",priority=4},
        body=gear.TaeonFCBody,{priority=59},hands={name="Leyline Gloves",priority=25},ring1=gear.left_moonbeam,{priority=100},ring2={name="Kishar Ring",priority=7},
        back={name="Solemnity Cape",priority=6},waist={name="Plat. Mog. Belt",priority=250},legs={name="Agwu Slops",priority=50},feet={name="Nyame Sollerets",priority=68}}
    sets.precast.FC.DT=set_combine(sets.precast.FC,{})
	
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo={name="Knobkierrie",priority=3},
        head={name="Nyame Helm",priority=91},neck={name="Unmoving Collar +1",priority=200},ear1={name="Moonshade Earring",priority=4},ear2={name="Sherida Earring",priority=1},
        body={name="Nyame Mail",priority=136},hands={name="Nyame Gauntlets",priority=91},ring1={name="Cornelia's Ring",priority=6},ring2=gear.left_moonbeam,{priority=100},
        back={name="Null Shawl",priority=8},waist={name="Plat. Mog. Belt",priority=300},legs={name="Nyame Flanchard",priority=114},feet={name="Nyame Sollerets",priority=68}}

	 sets.precast.WS.DD = {ammo={name="Knobkierrie",priority=3},
        head={name="Nyame Helm",priority=91},neck={name="Rep. Plat. Medal",priority=7},ear1={name="Moonshade Earring",priority=4},ear2={name="Sherida Earring",priority=1},
        body={name="Nyame Mail",priority=136},hands={name="Nyame Gauntlets",priority=91},ring1={name="Cornelia's Ring",priority=6},ring2=gear.left_moonbeam,{priority=100},
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

    sets.midcast.Flash.Meva=set_combine(sets.Enmity.Meva,{})
    sets.midcast.Flash.DT=set_combine(sets.Enmity.DT)

	sets.midcast['Blue Magic'] = set_combine(sets.Enmity.SIRD,{})

	sets.midcast['Blue Magic']['Blank Gaze'] = set_combine(sets.Enmity, {})

	sets.midcast['Blue Magic']['Jettatura'] = set_combine(sets.Enmity,{})
	sets.midcast['Blue Magic']['Healing Breeze']={}




    

    sets.midcast['Enhancing Magic'] = {ammo={name="Pemphredo Tathlum",priority=3},
        head={name="Chev. Armet +2",priority=135},neck={name="Loricate Torque +1",priority=1},ear1={name="Loquac. Earring",priority=4},ear2={name="Chev. Earring +1",priority=6},
        body={name="Shabti Cuirass",priority=102},hands={name="Nyame Gauntlets",priority=91},ring1={name="Murky Ring",priority=7},ring2={name="Moonlight Ring",priority=110},
        back=gear.fastcast_jse_back,{priority=60},waist={name="Plat. Mog. Belt",priority=250},legs={name="Prestige Brais",priority=159},feet={name="Nyame Sollerets",priority=68}}

    sets.midcast['Enhancing Magic'].DT= {ammo={name="Crepuscular Pebble",priority=3},
        head={name="Chev. Armet +2",priority=135},neck={name="Loricate Torque +1",priority=1},ear1={name="Loquac. Earring",priority=4},ear2={name="Chev. Earring +1",priority=6},
        body={name="Nyame Mail",priority=171},hands={name="Nyame Gauntlets",priority=91},ring1={name="Murky Ring",priority=7},ring2={name="Moonlight Ring",priority=110},
        back=gear.fastcast_jse_back,{priority=60},waist={name="Plat. Mog. Belt",priority=250},legs={name="Prestige Brais",priority=159},feet={name="Nyame Sollerets",priority=68}}





    sets.midcast['Blue Magic']['Cocoon']=set_combine(sets.midcast['Enhancing Magic'].SIRD,{})

	sets.midcast.Protect=set_combine(sets.midcast['Enhancing Magic'], {sub="Duban",ring1="Sheltered Ring",priority=5})
    sets.midcast.Protect.DT=set_combine(sets.midcast.Protect,{})

    sets.midcast.Protect.SIRD=set_combine(sets.midcast['Enhancing Magic'].SIRD,{})

    sets.midcast.Shell=set_combine(sets.midcast['Enhancing Magic'], {ring1="Sheltered Ring",priority=5})
    
    sets.midcast.Shell.SIRD=set_combine(sets.midcast['Enhancing Magic'].SIRD,{})

	
	sets.midcast.Phalanx = {ammo={name="Crepuscular Pebble",priority=3},
        head={name="Fu. Bandeau +2",priority=46},neck={name="Unmoving Collar +1",priority=200},ear1={name="Alabaster Earring",priority=100},ear2={name="Tuisto Earring",priority=150},
        body=gear.TaeonPhalanxBody,{priority=59},hands={name="Taeon Gloves",priority=25},ring1={name="Murky Ring",priority=7},ring2={name="Defending Ring"},{priority=8},
        back={name="Solemnity Cape",priority=5},waist={name="Plat. Mog. Belt",priority=250},legs={name="Taeon Tights",priority=47},feet={name="Taeon Boots",priority=13}}

    sets.midcast.Phalanx.DT=set_combine(sets.midcast.Phalanx,{})
	
	sets.midcast.Phalanx.SIRD = {ammo={name="Staunch Tathlum +1",priority=3},
        head={name="Souv. Schaller +1",priority=280},neck={name="Loricate Torque +1",priority=1},ear1={name="Knightly Earring",priority=2},ear2={name="Alabaster Earring",priority=100},
        body={name="Yorium Cuirass",priority=113},hands={name="Souv. Handsch. +1",priority=239},ring1={name="Murky Ring",priority=7},ring2={name="Defending Ring",priority=5},
        back={name="Weard Mantle",{priority=39}},waist={name="Audumbla Sash",priority=8},legs={name="Founder's Hose",priority=54},feet={name="Souveran Schuhs +1",priority=227}}	

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

    -- sets.resting = {main={name="Malignance Sword",priority=9},sub={name="Archduke's Shield",priority=9},ammo={name="Homiliary",priority=3},
      --  head={name="Null Masque",priority=100},neck={name="Unmoving Collar",priority=200},ear1={name="Tuisto Earring",priority=150},ear2={name="Alabaster Earring",priority=100},
       -- body={name="Rev. Surcoat +3",priority=254},hands={name="Nyame Gauntlets",priority=91},ring1={name="Chirich Ring +1",priority=5},ring2={name="Chirich Ring",priority=6},
       -- back=gear.idle_jse_back,{priority=60},waist={name="Fucho-no-obi",priority=7},legs={name="Chev. Cuisses +2",priority=117},feet={name="Nyame Sollerets",priority=68}}

    -- Idle sets
    sets.idle = {ammo={name="Staunch Tathlum +1",priority=3},
    head={name="Null Masque",priority=100},neck={name="Unmoving Collar +1",priority=200},ear1={name="Alabaster Earring",priority=100},ear2={name="Erilaz Earring +1",priority=6},
    body={name="Nyame Mail",priority=136},hands={name="Nyame Gauntlets",priority=91},ring1={name="Fortified Ring",priority=3},ring2={name="Shneddick Ring",priority=4},
    back={name="Null Shawl",priority=5},{priority=60},waist={name="Carrier's Sash",priority=20},legs={name="Nyame Flanchard",priority=114},feet={name="Nyame Sollerets",priority=68}}

    sets.idle.Magic={ammo={name="Staunch Tathlum +1",priority=3},
    head={name="Nyame Helm",priority=91},neck={name="Warder's Charm +1",priority=1},ear1={name="Tuisto Earring",priority=150},ear2={name="Night Earring",priority=4},
    body={name="Nyame Mail",priority=136},hands={name="Nyame Gauntlets",priority=91},ring1={name="Murky Ring",priority=6},ring2={name="Shadow Ring",priority=7},
    back={name="Null Shawl",priority=5},{priority=60},waist={name="Plat. Mog. Belt",priority=250},legs={name="Nyame Flanchard",priority=114},feet={name="Nyame Sollerets",priority=68}}

    sets.idle.Segs= {ammo={name="Eluder's Sachet",priority=3},
    head={name="Nyame Helm",priority=91},neck={name="Unmoving Collar +1",priority=200},ear1={name="Tuisto Earring",priority=150},ear2={name="Chev. Earring +1",priority=6},
    body={name="Nyame Mail",priority=136},hands={name="Nyame Gauntlets",priority=91},ring1={name="Fortified Ring",priority=4},ring2={name="Shneddick Ring",priority=1},
    back={name="Null Shawl",priority=5},{priority=60},waist={name="Carrier's Sash",priority=20},legs={name="Prestige Brais",priority=159},feet={name="Nyame Sollerets",priority=68}}


    sets.idle.Int= {ammo={name="Sapience Orb",priority=3}, --This is for horseshit like kalunga because apparently Dint plays a role in resisting fetters
    head={name="Nyame Helm",priority=91},neck={name="Warder's Charm +1",priority=1},ear1={name="Tuisto Earring",priority=150},ear2={name="Eabani Earring",priority=45},
    body={name="Nyame Mail",priority=136},hands={name="Nyame Gauntlets",priority=91},ring1={name="Murky Ring",priority=3},ring2={name="Shadow Ring",priority=30},
    back={name="Null Shawl",priority=5},waist={name="Plat. Mog. Belt",priority=250},legs={name="Nyame Flanchard",priority=114},feet={name="Nyame Sollerets",priority=68}}

    sets.idle.Evasion={ammo={name="Amar Cluster",priority=3}, --This is for limbus nms 
    head={name="Null Masque",priority=100},neck={name="Unmoving Collar +1",priority=200},ear1={name="Tuisto Earring",priority=150},ear2={name="Eabani Earring",priority=45},
    body={name="Nyame Mail",priority=136},hands={name="Nyame Gauntlets",priority=91},ring1={name="Murky Ring",priority=3},ring2={name="Shadow Ring",priority=30},
    back={name="Null Shawl",priority=5},waist={name="Null Belt",priority=2},legs={name="Nyame Flanchard",priority=114},feet={name="Nyame Sollerets",priority=68}}


	sets.idle.ResistCharm={ammo={name="Staunch Tathlum +1",priority=3},
    head={name="Nyame Helm",priority=91},neck={name="Unmoving Collar +1",priority=200},ear1={name="Night Earring",priority=1},ear2={name="Erilaz Earring +1",priority=6},
    body={name="Nyame Mail",priority=136},hands={name="Nyame Gauntlets",priority=91},ring1={name="Purity Ring",priority=3},ring2={name="Moonlight Ring",priority=110},
    back={name="Solemnity Cape",priority=5},{priority=60},waist={name="Null Belt",priority=20},legs={name="Nyame Flanchard",priority=114},feet={name="Nyame Sollerets",priority=68}}



	--------------------------------------
    -- Defense sets
    --------------------------------------
    
    -- Extra defense sets.  Apply these on top of melee or defense sets.
 
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {head=gear.valorousTH})

    sets.defense.PDT=set_combine(sets.idle,{})
    sets.defense.MDT=set_combine(sets.idle.Magic,{})
    sets.defense.Resist=set_combine(sets.idle.Int,{})
    
	-- Weapons sets
    sets.weapons.Aettir={main="Aettir",sub="Utu Grip"}
	sets.weapons.Agwu={main="Agwu's Claymore",sub="Utu Grip"}
	sets.weapons.Lycurgos={main="Lycurgos",sub="Utu Grip"}
	--------------------------------------
	-- Engaged sets
	--------------------------------------
    
	 sets.engaged = {ammo={name="Coiste Bodhar",priority=3},
        head={name="Nyame Helm",priority=91},neck={name="Unmoving Collar +1",priority=200},ear1={name="Cessance Earring",priority=5},ear2={name="Brutal Earring",priority=6},
        body={name="Nyame Mail",priority=136},hands={name="Nyame Gauntlets",priority=91},ring1=gear.left_moonbeam,{priority=99},ring2={name="Moonlight Ring",priority=110},
        back={name="Null Shawl",priority=7},waist={name="Sailfi Belt +1",priority=7},legs={name="Nyame Flanchard",priority=114},feet={name="Nyame sollerets",priority=68}}

		sets.engaged.DD={ammo={name="Coiste Bodhar",priority=3},
        head={name="Nyame Helm",priority=91},neck={name="Anu Torque",priority=10},ear1={name="Cessance Earring",priority=5},ear2={name="Brutal Earring",priority=6},
        body={name="Nyame Mail",priority=136},hands={name="Nyame Gauntlets",priority=91},ring1={name="Chirich Ring +1",priority=16},ring2={name="Petrov Ring",priority=17},
        back={name="Null Shawl",priority=7},waist={name="Sailfi Belt +1",priority=7},legs={name="Nyame Flanchard",priority=114},feet={name="Carmine Greaves",priority=15}}





   


	--------------------------------------
	-- Custom buff sets
	--------------------------------------

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
	windower.chat.input('/lockstyleset 011')
end
