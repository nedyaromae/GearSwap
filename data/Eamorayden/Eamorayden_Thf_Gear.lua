-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','FullAcc')
    state.HybridMode:options('Normal','DT')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Normal')
	state.IdleMode:options('Normal', 'Sphere')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Aeolian','Savage','Evisceration','Asuran')

	state.AmbushMode = M(false, 'Ambush Mode')

	gear.da_jse_back = {name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}
	gear.wsd_jse_back = {name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}

    -- Additional local binds

--    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Special sets (required by rules)
    --------------------------------------

	sets.TreasureHunter = {waist="Chaac Belt",feet="Skulk. Poulaines +1",ammo="Per. Lucky Egg"}
    sets.Phalanx_Received={head="Taeon Chapeau",body=gear.TaeonPhalanxBody,hands="Taeon Gloves",legs="Taeon Tights",feet="Taeon Boots"}
  --  sets.Kiting = {ring2="Shneddick Ring"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	
    sets.buff['Sneak Attack'] = {}
    sets.buff['Trick Attack'] = {"Pill. Armlets +3"}

    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
	sets.Suppa = {ear1="Suppanomimi", ear2="Sherida Earring"}
	sets.DWEarrings = {ear1="Dudgeon Earring",ear2="Heartseeker Earring"}
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",body="Adhemar Jacket +1",hands="Floral Gauntlets",waist="Reiki Yotai"}
	sets.Parry = {hands="Turms Mittens +1",ring1="Defending Ring"}
	sets.Ambush = {} --body="Plunderer's Vest +1"
	
	-- Weapons sets
	sets.weapons.Aeolian = {main="Tauret",sub="Malevolence"}
	sets.weapons.Savage = {main="Naegling",sub="Gleti's Knife"}
	sets.weapons.Evisceration = {main="Tauret",sub="Gleti's Knife"}
    sets.weapons.Asuran={main="Karambit"}
	
    -- Actions we want to use to tag TH.
    sets.precast.Step = {ammo="C. Palug Stone",
        head="Malignance Chapeau",neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Odr Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back=gear.da_jse_back,waist="Olseni Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.precast.JA['Violent Flourish'] = {ammo="C. Palug Stone",
        head="Malignance Chapeau",neck="Combatant's Torque",ear1="Digni. Earring",ear2="Odr Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back=gear.da_jse_back,waist="Olseni Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.precast.JA['Animated Flourish'] = sets.TreasureHunter
	sets.precast.JA.Provoke = sets.TreasureHunter

    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA['Collaborator'] = {"Skulker's Bonnet"}
    sets.precast.JA['Accomplice'] = {"Skulker's Bonnet"}
    sets.precast.JA['Flee'] = {} --feet="Pillager's Poulaines +1"
    sets.precast.JA['Hide'] = {body="Pillager's Vest +3"}
    sets.precast.JA['Conspirator'] = {body="Skulker's Vest"} 
    sets.precast.JA['Steal'] = {} --feet="Pillager's Poulaines +1"
	sets.precast.JA['Mug'] = {}
    sets.precast.JA['Despoil'] = {legs="Skulker's Culottes",feet="Skulk. Poulaines +1"}
    sets.precast.JA['Perfect Dodge'] = {hands="Plunderer's Armlets +1"}
    sets.precast.JA['Feint'] = {} -- {legs="Assassin's Culottes +2"}

    sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
    sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Yamarang",
        head="Mummu Bonnet +2",neck="Unmoving Collar +1",ear1="Enchntr. Earring +1",ear2="Handler's Earring +1",
        body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Valseur's Ring",
        back="Moonlight Cape",waist="Chaac Belt",legs="Dashing Subligar",feet=gear.herculean_waltz_feet}

	sets.Self_Waltz = {head="Mummu Bonnet +2",body="Passion Jacket",ring1="Asklepian Ring"}
		
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}


    -- Fast cast sets for spells
    sets.precast.FC = {ammo="Sapience Orb",
		head="",neck="Baetyl Pendant",ear1="Etiolation Earring",ear2="Loquac. Earring",
		body=gear.TaeonFCBody,hands="Leyline Gloves",ring1="Naji's Loop",ring2="Prolix Ring",
		legs="Enif Cosciales"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})


    -- Ranged snapshot gear
    sets.precast.RA = {}


    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Coiste Bodhar",
        head="Nyame Helm",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Cornelia's Ring",ring2="Epona's Ring",
        back="Toutatis's Cape",waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {ammo="Yetshila +1",head="Mummu Bonnet +2",ear1="Moonshade Earring",ear2="Odr Earring",neck="Fotia Gorget",body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Mummu ring",waist="Sailfi Belt +1",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
    sets.precast.WS['Aeolian Edge'] = {ammo="Pemphredo Tathlum",
        head="Nyame Helm",neck="Sibyl Scarf",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Metamorph Ring +1",ring2="Cornelia's Ring",
        back="Toutatis's Cape",waist="Eschan Stone",legs="Nyame Flanchard",feet="Nyame Sollerets"}


    sets.precast.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)
	
	sets.precast.WS['Gust Slash']=sets.precast.WS['Aeolian Edge']


     sets.precast.WS['Asuran Fists']={ammo="Coiste Bodhar",
        head="Nyame Helm",neck="Fotia Gorget",ear1="Sherida Earring",ear2="Ishvara Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Cornelia's Ring",ring2="Sroda Ring",
        back="Toutatis's Cape",waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring",ear2="Cessance Earring"}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Sherida Earring"}

    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
        head=gear.herculean_fc_head,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
        body="Dread Jupon",hands="Leyline Gloves",ring1="Defending Ring",ring2="Naji's Loop",
        back="Moonlight Cape",waist="Tempus Fugit",legs="Rawhide Trousers",feet="Malignance Boots"}

    -- Specific spells
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {back="Mujin Mantle"})

	sets.midcast.Dia = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Poisonga'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)

    --------------------------------------
    -- Idle/resting/defense sets
    --------------------------------------

    -- Resting sets
    sets.resting = {}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {ammo="Amar Cluster",
        head="Null Masque",neck="Elite Royal Collar",ear1="Eabani Earring",ear2="Infused Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Murky Ring",ring2="Shneddick Ring",
        back="Null Shawl",waist="Null Belt",legs="Nyame Flanchard",feet="Malignance Boots"}
		

    -- Defense sets

    sets.defense.PDT = {ammo="Eluder's Sachet",
        head="Nyame helm",neck="Loricate Torque +1",ear1="Tuisto Earring",ear2="Mimir Earring",
        body="Nyame mail",hands="Nyame Gauntlets",ring1="Murky Ring",ring2="Shadow Ring",
        back="Shadow Mantle",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}


    --------------------------------------
    -- Melee sets  
    --------------------------------------

    -- Normal melee group
    sets.engaged = {
    ammo="Coiste Bodhar",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
    waist="Reiki Yotai",
    left_ear="Sherida Earring",
    right_ear="Skulker's Earring",
    left_ring="Gere Ring",
    right_ring="Epona's Ring",
    back="Null Shawl" }
	
   
end

-- Select default macro book on initial load or subjob change.
--function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(1, 2)
    elseif player.sub_job == 'WAR' then
        set_macro_page(1, 2)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 2)
    else
        set_macro_page(1, 2)
    end

