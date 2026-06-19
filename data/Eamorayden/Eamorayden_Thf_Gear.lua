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
	sets.buff.Sleep = {}
	
    sets.buff['Sneak Attack'] = {}
    sets.buff['Trick Attack'] = {}

    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
	
	-- Weapons sets
	sets.weapons.Aeolian = {main="Tauret",sub="Malevolence"}
	sets.weapons.Savage = {main="Naegling",sub="Gleti's Knife"}
	sets.weapons.Evisceration = {main="Tauret",sub="Gleti's Knife"}
    sets.weapons.Asuran={main="Karambit"}
	
    -- Actions we want to use to tag TH.
	sets.precast.JA.Provoke = sets.TreasureHunter

    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA['Collaborator'] = {}
    sets.precast.JA['Accomplice'] = {}
    sets.precast.JA['Flee'] = {} --feet="Pillager's Poulaines +1"
    sets.precast.JA['Hide'] = {}
    sets.precast.JA['Conspirator'] = {} 
    sets.precast.JA['Steal'] = {} --feet="Pillager's Poulaines +1"
	sets.precast.JA['Mug'] = {}
    sets.precast.JA['Despoil'] = {}
    sets.precast.JA['Perfect Dodge'] = {}
    sets.precast.JA['Feint'] = {} -- {legs="Assassin's Culottes +2"}

    sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
    sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']


    -- Fast cast sets for spells
    sets.precast.FC = {ammo="Sapience Orb",
		head="",neck="Baetyl Pendant",ear1="Etiolation Earring",ear2="Loquac. Earring",
		body=gear.TaeonFCBody,hands="Leyline Gloves",ring1="Naji's Loop",ring2="Prolix Ring",
		legs=gear.FCHercPants}



    -- Ranged snapshot gear
    sets.precast.RA = {}


    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Coiste Bodhar",
        head="Nyame Helm",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Cornelia's Ring",ring2="Epona's Ring",
        back="Toutatis's Cape",waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {ammo="Yetshila +1",ear1="Sherida Earring",ear2="Odr Earring",neck="Fotia Gorget",body="Gleti's Cuirass",hands="Gleti's Gauntlets",waist="Fotia Belt",ring1="Gere ring",legs="Gleti's Breeches",feet="Gleti's Boots",back="Null Shawl"})
    sets.precast.WS['Aeolian Edge'] = {ammo="Pemphredo Tathlum",
        head="Nyame Helm",neck="Sibyl Scarf",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Metamorph Ring +1",ring2="Cornelia's Ring",
        back="Toutatis's Cape",waist="Eschan Stone",legs="Nyame Flanchard",feet="Nyame Sollerets"}


    sets.precast.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)
	
	sets.precast.WS['Gust Slash']=sets.precast.WS['Aeolian Edge']


     sets.precast.WS['Asuran Fists']={ammo="Coiste Bodhar",
        head="Nyame Helm",neck="Fotia Gorget",ear1="Sherida Earring",ear2="Ishvara Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Cornelia's Ring",ring2="Sroda Ring",
        back="Toutatis's Cape",waist="Fotia Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring",ear2="Cessance Earring"}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Sherida Earring"}

    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {ammo="Sapience Orb",
		head="Null Masque",neck="Baetyl Pendant",ear1="Etiolation Earring",ear2="Loquac. Earring",
		body=gear.TaeonFCBody,hands="Leyline Gloves",ring1="Naji's Loop",ring2="Prolix Ring",
		legs=gear.FCHercPants,feet="Nyame Sollerets"}

    -- Specific spells
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

    sets.defense.PDT = {ammo="Crepuscular Pebble",
        head="Null Masque",neck="Warder's Charm +1",ear1="Night Earring",ear2="Eabani Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Shadow Ring",ring2="Murky Ring",
        back="Shadow Mantle",waist="Null Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}


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
    right_ear="Skulker's Earring +1",
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

