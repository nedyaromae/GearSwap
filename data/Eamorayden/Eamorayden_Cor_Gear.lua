-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal','Acc')
    state.RangedMode:options('Acc','Normal')
    state.WeaponskillMode:options('Match','Normal', 'Acc','PDL')
    state.IdleMode:options('Normal')
	state.HybridMode:options('Normal','DT','Kalunga')
	state.Weapons:options('DualSavage','DualShooting','DualAeolian','DualEvis')
        state.WeaponSets:options('Default','Dual')
        weapon_sets = {
		['Default'] = {'Savage','Shooting','MeleeLS','Evis',},
		['Dual'] = {'DualSavage','DualHotShot','DualAeolian','W3HotShot','PP','DualShooting'}}
	    default_weapons = 'Savage'
	    default_dual_weapons = 'DualSavage'
	state.CompensatorMode:options('Always','300','1000','Never')

    gear.RAbullet = "Chrono Bullet"
    gear.WSbullet = "Chrono Bullet"
    gear.MAbullet = "Orichalc. Bullet" --For MAB WS, do not put single-use bullets here.
    gear.QDbullet = "Hauksbok Bullet"
    options.ammo_warning_limit = 15
    ammostock=200
    Ikenga_vest_bonus = 130  -- It is 190 at R20. Uncomment if you need to manually adjust because you are using below R20

	gear.tp_ranger_jse_back = { name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	gear.snapshot_jse_back = {name="Camulus's Mantle",augments={'"Snapshot"+10',}}
	gear.magic_wsd_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}}
	gear.str_wsd_jse_back = {name="Camulus's Mantle",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}}
    gear.tp_jse_back=   {name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
    gear.agi_wsd_jse_back= {name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}}
    gear.macc_fc_jse_back= {name="Camulus's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}}
    gear.LanunPathA={name="Lanun Knife", augments={'Path: A',}}
    gear.RostamPathB={name="Rostam", augments={'Path: B',}}
    gear.RostamPathC={name="Rostam", augments={'Path: C',}}

    -- Additional local binds

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Precast sets to enhance JAs

	sets.precast.JA['Triple Shot'] = {body="Chasseur's Frac +1"}
    sets.precast.JA['Snake Eye'] = {legs="Lanun Trews +3"}
    sets.precast.FoldDoubleBust = {hands="Lanun Gants +4"}

    sets.precast.JA['Wild Card'] = {head="Null Masque",neck="Loricate Torque +1",ear1="Ran Earring",ear2="Chas. Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Murky Ring",
        back="Null Shawl",waist="Null Belt",legs="Nyame Flanchard",feet="Lanun Bottes +4"}

    sets.precast.JA['Random Deal'] = {head="Null Masque",neck="Loricate Torque +1",ear1="Ran Earring",ear2="Chas. Earring",
        body="Lanun Frac +4",hands="Malignance Gloves",ring1="Defending Ring",ring2="Murky Ring",
        back="Null Shawl",waist="Null Belt",legs="Nyame Flanchard",feet="Malignance Boots"}

    sets.precast.CorsairRoll = {main=gear.RostamPathC,range="Compensator",
        head="Lanun Tricorne +4",neck="Loricate Torque +1",ear1="Alabaster Earring",ear2="Chas. Earring",
        body="Malignance Tabard",hands="Chasseur's Gants +2",ring1="Defending Ring",ring2="Murky Ring",
        back=gear.tp_jse_back,waist="Flume Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.precast.LuzafRing = {ring1="Luzaf's Ring"}
    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Chas. Culottes +1"})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chass. Bottes +1"})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chass. Tricorne +1"})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac +1"})
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants +2"})
    sets.precast.CorsairRoll["Bolter's Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Malignance Gloves",back="Null Shawl",head="Null Masque"})
    
    sets.precast.CorsairShot = {ammo=gear.QDbullet,
        head="Malignance Chapeau",neck="Combatant's Torque",ear1="Dedition Earring",ear2="Crep. Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Crepuscular Ring",ring2="Chirich Ring +1",
        back=gear.tp_ranger_jse_back,waist="Yemaya Belt",legs="Malignance Tights",feet="Chass. Bottes +1"}
		
    sets.precast.CorsairShot['Light Shot']={ammo="Animikii Bullet",
        head="Laksa. Tricorne +4",neck="Null Loop",ear1="Crep. Earring",ear2="Chas. Earring",
        body="Laksa. Frac +4",hands="Laksamana's gants +4",ring1="Metamor. Ring +1",ring2="Murky Ring",
        back="Null Shawl",waist="Null Belt",legs="Laksa. Trews +4",feet="Laksamana bottes +4"}

    sets.precast.CorsairShot['Dark Shot'] = set_combine(sets.precast.CorsairShot['Light Shot'])

    -- Fast cast sets for spells
    
    sets.precast.FC = {
        head="Carmine Mask +1",neck="Baetyl Pendant",ear1="Etiolation Earring",ear2="Loquac. Earring",
        body=gear.TaeonFCBody,hands="Leyline Gloves",ring1="Kishar Ring",ring2="Prolix Ring",
        back=gear.macc_fc_jse_back,waist="Null Belt",legs=gear.FCHercPants,feet="Carmine Greaves +1"}

    sets.precast.RA = {ammo=gear.RAbullet,  
        head="Chass. Tricorne +1",neck="Comm. Charm +2",ear1="",ear2="",
        body="Oshosi Vest",hands="Carmine Fin. Ga. +1",ring1="Crepuscular Ring",ring2="",
        back=gear.snapshot_jse_back,waist="Impulse Belt",legs="Adhemar Kecks +1",feet="Meg. Jam. +2"}
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {body="Laksa. Frac +4",waist="Yemaya Belt"})
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {body="Laksa. Frac +4",waist="Yemaya Belt",feet="Pursuer's Gaiters"})
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo=gear.WSbullet,
        head="Nyame Helm",neck="Rep. Plat. Medal",ear1="Moonshade Earring",ear2="Ishvara Earring",
        body="Nyame Mail",hands="Meg. Gloves +2",ring1="Epaminondas's Ring",ring2="Cornelia's Ring",
        back=gear.str_wsd_jse_back,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}
				
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS,{})

	sets.precast.WS['Evisceration'] = {ammo=gear.WSbullet,
        head="Mummu Bonnet +2",neck="Fotia Gorget",ear1="Odr Earring",ear2="Moonshade Earring",
        body="Meg. Cuirie +2",hands="Mummu Wrists +2",ring1="Epona's Ring",ring2="Mummu Ring",
        back=gear.tp_jse_back,waist="Fotia Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}
		
	sets.precast.WS['Savage Blade'] = {ammo=gear.WSbullet,
        head="Nyame Helm",neck="Rep. Plat. Medal",ear1="Moonshade Earring",ear2="Ishvara Earring",
        body="Nyame Mail",hands="Meg. Gloves +2",ring1="Epaminondas's Ring",ring2="Cornelia's Ring",
        back=gear.str_wsd_jse_back,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.precast.WS['Savage Blade'].PDL = {ammo=gear.WSbullet,
        head="Nyame Helm",neck="Comm. Charm +2",ear1="Moonshade Earring",ear2="Ishvara Earring",
        body="Nyame Mail",hands="Chasseur's Gants +2",ring1="Sroda Ring",ring2="Cornelia's Ring",
        back=gear.str_wsd_jse_back,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Lanun Bottes +4"}

    sets.precast.WS['Last Stand'] = {ammo=gear.WSbullet,
        head="Lanun Tricorne +4",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Ishvara Earring",
        body="Laksa. Frac +4",hands="Chasseur's Gants +2",ring1="Dingir Ring",ring2="Cornelia's Ring",
        back=gear.agi_wsd_jse_back,waist="Fotia Belt",legs="Nyame Flanchard",feet="Lanun Bottes +4"}

    sets.precast.WS['Last Stand'].PDL = {ammo=gear.WSbullet,
        head="Ikenga's Hat",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Ishvara Earring",
        body="Ikenga's Vest",hands="Chasseur's Gants +2",ring1="Sroda Ring",ring2="Cornelia's Ring",
        back=gear.agi_wsd_jse_back,waist="Fotia Belt",legs="Ikenga's Trousers",feet="Lanun Bottes +4"}

    sets.precast.WS['Last Stand'].Acc ={ammo=gear.RAbullet,
        head="Laksa. Tricorne +4",neck="Null Loop",ear1="Beyla Earring",ear2="Crep. Earring",
        body="Laksa. Frac +4",hands="Laksamana's gants +4",ring1="Crepuscular Ring",ring2="Murky Ring",
        back="Null Shawl",waist="Null Belt",legs="Laksa. Trews +4",feet="Laksa. Bottes +4"}
		
    sets.precast.WS['Detonator'] =sets.precast.WS['Last Stand']
    sets.precast.WS['Detonator'].PDL =sets.precast.WS['Last Stand'].PDL
    sets.precast.WS['Detonator'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Slug Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Slug Shot'].PDL = sets.precast.WS['Last Stand'].PDL
    sets.precast.WS['Slug Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Numbing Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Numbing Shot'].PDL = sets.precast.WS['Last Stand'].PDL
    sets.precast.WS['Numbing Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Sniper Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Sniper Shot'].PDL = sets.precast.WS['Last Stand'].PDL
    sets.precast.WS['Sniper Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Split Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Split Shot'].PDL = sets.precast.WS['Last Stand'].PDL
    sets.precast.WS['Split Shot'].Acc = sets.precast.WS['Last Stand'].Acc
	
    sets.precast.WS['Leaden Salute'] = {ammo=gear.MAbullet,
        head="Pixie Hairpin +1",neck="Comm. Charm +2",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Lanun Frac +4",hands="Nyame Gauntlets",ring1="Cornelia's Ring",ring2="Dingir Ring",
        back=gear.magic_wsd_jse_back,waist="Eschan Stone",legs="Nyame Flanchard",feet="Lanun Bottes +4"}
		
    sets.precast.WS['Aeolian Edge'] = {ammo="Hauksbok Bullet",
        head="Nyame Helm",neck="Sibyl Scarf",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Lanun Frac +4",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",ring2="Cornelia's Ring",
        back=gear.magic_wsd_jse_back,waist="Eschan Stone",legs="Nyame Flanchard",feet="Lanun Bottes +4"}

    sets.precast.WS['Wildfire']  = {ammo=gear.MAbullet,
        head="Nyame Helm",neck="Comm. Charm +2",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Lanun Frac +4",hands="Nyame Gauntlets",ring1="Cornelia's Ring",ring2="Dingir Ring",
        back=gear.magic_wsd_jse_back,waist="Eschan Stone",legs="Nyame Flanchard",feet="Lanun Bottes +4"}
		
    sets.precast.WS['Hot Shot'] =set_combine(sets.precast.WS['Wildfire'],{body="Nyame Mail",neck="Fotia Gorget",back=gear.agi_wsd_jse_back,ammo=gear.WSbullet,waist="Fotia Belt"})
    sets.precast.WS['Hot Shot'].PDL=set_combine(sets.precast.WS['Hot Shot'],{})
    sets.precast.WS['Hot Shot'].Acc=set_combine(sets.precast.WS['Hot Shot'],{feet="Nyame Sollerets",neck="Comm. Charm +2"})

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {body="Laksa. Frac +4"}
	sets.AccMaxTP = {}
        
    -- Midcast Sets
    sets.midcast.FastRecast = {
        head="Carmine Mask +1",neck="Baetyl Pendant",ear1="Alabaster Earring",ear2="Loquac. Earring",
        body=gear.TaeonFCBody,hands="Leyline Gloves",ring1="Kishar Ring",ring2="Murky Ring",
        back=gear.macc_fc_jse_back,waist="Flume Belt +1",legs="Nyame Flanchard",feet="Carmine Greaves +1"}
        
    -- Specific spells

    sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast,{})

    sets.midcast['Absorb-TP']= {ammo="Animikii Bullet",
        head="Carmine Mask +1",neck="Null Loop",ear1="Crep. Earring",ear2="Chas. Earring",
        body="Laksa. Frac +4",hands="Laksamana's gants +4",ring1="Kishar Ring",ring2="Metamor. Ring +1",
        back=gear.macc_fc_jse_back,waist="Null Belt",legs="Laksa. Trews +4",feet="Laksamana bottes +4"}
    -- Ranged gear
    sets.midcast.RA = {ammo=gear.RAbullet,
        head="Ikenga's Hat",neck="Combatant's Torque",ear1="Dedition Earring",ear2="Crep. Earring",
        body="Ikenga's Vest",hands="Malignance Gloves",ring1="Crepuscular Ring",ring2="Chirich Ring +1",
        back=gear.tp_ranger_jse_back,waist="Yemaya Belt",legs="Ikenga's Trousers",feet="Malignance Boots"}

    sets.midcast.RA.Acc = {ammo=gear.RAbullet,
        head="Laksa. Tricorne +4",neck="Null Loop",ear1="Beyla Earring",ear2="Crep. Earring",
        body="Laksa. Frac +4",hands="Laksamana's gants +4",ring1="Crepuscular Ring",ring2="Murky Ring",
        back="Null Shawl",waist="Null Belt",legs="Laksa. Trews +4",feet="Laksa. Bottes +4"}
		
	sets.buff['Triple Shot'] = {head="Oshosi Mask",body="Chasseur's Frac +1",hands="Lanun Gants +4",legs="Oshosi Trousers",feet="Oshosi Leggings"}
    
    -- Sets to return to when not performing an action.
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
    
    -- Resting sets
	sets.BulletPouch = {waist="Chr. Bul. Pouch"}

    -- Idle sets
    sets.idle = {ammo=gear.RAbullet,
        head="Null Masque",neck="Elite Royal Collar",ear1="Infused Earring",ear2="Eabani Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Shneddick Ring",ring2="Murky Ring",
        back="Null Shawl",waist="Null Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
    
    -- Defense sets
    sets.defense.PDT = {ammo=gear.RAbullet,
        head="Null Masque",neck="Warder's Charm +1",ear1="Night Earring",ear2="Eabani Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Shadow Ring",ring2="Murky Ring",
        back="Shadow Mantle",waist="Null Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.TreasureHunter = {head="Volte Cap",waist="Chaac Belt",hands="Volte Bracers"}
    sets.Phalanx_Received={head="Taeon Chapeau",body=gear.TaeonPhalanxBody,hands="Taeon Gloves",legs="Taeon Tights",feet="Taeon Boots"}

	-- Weapons sets
	sets.weapons.DualShooting = {main=gear.LanunPathA,sub="Kustawi +1",range="Fomalhaut"}
	sets.weapons.DualSavage = {main="Naegling",sub="Gleti's Knife",range="Anarchy +2"}
	sets.weapons.DualEvis = {main="Tauret",sub="Gleti's Knife",range="Anarchy +2"}
	sets.weapons.DualAeolian = {main=gear.RostamPathB,sub="Tauret",range="Anarchy +2"}
	sets.weapons.DualMageSortie={main=gear.RostamPathC,sub="Kustawi +1",range="Fomalhaut"}
    sets.weapons.DualHotShot={main=gear.RostamPathB,sub="Gleti's Knife",range="Fomalhaut"}
    sets.weapons.PP={main=gear.RostamPathB,sub="Gleti's Knife",range="Anarchy +2"}
    sets.weapons.W3HotShot={main=gear.RostamPathB,sub="Kustawi +1",range="Fomalhaut"}
    sets.weapons.Savage = {main="Naegling",sub="Nusku Shield",range="Anarchy +2"}
    sets.weapons.Shooting ={main=gear.LanunPathA,sub="Nusku Shield",range="Fomalhaut"}
    sets.weapons.Evis={main="Tauret",sub="Nusku Shield",range="Anarchy +2"}
    sets.weapons.MeleeLS={main=gear.RostamPathB,sub="Nusku Shield",range="Fomalhaut"}
   
    
    
    -- Engaged sets
    
    sets.engaged = {
	    head="Malignance Chapeau",neck="Lissome Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Petrov Ring",
		back=gear.tp_jse_back,waist="Sailfi Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

    sets.engaged.DT={
	    head="Malignance Chapeau",neck="Lissome Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Murky Ring",
		back=gear.tp_jse_back,waist="Sailfi Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

    sets.engaged.Acc = {
		head="Malignance Chapeau",neck="Null Loop",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Murky Ring",
		back="Null Shawl",waist="Sailfi Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

    sets.engaged.Kalunga={
	    head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Murky Ring",
		back="Null Shawl",waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.engaged.DW = {
		head="Malignance Chapeau",neck="Lissome Necklace",ear1="Brutal Earring",ear2="Eabani Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Petrov Ring",
		back=gear.tp_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}

    sets.engaged.DW.DT = {
		head="Malignance Chapeau",neck="Lissome Necklace",ear1="Brutal Earring",ear2="Eabani Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Murky Ring",
		back=gear.tp_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"} 
    
    sets.engaged.DW.Acc = {
		head="Malignance Chapeau",neck="Null Loop",ear1="Cessance Earring",ear2="Eabani Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Murky Ring",
		back="Null Shawl",waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
    sets.engaged.Savage=set_combine(sets.engaged,{})
    sets.engaged.Savage.Acc=set_combine(sets.engaged.Acc,{back=gear.tp_jse_back})
    sets.engaged.Savage.DT=set_combine(sets.engaged.DT,{})
    sets.engaged.DualSavage=set_combine(sets.engaged.DW,{})
    sets.engaged.DualSavage.Acc=set_combine(sets.engaged.DW.Acc,{back=gear.tp_jse_back})
    sets.engaged.DualSavage.DT=set_combine(sets.engaged.DW.DT,{})
    sets.engaged.DualEvis=set_combine(sets.engaged.DW,{})
    sets.engaged.DualEvis.Acc=set_combine(sets.engaged.DW.Acc,{back=gear.tp_jse_back})
    sets.engaged.DualEvis.DT=set_combine(sets.engaged.DW.DT,{}) 




end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    if player.sub_job == 'NIN' then
        set_macro_page(1, 6)
    elseif player.sub_job == 'DRK' then
		set_macro_page(4, 6)
    else
        set_macro_page(1, 6)
    end
end

function user_job_lockstyle()

	windower.chat.input('/lockstyleset 009')
end
