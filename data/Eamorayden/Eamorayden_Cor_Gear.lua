-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal','Acc')
    state.RangedMode:options('Acc','Normal')
    state.WeaponskillMode:options('Match','Normal', 'Acc','PDL')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal')
	state.HybridMode:options('Normal','DT')
	state.Weapons:options('DualSavage','DualShooting','DualAeolian','DualEvis')
        state.WeaponSets:options('Default','Dual')
        weapon_sets = {
		['Default'] = {'Savage','Evis','Shooting','WF'},
		['Dual'] = {'DualSavage','DualAeolian','DualShooting','DualEvis','DualWF','DualMeleeLS'}}
	    default_weapons = 'Savage'
	    default_dual_weapons = 'DualSavage'
	state.CompensatorMode:options('Always','300','1000','Never')

    gear.RAbullet = "Chrono Bullet"
    gear.WSbullet = "Chrono Bullet"
    gear.MAbullet = "Orichalc. Bullet" --For MAB WS, do not put single-use bullets here.
    gear.QDbullet = "Hauksbok Bullet"
    options.ammo_warning_limit = 15
    ammostock=200
    --Ikenga_vest_bonus = 190  -- It is 190 at R20. Uncomment if you need to manually adjust because you are using below R20

	gear.tp_ranger_jse_back = { name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10',}}
	gear.snapshot_jse_back = {name="Camulus's Mantle",augments={'"Snapshot"+10',}}
	gear.magic_wsd_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}}
	gear.str_wsd_jse_back = {name="Camulus's Mantle",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}}
    gear.dw_jse_back=   {name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}}
    gear.agi_wsd_jse_back= {name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+4','Weapon skill damage +10%',}}
    gear.lanunpathC={name="Lanun Knife", augments={'Path: C',}}
    gear.lanunpathA={name="Lanun Knife", augments={'Path: A',}}

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
    sets.precast.JA['Snake Eye'] = {legs="Lanun Trews +1"}
    sets.precast.JA['Wild Card'] = {feet="Lanun Bottes +4"}
    sets.precast.JA['Random Deal'] = {body="Lanun Frac +4"}
    sets.precast.FoldDoubleBust = {hands="Lanun Gants +1"}

    sets.precast.CorsairRoll = {main=gear.lanunpathC,range="Compensator",
        head="Lanun Tricorne +1",neck="Loricate Torque +1",ear1="Alabaster Earring",ear2="Chas. Earring",
        body="Malignance Tabard",hands="Chasseur's Gants +2",ring1="Defending Ring",ring2="Murky Ring",
        back=gear.dw_jse_back,waist="Flume Belt",legs="Malignance Tights",feet="Nyame Sollerets"}

    sets.precast.LuzafRing = {ring1="Luzaf's Ring"}
    
    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Chas. Culottes +1"})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chass. Bottes +1"})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chass. Tricorne +1"})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac +1"})
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants +2"})
    sets.precast.CorsairRoll["Bolter's Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Malignance Gloves"})
    
    sets.precast.CorsairShot = {ammo=gear.QDbullet,
        head="Malignance Chapeau",neck="Lissome Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Petrov Ring",ring2="Chirich Ring +1",
        back="Null Shawl",waist="Yemaya Belt",legs="Malignance Tights",feet="Chass. Bottes +1"}
		
    sets.precast.CorsairShot['Light Shot']={ammo="Animikii Bullet",
        head="Laksa. Tricorne +4",neck="Null Loop",ear1="Crep. Earring",ear2="Chas. Earring",
        body="Laksa. Frac +4",hands="Laksamana's gants +4",ring1="Crepuscular Ring",ring2="Metamor. Ring +1",
        back="Null Shawl",waist="Null Belt",legs="Laksa. Trews +4",feet="Laksamana bottes +4"}

    sets.precast.CorsairShot['Dark Shot'] = set_combine(sets.precast.CorsairShot['Light Shot'])

    -- Waltz set (chr and vit)
   -- sets.precast.Waltz = {
    --    head="Carmine Mask +1",neck="Loricate Torque +1",ear1="Sanare Earring",ear2="Etiolation Earring",
     --   body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands,ring1="Valseur's Ring",ring2="Murky Ring",
      --  back="Moonlight Cape",waist="Flume Belt",legs="Dashing Subligar",feet=gear.herculean_waltz_feet}
		
--	sets.Self_Waltz = {head="Mummu Bonnet +2"}
        
    -- Don't need any special gear for Healing Waltz.
   -- sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
        head="Carmine Mask",neck="Baetyl Pendant",ear1="Etiolation Earring",ear2="Loquac. Earring",
        body=gear.TaeonFCBody,hands="Leyline Gloves",ring1="Kishar Ring",ring2="Prolix Ring",
        back="Solemnity Cape",waist="Null Belt",legs="Rawhide Trousers",feet="Carmine Greaves"}


    sets.precast.RA = {ammo=gear.RAbullet,  
        head="Chass. Tricorne +1",neck="Comm. Charm +1",ear1="",ear2="",
        body="Oshosi Vest",hands="Carmine Fin. Ga. +1",ring1="Crepuscular Ring",ring2="",
        back=gear.snapshot_jse_back,waist="Impulse Belt",legs="Laksa. Trews +4",feet="Meg. Jam. +2"}
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {body="Laksa. Frac +4",waist="Yemaya Belt"})
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {body="Laksa. Frac +4",waist="Yemaya Belt"})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo=gear.WSbullet,
        head="Nyame Helm",neck="Rep. Plat. Medal",ear1="Moonshade Earring",ear2="Ishvara Earring",
        body="Laksa. Frac +4",hands="Meg. Gloves +2",ring1="Sroda Ring",ring2="Cornelia's Ring",
        back=gear.str_wsd_jse_back,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}
				
		

		
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS,{})

	sets.precast.WS['Evisceration'] = {ammo=gear.WSbullet,
        head="Mummu Bonnet +2",neck="Fotia Gorget",ear1="Odr Earring",ear2="Moonshade Earring",
        body="Meg. Cuirie +2",hands="Mummu Wrists +2",ring1="Epona's Ring",ring2="Mummu Ring",
        back=gear.str_wsd_jse_back,waist="Fotia Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}
		
	sets.precast.WS['Savage Blade'] = {ammo=gear.WSbullet,
        head="Nyame Helm",neck="Rep. Plat. Medal",ear1="Moonshade Earring",ear2="Ishvara Earring",
        body="Nyame Mail",hands="Meg. Gloves +2",ring1="Sroda Ring",ring2="Cornelia's Ring",
        back=gear.str_wsd_jse_back,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.precast.WS['Savage Blade'].PDL = {ammo=gear.WSbullet,
        head="Nyame Helm",neck="Rep. Plat. Medal",ear1="Moonshade Earring",ear2="Ishvara Earring",
        body="Nyame Mail",hands="Meg. Gloves +2",ring1="Sroda Ring",ring2="Cornelia's Ring",
        back=gear.str_wsd_jse_back,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Lanun Bottes +4"}

    sets.precast.WS['Last Stand'] = {ammo=gear.WSbullet,
        head="Nyame Helm",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Ishvara Earring",
        body="Laksa. Frac +4",hands="Chasseur's Gants +2",ring1="Arvina Ringlet +1",ring2="Cornelia's Ring",
        back=gear.agi_wsd_jse_back,waist="Fotia Belt",legs="Nyame Flanchard",feet="Lanun Bottes +4"}

    sets.precast.WS['Last Stand'].Acc ={ammo=gear.RAbullet,
        head="Laksa. Tricorne +4",neck="Null Loop",ear1="Beyla Earring",ear2="Crep. Earring",
        body="Laksa. Frac +4",hands="Laksamana's gants +4",ring1="Crepuscular Ring",ring2="Cacoethic Ring +1",
        back="Null Shawl",waist="Null Belt",legs="Laksa. Trews +4",feet="Laksa. Bottes +4"}


		
    sets.precast.WS['Detonator'] =sets.precast.WS['Last Stand']
    sets.precast.WS['Detonator'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Slug Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Slug Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Numbing Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Numbing Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Sniper Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Sniper Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Split Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Split Shot'].Acc = sets.precast.WS['Last Stand'].Acc
	
    sets.precast.WS['Leaden Salute'] = {ammo=gear.MAbullet,
        head="Pixie Hairpin +1",neck="Comm. Charm +1",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Lanun Frac +4",hands="Nyame Gauntlets",ring1="Cornelia's Ring",ring2="Arvina Ringlet +1",
        back=gear.magic_wsd_jse_back,waist="Eschan Stone",legs="Nyame Flanchard",feet="Lanun Bottes +4"}
		

    sets.precast.WS['Aeolian Edge'] = {ammo="Hauksbok Bullet",
        head="Nyame Helm",neck="Sibyl Scarf",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Lanun Frac +4",hands="Nyame Gauntlets",ring1="Metamor. Ring +1",ring2="Cornelia's Ring",
        back=gear.magic_wsd_jse_back,waist="Eschan Stone",legs="Nyame Flanchard",feet="Lanun Bottes +4"}

    sets.precast.WS['Wildfire']  = {ammo=gear.MAbullet,
        head="Nyame Helm",neck="Comm. Charm +1",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Lanun Frac +4",hands="Nyame Gauntlets",ring1="Cornelia's Ring",ring2="Arvina Ringlet +1",
        back=gear.magic_wsd_jse_back,waist="Eschan Stone",legs="Nyame Flanchard",feet="Lanun Bottes +4"}
		
		
    sets.precast.WS['Hot Shot'] = set_combine(sets.precast.WS['Wildfire'],{neck="Fotia Gorget",back=gear.agi_wsd_jse_back,ammo=gear.WSbullet,waist="Fotia Belt"})
    sets.precast.WS['Hot Shot'].Acc=set_combine(sets.precast.WS['Hot Shot'],{body="Nyame Mail",feet="Nyame Sollerets",neck="Comm. Charm +1"})

		
		--Because omen skillchains.

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}
        
    -- Midcast Sets
    sets.midcast.FastRecast = {
        head="Carmine Mask",neck="Baetyl Pendant",ear1="Alabaster Earring",ear2="Loquac. Earring",
        body=gear.TaeonFCBody,hands="Leyline Gloves",ring1="Kishar Ring",ring2="Murky Ring",
        back=gear.str_wsd_jse_back,waist="Flume Belt",legs="Nyame Flanchard",feet="Carmine Greaves"}
        
    -- Specific spells

	
    sets.midcast.Utsusemi = sets.midcast.FastRecast

    -- Ranged gear
    sets.midcast.RA = {ammo=gear.RAbullet,
        head="Malignance Chapeau",neck="Combatant's Torque",ear1="Enervating Earring",ear2="Crep. Earring",
        body="Ikenga's Vest",hands="Malignance Gloves",ring1="Crepuscular Ring",ring2="Chirich Ring +1",
        back=gear.tp_ranger_jse_back,waist="Yemaya Belt",legs="Ikenga's Trousers",feet="Malignance Boots"}

    sets.midcast.RA.Acc = {ammo=gear.RAbullet,
        head="Laksa. Tricorne +4",neck="Null Loop",ear1="Beyla Earring",ear2="Crep. Earring",
        body="Laksa. Frac +4",hands="Laksamana's gants +4",ring1="Crepuscular Ring",ring2="Cacoethic Ring +1",
        back="Null Shawl",waist="Null Belt",legs="Laksa. Trews +4",feet="Laksa. Bottes +4"}
		
	sets.buff['Triple Shot'] = {body="Chasseur's Frac +1"}
    
    -- Sets to return to when not performing an action.
	
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
    
    -- Resting sets
    sets.resting = {}
--	sets.BulletPouch = {waist="Chr. Bul. Pouch"}

    -- Idle sets
    sets.idle = {ammo=gear.RAbullet,
        head="Null Masque",neck="Elite Royal Collar",ear1="Eabani Earring",ear2="Infused Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Shneddick Ring",ring2="Murky Ring",
        back="Null Shawl",waist="Null Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		

    
    -- Defense sets
    sets.defense.PDT = {ammo=gear.RAbullet,
        head="Null Masque",neck="Warder's Charm +1",ear1="Eabani Earring",ear2="Tuisto Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Shadow Ring",ring2="Murky Ring",
        back="Shadow Mantle",waist="Flume Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}


	sets.TreasureHunter = {head="Wh. Rarab Cap +1",waist="Chaac Belt",}
    sets.Phalanx_Received={head="Taeon Chapeau",body=gear.TaeonPhalanxBody,hands="Taeon Gloves",legs="Taeon Tights",feet="Taeon Boots"}

	-- Weapons sets
	sets.weapons.DualShooting = {main=gear.lanunpathA,sub="Kustawi +1",range="Fomalhaut"}
	sets.weapons.DualSavage = {main="Naegling",sub="Gleti's Knife",range="Anarchy +2"}
	sets.weapons.DualEvis = {main="Tauret",sub="Gleti's Knife",range="Anarchy +2"}
	sets.weapons.DualAeolian = {main="Tauret",sub="Naegling",range="Anarchy +2"}
	sets.weapons.DualMageSortie={main=gear.lanunpathC,sub="Kustawi +1",range="Fomalhaut"}
    sets.weapons.DualWF={main="Naegling",sub="Tauret",range="Doomsday"}
    sets.weapons.DualMeleeLS={main=gear.lanunpathA,sub="Gleti's Knife",range="Fomalhaut"}
    sets.weapons.Savage = {main="Naegling",sub="Nusku Shield",range="Anarchy +2"}
    sets.weapons.Shooting ={main=gear.lanunpathA,sub="Nusku Shield",range="Fomalhaut"}
    sets.weapons.Evis={main="Tauret",sub="Nusku Shield",range="Anarchy +2"}
    sets.weapons.WF={main="Tauret",sub="Nusku Shield",range="Doomsday"}
    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
	    head="Malignance Chapeau",neck="Lissome Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Chirich Ring +1",
		back="Null Shawl",waist="Sailfi Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

    sets.engaged.DT={
	    head="Malignance Chapeau",neck="Null Loop",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Murky Ring",
		back="Null Shawl",waist="Sailfi Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

    
    sets.engaged.Acc = {
		head="Malignance Chapeau",neck="Null Loop",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Malignance Tabard",hands="Gazu Bracelets +1",ring1="Epona's Ring",ring2="Murky Ring",
		back="Null Shawl",waist="Sailfi Belt +1",legs="Malignance Tights",feet="Malignance Boots"}


    sets.engaged.DW = {
		head="Malignance Chapeau",neck="Lissome Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Chirich Ring +1",
		back=gear.dw_jse_back,waist="Sailfi Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

    sets.engaged.DW.DT = {
		head="Malignance Chapeau",neck="Lissome Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Murky Ring",
		back=gear.dw_jse_back,waist="Sailfi Belt +1",legs="Malignance Tights",feet="Malignance Boots"} 
    
    
    sets.engaged.DW.Acc = {
		head="Malignance Chapeau",neck="Null Loop",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Malignance Tabard",hands="Gazu Bracelets +1",ring1="Epona's Ring",ring2="Murky Ring",
		back=gear.dw_jse_back,waist="Sailfi Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    if player.sub_job == 'NIN' then
        set_macro_page(1, 6)
    elseif player.sub_job == 'DNC' then
		set_macro_page(3, 6)
    else
        set_macro_page(1, 6)
    end
end

function user_job_lockstyle()

	windower.chat.input('/lockstyleset 009')
end
