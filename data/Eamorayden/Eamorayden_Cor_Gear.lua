-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal','Acc')
    state.RangedMode:options('Acc','Normal')
    state.WeaponskillMode:options('Match','Normal', 'Acc','Proc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal')
	state.HybridMode:options('Normal','DT')
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None', 'DWMax'}
	state.Weapons:options('SavageDW','ShootingDW','DualAeolian','EvisDW')
	state.CompensatorMode:options('Always','300','1000','Never')

    gear.RAbullet = "Adlivun Bullet"
    gear.WSbullet = "Adlivun Bullet"
    gear.MAbullet = "Orichalc. Bullet" --For MAB WS, do not put single-use bullets here.
    gear.QDbullet = "Hauksbok Bullet"
    options.ammo_warning_limit = 15
    --Ikenga_vest_bonus = 190  -- It is 190 at R20. Uncomment if you need to manually adjust because you are using below R20

	gear.tp_ranger_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}}
	gear.snapshot_jse_back = {name="Camulus's Mantle",augments={'"Snapshot"+10',}}
	gear.tp_jse_back = { name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.ranger_wsd_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}}
	gear.magic_wsd_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}}
	gear.str_wsd_jse_back = {name="Camulus's Mantle",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
    gear.dw_jse_back=   {name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}}
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
    sets.precast.JA['Random Deal'] = {body="Lanun Frac +1"}
    sets.precast.FoldDoubleBust = {hands="Lanun Gants +1"}

    sets.precast.CorsairRoll = {main=gear.lanunpathC,range="Compensator",
        head="Lanun Tricorne +1",neck="Loricate Torque +1",ear1="Alabaster Earring",ear2="Chass. Earring",
        body="Nyame Mail",hands="Chasseur's Gants +2",ring1="Defending Ring",ring2="Murky Ring",
        back=gear.dw_jse_back,waist="Flume Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.precast.LuzafRing = {ring1="Luzaf's Ring"}
    
    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Chas. Culottes +1"})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chass. Bottes +1"})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chass. Tricorne +1"})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac +1"})
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants +2"})
    
    sets.precast.CorsairShot = {ammo=gear.QDbullet,
        head="Malignance Chapeau",neck="Lissome Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Petrov Ring",ring2="Chirich Ring +1",
        back="Null Shawl",waist="Tellen Belt",legs="Malignance Tights",feet="Chass. Bottes +1"}
		
    sets.precast.CorsairShot['Light Shot']={ammo="Animikii Bullet",
        head="Laksa. Tricorne +3",neck="Null Loop",ear1="Cessance Earring",ear2="Chas. Earring",
        body="Laksa. Frac +4",hands="Laksa. Gants +3",ring1=gear.left_stinky,ring2=gear.right_stinky,
        back="Null Shawl",waist="Null Belt",legs="Malignance Tights",feet="Laksa Bottes +4"}

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
        head="Carmine Mask",neck="Baetyl Pendant",ear1="Loquac Earring",ear2="Etiolation Earring",
        body="",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Naji's Loop",
        back="",waist="",legs="",feet=""}


    sets.precast.RA = {ammo=gear.RAbullet,  
        head="Chass. Tricorne +1",neck="Comm. Charm +1",ear1="",ear2="",
        body="Oshosi Vest",hands="Lanun Gants +1",ring1="",ring2="",
        back=gear.snapshot_jse_back,waist="Impulse Belt",legs="Laksa. Trews +3",feet="Meg. Jam. +2"}
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {body="Laksa. Frac +4"})
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {body="Laksa. Frac +4"})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo=gear.WSbullet,
        head="Nyame Helm",neck="Rep. Plat. Metal",ear1="Moonshade Earring",ear2="Ishvara Earring",
        body="Laksa. Frac +4",hands="Meg. Gloves +2",ring1="Sroda Ring",ring2="Cornelia's Ring",
        back=gear.str_wsd_jse_back,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}
				
		

		
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS,{})

	sets.precast.WS['Evisceration'] = {ammo=gear.WSbullet,
        head="Mummu Bonnet +2",neck="Fotia Gorget",ear1="Odr Earring",ear2="Moonshade Earring",
        body="Meg. Curie +2",hands="Mummu Wrists +2",ring1="Epona's Ring",ring2="Mummu Ring",
        back=gear.str_wsd_jse_back,waist="Sailfi Belt +1",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}
		
	sets.precast.WS['Savage Blade'] = {ammo=gear.WSbullet,
        head="Nyame Helm",neck="Rep. Plat. Metal",ear1="Moonshade Earring",ear2="Ishvara Earring",
        body="Nyame Mail",hands="Meg. Gloves +2",ring1="Sroda Ring",ring2="Cornelia's Ring",
        back=gear.str_wsd_jse_back,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.precast.WS['Last Stand'] = {ammo=gear.WSbullet,
        head="Nyame Helm",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Ishvara Earring",
        body="Laksa. Frac +4",hands="Chasseur's gants +2 ",ring1="Epona's Ring",ring2="Cornelia's Ring",
        back=gear.magic_wsd_jse_back,waist="Eschan Stone",legs="Nyame Flanchard",feet="Lanun Bottes +4"}

    sets.precast.WS['Last Stand'].Acc ={ammo=gear.RAbullet,
        head="Malignance Chapeau",neck="Null Loop",ear1="Suppanomimi",ear2="Infused Earring",
        body="Laksa. Frac +4",hands="Malignance Gloves",ring1="Mummu Ring",ring2="Meghanada Ring",
        back="Null Shawl",waist="Null Belt",legs="Malignance Tights",feet="Laksa. Bottes +4"}
		
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
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Cornelia's Ring",ring2="Petrov Ring",
        back=gear.magic_wsd_jse_back,waist="Eschan Stone",legs="Nyame Flanchard",feet="Lanun Bottes +4"}
		

    sets.precast.WS['Aeolian Edge'] = {ammo="Hauksbok Bullet",
        head="Nyame Helm",neck="Sibyl Scarf",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Nyame mail",hands="Nyame Gauntlets",ring1="Metamor. Ring +1",ring2="Cornelia's Ring",
        back=gear.magic_wsd_jse_back,waist="Eschan Stone",legs="Nyame Flanchard",feet="Lanun Bottes +4"}

    sets.precast.WS['Wildfire']  = {ammo=gear.MAbullet,
        head="Nyame Helm",neck="Comm. Charm +1",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Cornelia's Ring",ring2="Petrov Ring",
        back=gear.magic_wsd_jse_back,waist="Eschan Stone",legs="Nyame Flanchard",feet="Lanun Bottes +4"}
		
		
    sets.precast.WS['Hot Shot'] = set_combine(sets.precast.WS['Wildfire'],{ear2="Moonshade Earring"})
		
		--Because omen skillchains.

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}
        
    -- Midcast Sets
    sets.midcast.FastRecast = {
        head="Carmine Mask",neck="Baetyl Pendant",ear1="Alabaster Earring.",ear2="Loquac. Earring",
        body="Dread Jupon",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
        back="Moonlight Cape",waist="Flume Belt",legs="Nyame Flanchard",feet="Carmine Greaves +1"}
        
    -- Specific spells

	
    sets.midcast.Utsusemi = sets.midcast.FastRecast

    -- Ranged gear
    sets.midcast.RA = {ammo=gear.RAbullet,
        head="Malignance Chapeau",neck="Lissome Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Petrov Ring",
        back="Null Shawl",waist="Tellen Belt",legs="Malignance Tights",feet="Malignance Boots"}

    sets.midcast.RA.Acc = {ammo=gear.RAbullet,
        head="Malignance Chapeau",neck="Null Loop",ear1="Suppanomimi",ear2="Infused Earring",
        body="Laksa. Frac +4",hands="Malignance Gloves",ring1="Mummu Ring",ring2="Meghanada Ring",
        back="Null Shawl",waist="Null Belt",legs="Malignance Tights",feet="Laksa. Bottes +4"}
		
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
        head="Null Masque",neck="Warder's Charm +1",ear1="Eabani Earring",ear2="Infused Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Shneddick Ring",ring2="Murky Ring",
        back="Null Shawl",waist="Null Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		

    
    -- Defense sets
    sets.defense.PDT = {ammo=gear.RAbullet,
        head="Null Masque",neck="Warder's Charm +1",ear1="Eabani Earring",ear2="Tuisto Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Shadow Ring",ring2="Murky Ring",
        back="Shadow Mantle",waist="Flume Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}


	sets.TreasureHunter = {head="Wh. Rarab Cap +1",waist="Chaac Belt",}

	-- Weapons sets
	sets.weapons.ShootingDW = {main=gear.lanunpathA,sub="Gleti's Knife",range="Doomsday"}
	sets.weapons.SavageDW = {main="Naegling",sub="Gleti's Knife",range="Anarchy +2"}
	sets.weapons.EvisDW = {main="Kaja Knife",sub="Gleti's Knife",range="Anarchy +2"}
	sets.weapons.Savage = {main="Naegling",sub="",range="Anarchy +2"}
	sets.weapons.DualAeolian = {main="Kaja Knife",sub="Naegling",range="Anarchy +2"}
	sets.weapons.MageSortie={main=gear.lanunpathC,sub=gear.lanunpathA,range="Holliday"}
    sets.weapons.Leaden={main="Naegling",sub="Kaja Knife",range="Doomsday"}
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
    
    sets.engaged.Acc = {
		head="Malignance Chapeau",neck="Null Loop",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Malignance Tabard",hands="Gazu Bracelets +1",ring1="Epona's Ring",ring2="Murky Ring",
		back="Null Shawl",waist="Sailfi Belt +1",legs="Malignance Tights",feet="Malignance Boots"}


    sets.engaged.DW = {
		head="Malignance Chapeau",neck="Lissome Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Chirich Ring +1",
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
