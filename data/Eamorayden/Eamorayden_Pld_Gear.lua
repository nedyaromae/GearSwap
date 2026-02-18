function user_job_setup()

    -- Options: Override default values	

    state.CastingMode:options('SIRD','Normal') 
	state.IdleMode:options('Idle','Magic','Segs','ConvertMP','Cleave') 
	state.Weapons:options('SakpataDuban','SakpataAegis','Cleave')
	state.UnlockWeapons = M(true, 'Unlock Weapons')
	state.AutoEmblem = M(false, 'Auto Emblem')
	state.HybridMode:options('Normal')
    state.WeaponskillMode:options('Normal','DD')
	
	gear.fastcast_jse_back = {name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Phys. dmg. taken-10%'}}
	gear.idle_jse_back = {name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Damage taken-5%',}}
	gear.CP_jse_back = {name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Cure" potency +10%','Phys. dmg. taken-10%',}}
    gear.enmity_jse_back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10','Phys. dmg. taken-10%',}}
    gear.wsd_jse_back={name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
    select_blu_spells()
	-- Additional local binds
	
    select_default_macro_book()
end

function init_gear_sets()
	
	--------------------------------------
	-- Precast sets
	--------------------------------------
	
  sets.Enmity = {ammo={name="Sapience Orb",priority=3},
        head={name="Loess Barbuta +1",priority=105},neck={name="Moonbeam Necklace",priority=1},ear1={name="Tuisto earring",priority=150},ear2={name="Cryptic Earring",priority=40},
        body={name="Souv. Cuirass +1",priority=171},hands={name="Souv. Handsch. +1",priority=239},ring1={name="Eihwaz Ring",priority=70},ring2={name="Apeile Ring +1",priority=2},
        back=gear.enmity_jse_back,{priority=60},waist={name="Creed Baudrier",priority=39},legs={name="Souv. Diechlings +1",priority=162},feet={name="Eschite Greaves",priority=98}}
		

    sets.Enmity.Meva = {ammo={name="Sapience Orb",priority=3},
        head={name="Sakpata's Helm",priority=91},neck={name="Unmoving Collar +1",priority=200},ear1={name="Alabaster earring",priority=100},ear2={name="Cryptic Earring",priority=40},
        body={name="Rev. Surcoat +4",priority=264},hands={name="Sakpata's Gauntlets",priority=91},ring1={name="Murky Ring",priority=7},ring2={name="Apeile Ring +1",priority=2},
        back=gear.idle_jse_back,{priority=60},waist={name="Creed Baudrier",priority=39},legs={name="Prestige Brais",priority=159},feet={name="Chev. Sabatons +2",priority=42}}

    sets.Enmity.DT=set_combine(sets.Enmity.Meva,{})
		

    sets.Enmity.SIRD = {ammo={name="Staunch Tathlum +1",priority=3},
        head={name="Souv. Schaller +1",priority=280},neck={name="Moonbeam Necklace",priority=1},ear1={name="Tuisto Earring",priority=150},ear2={name="Cryptic Earring",priority=40},
        body={name="Chev. Cuirass +2",priority=141},hands={name="Souv. Handsch. +1",priority=239},ring1={name="Murky Ring",Priority=15},ring2={name="Defending Ring",priority=5},
        back=gear.enmity_jse_back,{priority=60},waist={name="Audumbla Sash",priority=4},legs={name="Founder's Hose",priority=54},feet={name="Chev. Sabatons +2",priority=42}}

    
		
	
   
		
    -- Precast sets to enhance JAs
    sets.precast.JA['Invincible'] = set_combine(sets.Enmity,{legs="Cab. Breeches +1",priority=24})
    sets.precast.JA['Holy Circle'] = set_combine(sets.Enmity,{feet="Rev. Leggings +1"})
    sets.precast.JA['Sentinel'] = set_combine(sets.Enmity,{feet="Cab. Leggings +4",priority=73})
    sets.precast.JA['Rampart'] = set_combine(sets.Enmity,{head="Cab. Coronet +4",priority=126}) 
    sets.precast.JA['Fealty'] = set_combine(sets.Enmity,{body="Cab. Surcoat +1",priority=70})
    sets.precast.JA['Divine Emblem'] = set_combine(sets.Enmity,{feet="Chev. Sabatons +2",priority=42})
    sets.precast.JA['Cover'] = set_combine(sets.Enmity, {}) --head="Rev. Coronet +1",body="Cab. Surcoat +1"
    --Meva shit for ody bosses 
    sets.precast.JA['Invincible'].DT = set_combine(sets.Enmity.Meva,{legs="Cab. Breeches +1",priority=24})
    sets.precast.JA['Holy Circle'].DT = set_combine(sets.Enmity.Meva,{feet="Rev. Leggings +1"})
    sets.precast.JA['Sentinel'].DT = set_combine(sets.Enmity.Meva,{feet="Cab. Leggings +4",priority=73})
    sets.precast.JA['Rampart'].DT = set_combine(sets.Enmity.Meva,{head="Cab. Coronet +4",priority=126}) 
    sets.precast.JA['Fealty'].DT = set_combine(sets.Enmity.Meva,{body="Cab. Surcoat +1",priority=70})
    sets.precast.JA['Divine Emblem'].DT = set_combine(sets.Enmity.Meva,{feet="Chev. Sabatons +2",priority=42})
    sets.precast.JA['Cover'].DT = set_combine(sets.Enmity.Meva, {}) --head="Rev. Coronet +1",body="Cab. Surcoat +1"

    --WAR stuff 
	sets.precast.JA['Provoke'] = set_combine(sets.Enmity,{})
    sets.precast.JA['Warcry'] = set_combine(sets.Enmity,{})
    sets.precast.JA['Berserk'] = set_combine(sets.Enmity,{})
    sets.precast.JA['Defender'] = set_combine(sets.Enmity,{})
    sets.precast.JA['Aggressor'] = set_combine(sets.Enmity,{})
   
   --RUN stuff 
    sets.precast.JA['Swordplay'] = set_combine(sets.Enmity,{})
	sets.precast.JA['Vallation'] = set_combine(sets.Enmity,{})
	sets.precast.JA['Valiance'] = set_combine(sets.Enmity,{})
	sets.precast.JA['Pflug'] = set_combine(sets.Enmity,{})

	
    -- add mnd for Chivalry
    sets.precast.JA['Chivalry'] = {ammo={name="Crepuscular Pebble",priority=3},
        head={name="Null Masque",priority=100},neck={name="Null Loop",priority=50},ear1={name="Nourish. Earring +1",priority=7},ear2={name="Alabaster Earring",priority=100},
        body={name="Nyame Mail",priority=136},hands={name="Cab. Gauntlets +2",priority=74},ring1=gear.left_stinky,{priority=5},ring2=gear.right_stinky,{priority=8},
        back=gear.idle_jse_back,{priority=60},waist={name="Plat. Mog. Belt",priority=300},legs={name="Nyame Flanchard",priority=114},feet={name="Nyame Sollerets",priority=68}}

     sets.precast.JA['Chivalry'].DT=set_combine( sets.precast.JA['Chivalry'],{})

		

	sets.precast.JA['Shield Bash'] = set_combine(sets.Enmity, {hands="Cab. Gauntlets +2"})	
    sets.precast.JA['Shield Bash'].DT=set_combine(sets.precast.JA['Shield Bash'],{})


	sets.precast.JA['Palisade'] = set_combine(sets.Enmity, {})

	sets.precast.JA['Intervene'] = set_combine(sets.Enmity, {})


    -- Fast cast sets for spells
    
   sets.precast.FC ={ ammo={name="Sapience Orb",priority=3},
        head={name="Carmine Mask",priority=38},neck={name="Baetyl Pendant",priority=1},ear1={name="Tuisto Earring",priority=150},ear2={name="Loquac. Earring",priority=4},
        body={name="Rev. Surcoat +4",priority=264},hands={name="Leyline Gloves",priority=25},ring1={name="Prolix Ring",priority=2},ring2={name="Kishar Ring",priority=7},
        back=gear.fastcast_jse_back,{priority=60},waist={name="Plat. Mog. Belt",priority=250},legs={name="Prestige Brais",priority=159},feet={name="Chev. Sabatons +2",priority=42}}
    sets.precast.FC.DT=set_combine(sets.precast.FC,{})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear2="Nourish. Earring +1",priority=4})
    sets.precast.FC.Cure.DT=set_combine(sets.precast.FC,{})
  
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo={name="Coiste Bodhar",priority=3},
        head={name="Nyame Helm",priority=91},neck={name="Unmoving Collar +1",priority=200},ear1={name="Moonshade Earring",priority=4},ear2={name="Thrud Earring",priority=1},
        body={name="Nyame Mail",priority=136},hands={name="Nyame Gauntlets",priority=91},ring1={name="Cornelia's Ring",priority=6},ring2={name="Sroda Ring",priority=7},
        back=gear.wsd_jse_back,{priority=5},waist={name="Plat. Mog. Belt",priority=300},legs={name="Nyame Flanchard",priority=114},feet={name="Nyame Sollerets",priority=68}}

        sets.precast.WS.DT=set_combine(sets.precast.WS,{})

    sets.precast.WS.DD={ammo={name="Oshasha's treatise",priority=3},
        head={name="Nyame Helm",priority=91},neck={name="Rep. Plat. Medal",priority=1},ear1={name="Moonshade Earring",priority=4},ear2={name="Thrud Earring",priority=1},
        body={name="Nyame Mail",priority=136},hands={name="Nyame Gauntlets",priority=91},ring1={name="Cornelia's Ring",priority=6},ring2={name="Sroda Ring",priority=7},
        back=gear.wsd_jse_back,{priority=5},waist={name="Sailfi Belt +1",priority=8},legs={name="Nyame Flanchard",priority=114},feet={name="Nyame Sollerets",priority=68}}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat']={ammo={name="Coiste Bodhar",priority=3},
    head={name="Sakpata's Helm",priority=91},neck={name="Fotia Gorget",priority=1},ear1={name="Tuisto Earring",priority=150},ear2={name="Brutal Earring",priority=4},
    body={name="Sakpata's Plate",priority=136},hands={name="Sakpata's Gauntlets",priority=92},ring1={name="Sroda Ring",priority=5},ring2={name="Moonlight Ring",priority=110},
    back=gear.wsd_jse_back,{priority=7},waist={name="Plat. Mog. Belt",priority=250},legs={name="Sakpata's Cuisses",priority=114},feet={name="Sakpata's Leggings",priority=68}}

	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS['Requiescat'],{})

    sets.precast.WS['Atonement'] = set_combine(sets.Enmity, {ear1={name="Friomisi Earring",priority=2}})
    sets.precast.WS['Atonement'].DT=set_combine(sets.Enmity.DT,{})

    sets.precast.WS['Sanguine Blade']= {ammo={name="Pemphredo Tathlum",priority=3},
        head={name="Pixie Hairpin +1",priority=1},neck={name="Unmoving Collar +1",priority=200},ear1={name="Tuisto Earring",priority=150},ear2={name="Friomisi Earring",priority=3},
        body={name="Nyame Mail",priority=136},hands={name="Nyame Gauntlets",priority=91},ring1={name="Cornelia's Ring",priority=6},ring2={name="Moonlight Ring",priority=110},
        back=gear.wsd_jse_back,{priority=5},waist={name="Eschan Stone",priority=20},legs={name="Nyame Flanchard",priority=114},feet={name="Nyame Sollerets",priority=68}}
		
    sets.precast.WS['Aeolian Edge'] = {ammo={name="Oshasha's treatise",priority=3},
        head={name="Nyame Helm",priority=91},neck={name="Sibyl Scarf",priority=1},ear1={name="Moonshade Earring",priority=5},ear2={name="Friomisi Earring",priority=7},
        body={name="Nyame Mail",priority=136},hands={name="Nyame Gauntlets",priority=91},ring1={name="Cornelia's Ring",priority=6},ring2={name="Metamorph Ring +1",priority=8},
        back=gear.wsd_jse_back,{priority=5},waist={name="Eschan Stone",priority=4},legs={name="Nyame Flanchard",priority=114},feet={name="Nyame Sollerets",priority=68}}
	
		

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Cessance Earring",ear2="Brutal Earring",}


	--------------------------------------
	-- Midcast sets
	--------------------------------------
		
    sets.midcast.FastRecast={ammo={name="Sapience Orb",priority=3},
        head={name="Chev. Armet +2",priority=135},neck={name="Baetyl Pendant",priority=1},ear1={name="Loquac. Earring",priority=4},ear2={name="Etiolation Earring",priority=50},
        body={name="Rev. Surcoat +4",priority=264},hands={name="Sakpata's Gauntlets",priority=91},ring1={name="Murky Ring",priority=7},ring2={name="Kishar Ring",priority=2},
        back=gear.fastcast_jse_back,{priority=60},waist={name="Plat. Mog. Belt",priority=250},legs={name="Prestige Brais",priority=159},feet={name="Chev. Sabatons +2",priority=42}}
    
    sets.midcast.FastRecast.DT={ammo={name="Sapience Orb",priority=3},
        head={name="Sakpata's Helm",priority=91},neck={name="Baetyl Pendant",priority=1},ear1={name="Tuisto Earring",priority=150},ear2={name="Etiolation Earring",priority=50},
        body={name="Sakpata's Plate",priority=138},hands={name="Sakpata's Gauntlets",priority=91},ring1={name="Murky Ring",priority=7},ring2={name="Kishar Ring",priority=2},
        back=gear.fastcast_jse_back,{priority=60},waist={name="Plat. Mog. Belt",priority=250},legs={name="Prestige Brais",priority=159},feet={name="Chev. Sabatons +2",priority=42}}

    
    sets.midcast.Flash = set_combine(sets.Enmity, {body={name="Rev. Surcoat +4",priority=254},feet={name="Chev. Sabatons +2",priority=42},ear1={name="Friomisi Earring",priority=2}})
   

	sets.midcast.Flash.SIRD = set_combine(sets.midcast.Flash,{})

    sets.midcast.Flash.Meva=set_combine(sets.Enmity.Meva,{})
    sets.midcast.Flash.DT=set_combine(sets.Enmity.DT)

    sets.midcast['Divine Magic'] = set_combine(sets.Enmity.SIRD,{})

     sets.midcast['Divine Magic'].DT=set_combine(sets.Enmity.DT,{})

	sets.midcast['Blue Magic'] = set_combine(sets.Enmity.SIRD,{})

	sets.midcast['Blue Magic']['Blank Gaze'] = set_combine(sets.Enmity, {ear1={name="Friomisi Earring",priority=2}})

	sets.midcast['Blue Magic']['Jettatura'] = set_combine(sets.Enmity, {ear1={name="Friomisi Earring",priority=2}})


    sets.midcast.Cure= {ammo={name="Crepuscular Pebble",priority=1},
        head={name="Chev. Armet +2",priority=135},neck={name="Unmoving Collar +1",priority=250},ear1={name="Nourish. Earring +1",priority=4},ear2={name="Chev. Earring +1",priority=3},
        body={name="Souv. Cuirass +1",priority=171},hands={name="Sakpata's Gauntlets",priority=91},ring1=gear.left_moonbeam,{priority=100},ring2={name="Moonlight Ring",priority=110},
        back=gear.CP_jse_back,{priority=60},waist={name="Flume Belt",priority=5},legs={name="Prestige Brais",priority=159},feet={name="Odyssean Greaves",priority=20}}
		
    sets.midcast.Cure.SIRD = {ammo={name="Staunch Tathlum +1",priority=7},
        head={name="Souv. Schaller +1",priority=280},neck={name="Moonbeam necklace",priority=9},ear1={name="Nourish. Earring +1",priority=2},ear2={name="Chev. Earring +1",priority=3},
        body={name="Souveran Cuirass +1",priority=171},hands={name="Sakpata's Gauntlets",priority=91},ring1="Murky Ring",ring2={name="Moonlight Ring",priority=110},
        back=gear.CP_jse_back,{priority=60},waist={name="Plat. Mog. Belt",priority=200},legs={name="Founder's Hose",priority=54},feet={name="Odyssean Greaves",priority=20}}

   sets.HPCure={ammo={name="Staunch Tathlum +1",priority=1},
        head={name="Souv. Schaller +1",priority=280},neck={name="Unmoving Collar +1",priority=200},ear1={name="Tuisto Earring",priority=150},ear2={name="Chev. Earring +1",priority=3},
        body={name="Chev. Cuirass +2",priority=141},hands={name="Souv. Handsch. +1",priority=239},ring1={name="Murky Ring",priority=7},ring2={name="Moonlight Ring",priority=110},
        back=gear.CP_jse_back,{priority=60},waist={name="Plat. Mog. Belt",priority=250},legs={name="Founder's Hose",priority=54},feet={name="Odyssean Greaves",priority=20}}

    sets.midcast.Cure.Meva=  {ammo={name="Pemphredo Tathlum",priority=1},
        head={name="Nyame Helm",priority=91},neck={name="Unmoving Collar +1",priority=200},ear1={name="Eabani Earring",priority=45},ear2={name="Chev. Earring +1",priority=3},
        body={name="Sakpata's Plate",priority=171},hands={name="Nyame Gauntlets",priority=91},ring1=gear.left_moonbeam,{priority=100},ring2={name="Moonlight Ring",priority=110},
        back=gear.CP_jse_back,{priority=60},waist={name="Sroda Belt",priority=4},legs={name="Prestige Brais",priority=159},feet={name="Nyame Sollerets",priority=68}}

    sets.midcast.Cure.DT=set_combine(sets.midcast.Cure.Meva,{})
		
        
    sets.midcast.Reprisal = {ammo={name="Sapience Orb",priority=3},
        head={name="Chev. Armet +2",priority=135},neck={name="Loricate Torque +1",priority=1},ear1={name="Etiolation Earring",priority=50},ear2={name="Alabaster Earring",priority=100},
        body={name="Shabti Cuirass",priority=102},hands={name="Sakpata's Gauntlets",priority=91},ring1={name="Murky Ring",priority=3},ring2={name="Kishar Ring",priority=6},
        back=gear.fastcast_jse_back,{priority=60},waist={name="Plat. Mog. Belt",priority=250},legs={name="Prestige Brais",priority=159},feet={name="Chev. Sabatons +2",priority=42}}

        sets.midcast.Reprisal.DT= {ammo={name="Sapience Orb",priority=3},
        head={name="Chev. Armet +2",priority=135},neck={name="Loricate Torque +1",priority=1},ear1={name="Etiolation Earring",priority=50},ear2={name="Alabaster Earring",priority=100},
        body={name="Sakpata's Plate",priority=171},hands={name="Sakpata's Gauntlets",priority=91},ring1={name="Murky Ring",priority=3},ring2={name="Kishar Ring",priority=6},
        back=gear.fastcast_jse_back,{priority=60},waist={name="Plat. Mog. Belt",priority=250},legs={name="Prestige Brais",priority=159},feet={name="Chev. Sabatons +2",priority=42}}


    

    sets.midcast['Enhancing Magic'] = {ammo={name="Pemphredo Tathlum",priority=3},
        head={name="Chev. Armet +2",priority=135},neck={name="Loricate Torque +1",priority=1},ear1={name="Loquac. Earring",priority=4},ear2={name="Chev. Earring +1",priority=6},
        body={name="Shabti Cuirass",priority=102},hands={name="Sakpata's Gauntlets",priority=91},ring1={name="Murky Ring",priority=7},ring2={name="Moonlight Ring",priority=110},
        back=gear.fastcast_jse_back,{priority=60},waist={name="Plat. Mog. Belt",priority=250},legs={name="Prestige Brais",priority=159},feet={name="Sakpata's Leggings",priority=68}}

    sets.midcast['Enhancing Magic'].DT= {ammo={name="Crepuscular Pebble",priority=3},
        head={name="Chev. Armet +2",priority=135},neck={name="Loricate Torque +1",priority=1},ear1={name="Loquac. Earring",priority=4},ear2={name="Chev. Earring +1",priority=6},
        body={name="Sakpata's Plate",priority=171},hands={name="Sakpata's Gauntlets",priority=91},ring1={name="Murky Ring",priority=7},ring2={name="Moonlight Ring",priority=110},
        back=gear.fastcast_jse_back,{priority=60},waist={name="Plat. Mog. Belt",priority=250},legs={name="Prestige Brais",priority=159},feet={name="Sakpata's Leggings",priority=68}}



     sets.midcast['Enhancing Magic']['Blaze Spikes'] = {ammo={name="Pemphredo Tathlum",priority=3},
        head={name="Nyame Helm",priority=91},neck={name="Sibyl Scarf",priority=1},ear1={name="Tuisto Earring",priority=150},ear2={name="Alabaster Earring",priority=100},
        body={name="Nyame Mail",priority=136},hands={name="Nyame Gauntlets",priority=91},ring1={name="Metamor. Ring +1",priority=7},ring2={name="Moonlight Ring",priority=110},
        back=gear.fastcast_jse_back,{priority=60},waist={name="Plat. Mog. Belt",priority=250},legs={name="Nyame Flanchard",priority=114},feet={name="Nyame Sollerets",priority=68}} 

      sets.midcast['Enhancing Magic'].SIRD={ammo={name="Staunch Tathlum +1",priority=1},
        head={name="Souv. Schaller +1",priority=280},neck={name="Unmoving Collar +1",priority=200},ear1={name="Knightly Earring",priority=5},ear2={name="Alabaster Earring",priority=100},
        body={name="Chev. Cuirass +2",priority=141},hands={name="Sakpata's Gauntlets",priority=91},ring1={name="Murky Ring",priority=9},ring2={name="Defending Ring",priority=6},
        back=gear.fastcast_jse_back,{priority=60},waist={name="Audumbla Sash",priority=2},legs={name="Founder's Hose",priority=54},feet={name="Sakpata's Leggings",priority=68}}




    sets.midcast['Blue Magic']['Cocoon']=set_combine(sets.midcast['Enhancing Magic'].SIRD,{})

	sets.midcast.Protect=set_combine(sets.midcast['Enhancing Magic'], {sub="Duban",ring1="Sheltered Ring",priority=5})
    sets.midcast.Protect.DT=set_combine(sets.midcast.Protect,{})

    sets.midcast.Protect.SIRD=set_combine(sets.midcast['Enhancing Magic'].SIRD,{})

    sets.midcast.Shell=set_combine(sets.midcast['Enhancing Magic'], {ring1="Sheltered Ring",priority=5})
    
    sets.midcast.Shell.SIRD=set_combine(sets.midcast['Enhancing Magic'].SIRD,{})

	sets.midcast['Enlight'] = {ammo={name="Crepuscular Pebble",priority=3},
        head={name="Jumalik Helm",priority=45},neck={name="Loricate Torque +1",priority=1},ear1={name="Tuisto Earring",priority=150},ear2={name="Chev. Earring +1",priority=4},
        body={name="Rev. Surcoat +4",priority=264},hands={name="Eschite Gauntlets",priority=29},ring1=gear.left_stinky,{priority=6},ring2=gear.right_stinky,{priority=5},
        back=gear.enmity_jse_back,{priority=60},waist={name="Plat. Mog. Belt",priority=250},legs={name="Prestige Brais",priority=159},feet={name="Sakpata's Leggings",priority=68}}	

    sets.midcast['Enlight'].SIRD={ammo={name="Staunch Tathlum +1",priority=1},
        head={name="Souv. Schaller +1",priority=280},neck={name="Moonbeam Necklace",priority=3},ear1={name="Tuisto Earring",priority=150},ear2={name="Knightly Earring",priority=7},
        body={name="Rev. Surcoat +4",priority=264},hands={name="Eschite Gauntlets",priority=29},ring1={name="Murky Ring",priority=9},ring2={name="Moonlight Ring",priority=110},
        back=gear.enmity_jse_back,{priority=60},waist={name="Audumbla Sash",priority=9},legs={name="Prestige Brais",priority=159},feet={name="Odyssean Greaves",priority=20}}

    sets.midcast['Enlight II']=set_combine(sets.midcast['Enlight'],{})

    sets.midcast['Enlight II'].DT=set_combine(sets.midcast['Enlight II'],{})

    sets.midcast['Enlight II'].SIRD=set_combine(sets.midcast['Enlight'].SIRD,{})
	
	sets.midcast.Phalanx = {main={name="Sakpata's Sword",priority=100},sub={name="Priwen",priority=80},ammo={name="Crepuscular Pebble",priority=3},
        head={name="Odyssean Helm",priority=112},neck={name="Melic Torque",priority=1},ear1={name="Mimir Earring",priority=12},ear2={name="Alabaster Earring",priority=100},
        body={name="Yorium Cuirass",priority=113},hands={name="Souv. Handsch. +1",priority=239},ring1={name="Murky Ring",priority=7},ring2=gear.right_stinky,{priority=8},
        back={name="Weard Mantle",{priority=39}},waist={name="Flume Belt",priority=5},legs={name="Sakpata's Cuisses",priority=114},feet={name="Souveran Schuhs +1",priority=227}}

    sets.midcast.Phalanx.DT=set_combine(sets.midcast.Phalanx,{})
	
	sets.midcast.Phalanx.SIRD = {ammo={name="Staunch Tathlum +1",priority=3},
        head={name="Souv. Schaller +1",priority=280},neck={name="Loricate Torque +1",priority=1},ear1={name="Knightly Earring",priority=2},ear2={name="Alabaster Earring",priority=100},
        body={name="Yorium Cuirass",priority=113},hands={name="Souv. Handsch. +1",priority=239},ring1={name="Murky Ring",priority=7},ring2={name="Defending Ring",priority=5},
        back={name="Weard Mantle",{priority=39}},waist={name="Audumbla Sash",priority=8},legs={name="Founder's Hose",priority=54},feet={name="Souveran Schuhs +1",priority=227}}	
		
	sets.midcast.HolyII = {ammo={name="Pemphredo Tathlum",priority=3},
        head={name="Nyame Helm",priority=91},neck={name="Baetyl Pendant",priority=1},ear1={name="Tuisto Earring",priority=150},ear2={name="Friomisi Earring",priority=2},
        body={name="Nyame Mail",priority=136},hands={name="Nyame Gauntlets",priority=91},ring1={name="Metamorph Ring +1",priority=6},ring2={name="Moonlight Ring",priority=110},
        back=gear.fastcast_jse_back,{priority=60},waist={name="Plat. Mog. Belt",priority=300},legs={name="Nyame Flanchard",priority=114},feet={name="Nyame Sollerets",priority=68}}

		
	sets.midcast.Holy=set_combine(sets.midcast.HolyII,{})

    sets.midcast.CureNuke=set_combine(sets.midcast.Holy,{})

    sets.midcast.Raise=set_combine(sets.midcast['Enhancing Magic'].SIRD,{})

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

     sets.resting = {main={name="Malignance Sword",priority=9},sub={name="Archduke's Shield",priority=9},ammo={name="Homiliary",priority=3},
        head={name="Null Masque",priority=100},neck={name="Unmoving Collar +1",priority=200},ear1={name="Tuisto Earring",priority=150},ear2={name="Alabaster Earring",priority=100},
        body={name="Rev. Surcoat +4",priority=264},hands={name="Sakpata's Gauntlets",priority=91},ring1={name="Chirich Ring +1",priority=5},ring2={name="Chirich Ring",priority=6},
        back=gear.idle_jse_back,{priority=60},waist={name="Fucho-no-obi",priority=7},legs={name="Chev. Cuisses +2",priority=117},feet={name="Sakpata's Leggings",priority=68}}

    -- Idle sets
    sets.idle = {ammo={name="Staunch Tathlum +1",priority=3},
    head={name="Sakpata's Helm",priority=91},neck={name="Unmoving Collar +1",priority=200},ear1={name="Tuisto Earring",priority=150},ear2={name="Chev. Earring +1",priority=6},
    body={name="Sakpata's Plate",priority=136},hands={name="Sakpata's Gauntlets",priority=91},ring1={name="Fortified Ring",priority=3},ring2={name="Shneddick Ring",priority=4},
    back=gear.idle_jse_back,{priority=60},waist={name="Carrier's Sash",priority=20},legs={name="Prestige Brais",priority=159},feet={name="Sakpata's Leggings",priority=68}}

    sets.idle.Magic={ammo={name="Staunch Tathlum +1",priority=3},
    head={name="Sakpata's Helm",priority=91},neck={name="Warder's Charm +1",priority=1},ear1={name="Tuisto Earring",priority=150},ear2={name="Night Earring",priority=4},
    body={name="Sakpata's Plate",priority=136},hands={name="Sakpata's Gauntlets",priority=91},ring1={name="Murky Ring",priority=6},ring2={name="Shadow Ring",priority=7},
    back=gear.idle_jse_back,{priority=60},waist={name="Plat. Mog. Belt",priority=250},legs={name="Sakpata's Cuisses",priority=114},feet={name="Sakpata's Leggings",priority=68}}

    sets.idle.Segs= {ammo={name="Eluder's Sachet",priority=3},
    head={name="Sakpata's Helm",priority=91},neck={name="Unmoving Collar +1",priority=200},ear1={name="Tuisto Earring",priority=150},ear2={name="Chev. Earring +1",priority=6},
    body={name="Sakpata's Plate",priority=136},hands={name="Sakpata's Gauntlets",priority=91},ring1={name="Fortified Ring",priority=4},ring2={name="Shneddick Ring",priority=1},
    back=gear.idle_jse_back,{priority=60},waist={name="Carrier's Sash",priority=20},legs={name="Prestige Brais",priority=159},feet={name="Sakpata's Leggings",priority=68}}

    sets.idle.ConvertMP= {ammo={name="Homiliary",priority=3},
    head={name="Chev. Armet +2",priority=135},neck={name="Unmoving Collar +1",priority=200},ear1={name="Tuisto Earring",priority=150},ear2={name="Chev. Earring +1",priority=6},
    body={name="Sakpata's Plate",priority=136},hands={name="Sakpata's Gauntlets",priority=91},ring1={name="Fortified Ring",priority=4},ring2={name="Shneddick Ring",priority=1},
    back=gear.idle_jse_back,{priority=60},waist={name="Flume Belt",priority=2},legs={name="Prestige Brais",priority=159},feet={name="Sakpata's Leggings",priority=68}}

    sets.idle.Cleave = {ammo={name="Staunch Tathlum +1",priority=3},
    head={name="Chev. Armet +2",priority=135},neck={name="Elite Royal Collar",priority=1},ear1={name="Eabani Earring",priority=45},ear2={name="Chev. Earring +1",priority=6},
    body={name="Sakpata's Plate",priority=136},hands={name="Sakpata's Gauntlets",priority=91},ring1={name="Fortified Ring",priority=3},ring2={name="Shneddick Ring",priority=4},
    back=gear.idle_jse_back,{priority=60},waist={name="Flume Belt",priority=5},legs={name="Prestige Brais",priority=159},feet={name="Sakpata's Leggings",priority=68}}

    sets.idle.Int= {ammo={name="Sapience Orb",priority=3}, --This is for horseshit like kalunga because apparently Dint plays a role in resisting fetters
    head={name="Nyame Helm",priority=91},neck={name="Warder's Charm +1",priority=1},ear1={name="Tuisto Earring",priority=150},ear2={name="Eabani Earring",priority=45},
    body={name="Nyame Mail",priority=136},hands={name="Nyame Gauntlets",priority=91},ring1={name="Murky Ring",priority=3},ring2={name="Shadow Ring",priority=30},
    back=gear.idle_jse_back,{priority=60},waist={name="Plat. Mog. Belt",priority=250},legs={name="Nyame Flanchard",priority=114},feet={name="Nyame Sollerets",priority=68}}

   sets.idle.Evasion={ammo={name="Amar Cluster",priority=3}, --This is for limbus nms 
    head={name="Null Masque",priority=100},neck={name="Unmoving Collar +1",priority=200},ear1={name="Tuisto Earring",priority=150},ear2={name="Eabani Earring",priority=45},
    body={name="Nyame Mail",priority=136},hands={name="Nyame Gauntlets",priority=91},ring1={name="Murky Ring",priority=3},ring2={name="Shadow Ring",priority=30},
    back={name="Null Shawl",priority=5},waist={name="Null Belt",priority=2},legs={name="Nyame Flanchard",priority=114},feet={name="Nyame Sollerets",priority=68}}

    sets.idle.Reraise={ammo={name="Staunch Tathlum +1",priority=3},
    head={name="Crepuscular Helm",priority=114},neck={name="Unmoving Collar +1",priority=200},ear1={name="Alabaster Earring",priority=100},ear2={name="Chev. Earring +1",priority=6},
    body={name="Twilight Mail",priority=1},hands={name="Sakpata's Gauntlets",priority=91},ring1={name="Murky Ring",priority=3},ring2={name="Shneddick Ring",priority=4},
    back=gear.idle_jse_back,{priority=60},waist={name="Plat. Mog. Belt",priority=250},legs={name="Prestige Brais",priority=159},feet={name="Sakpata's Leggings",priority=68}}







	--------------------------------------
    -- Defense sets
    --------------------------------------
    
    -- Extra defense sets.  Apply these on top of melee or defense sets.
 
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {head=gear.valorousTH})

    sets.defense.PDT=set_combine(sets.idle,{})
    sets.defense.MDT=set_combine(sets.idle.Magic,{})
    sets.defense.Resist=set_combine(sets.idle.Int,{})
    
	-- Weapons sets
    sets.weapons.SakpataDuban = {main="Sakpata's Sword",sub="Duban"} --normal tank shit
    sets.weapons.Cleave = {main="Malevolence",sub="Duban"} --rdm AE cleaving
--	sets.weapons.ClubDuban = {main="Mafic Cudgel",sub="Duban"} --club tanking --mafic is on my mule as i never use this shit    
    sets.weapons.SakpataAegis ={main="Sakpata's Sword",sub="Aegis"} --normal aeigs shit
	sets.weapons.NaeglingBlurred = {main="Naegling",sub="Blurred Shield +1"} --unga bunga
    sets.weapons.SakpataPriwen = {main="Sakpata's Sword",sub="Priwen"} 
    sets.weapons.MaligAegis ={main="Malignance Sword",sub="Aegis"} 
    sets.weapons.NaeglingAspis ={main="Naegling",sub="Diamond Aspis"} --Mostly for 6 step objectives still need prob sam's roll and capped magic haste
	sets.weapons.MaligPriwen={main="Malignance Sword",sub="Priwen"} --Resist and pretty much nothing else
    sets.weapons.FishFly={main="Malevolence",sub="Aegis"} --Literally only for cleaving vermillion fishfly
	--------------------------------------
	-- Engaged sets
	--------------------------------------
    
	 sets.engaged = {ammo={name="Coiste Bodhar",priority=3},
        head={name="Sakpata's Helm",priority=91},neck={name="Unmoving Collar +1",priority=200},ear1={name="Cessance Earring",priority=5},ear2={name="Brutal Earring",priority=6},
        body={name="Sakpata's Plate",priority=136},hands={name="Sakpata's Gauntlets",priority=91},ring1=gear.left_moonbeam,{priority=99},ring2={name="Moonlight Ring",priority=110},
        back={name="Null Shawl",priority=7},waist={name="Sailfi Belt +1",priority=7},legs={name="Sakpata's Cuisses",priority=114},feet={name="Sakpata's Leggings",priority=68}}



    sets.engaged.Cleave=set_combine(sets.idle.Cleave,{})



   


	--------------------------------------
	-- Custom buff sets
	--------------------------------------
   -- sets.buff.Cover = {body="Cab. Surcoat +1"}
      sets.buff.Sleep= {neck="Vim Torque +1"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
   
    if player.sub_job == 'BLU' then
        set_macro_page(1, 5)
    elseif player.sub_job == 'RDM' then
        set_macro_page(3, 5)
    elseif player.sub_job =='SCH' then
        set_macro_page(5, 5)
    else
        set_macro_page(1,5)
    end
end


function select_blu_spells() 
    if player.sub_job =='BLU' then
    send_command('azuresets spellset pldsub') else
    end
end
function user_job_lockstyle()
	windower.chat.input('/lockstyleset 005')
end
