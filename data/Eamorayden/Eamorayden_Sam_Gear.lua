-- Setup vars that are user-dependent.
function user_job_setup()
    state.OffenseMode:options('Normal','Acc')
    state.HybridMode:options('Normal','PDT')
    state.WeaponskillMode:options('Normal','PDL')
    state.RangedMode:options('Normal', 'Acc')
    state.PhysicalDefenseMode:options('PDT')
    state.IdleMode:options('Normal')
	state.Weapons:options('Dojikiri','ShiningOne')

	gear.ws_jse_back = {name="Smertrios's Mantle",augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	gear.stp_jse_back = {name="Smertrios's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}}
    -- Additional local binds
 

  --  select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Precast Sets
    -- Precast sets to enhance JAs
    sets.precast.JA.Meditate = {head="Wakido Kabuto +3",hands="Sakonji Kote +1",back=gear.ws_jse_back}
    sets.precast.JA['Warding Circle'] = {head="Wakido Kabuto +3"}
    sets.precast.JA['Blade Bash'] = {hands="Sakonji Kote +1"}
	sets.precast.JA['Sekkanoki'] = {hands="Kasuga Kote +1"}
	sets.precast.JA['Sengikori'] = {feet="Kas. Sune-Ate +1"}
	

    -- Fast cast sets for spells
    sets.precast.FC = {head="Null Masque",neck="Baetyl Pendant",ear1="Etiolation Earring",ear2="Loquac. Earring",
        body="Nyame Mail",hands="Leyline Gloves",ring1="Naji's Loop",ring2="Prolix Ring",
        back="Solemnity Cape",waist="Null Belt",legs="Nyame Flanchard",feet="Amm Greaves"}
	   
    
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Knobkierrie",
        head="Mpaca's Cap",neck="Rep. Plat. Medal",ear1="Moonshade Earring",ear2="Kasuga Earring +2",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",ring2="Cornelia's Ring",
        back=gear.str_wsd_jse_back,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}

        sets.precast.WS.PDL = {ammo="Knobkierrie",
        head="Mpaca's Cap",neck="Rep. Plat. Medal",ear1="Moonshade Earring",ear2="Kasuga Earring +2",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Sroda Ring",ring2="Cornelia's Ring",
        back=gear.str_wsd_jse_back,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}
    
	
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Tachi: Fudo'] = set_combine(sets.precast.WS, {})
   
	
    sets.precast.WS['Tachi: Shoha'] = set_combine(sets.precast.WS, {})
    

    sets.precast.WS['Tachi: Rana'] = set_combine(sets.precast.WS, {})
  

    sets.precast.WS['Tachi: Kasha'] = set_combine(sets.precast.WS, {})
  

    sets.precast.WS['Tachi: Gekko'] = set_combine(sets.precast.WS, {})
    

    sets.precast.WS['Tachi: Yukikaze'] = set_combine(sets.precast.WS, {})
    
    sets.precast.WS['Tachi: Ageha'] = {ammo="Pemphredo Tathlum",
		head="Mpaca's Cap",neck="Null Loop",ear1="Moonshade Earring",ear2="Bhikku Earring +1",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1=gear.left_stinky,ring2="Murky Ring",
		back="Null Shawl",waist="Null Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
    sets.precast.WS['Tachi: Hobaku'] = set_combine(sets.precast.WS['Tachi: Ageha'], {})
	sets.precast.WS['Leg Sweep']=set_combine(sets.precast.WS['Tachi: Ageha'], {})

    sets.precast.WS['Tachi: Jinpu'] = {ammo="Knobkierrie",
        head="Nyame Helm",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Kasuga Earring +2",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",ring2="Cornelia's Ring",
        back=gear.str_wsd_jse_back,waist="Fotia Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.precast.WS['Tachi: Jinpu'].PDL = {ammo="Knobkierrie",
        head="Nyame Helm",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Kasuga Earring +2",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Sroda Ring",ring2="Cornelia's Ring",
        back=gear.str_wsd_jse_back,waist="Fotia Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

		
    

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Thrud Earring",head="Nyame Helm"}
	
    -- Midcast Sets
    sets.midcast.FastRecast = {
        head="Null Masque",neck="Baetyl Pendant",ear1="Etiolation Earring",ear2="Loquac. Earring",
        body="Nyame Mail",hands="Leyline Gloves",ring1="Naji's Loop",ring2="Prolix Ring",
        back="Solemnity Cape",waist="Null Belt",legs="Nyame Flanchard",feet="Amm Greaves"}
		
    -- Specific spells
 
    

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	
    sets.Reraise = {head="Crepuscular Helm",body="Twilight Mail"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})

    sets.idle = {ammo="Staunch Tathlum +1",
		head="Null Masque",neck="Warder's Charm +1",ear1="Night Earring",ear2="Eabani Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Shneddick Ring",ring2="Murky Ring",
		back="Null Shawl",waist="Null Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
   sets.idle.Weak= set_combine(sets.idle, {head="Crepuscular Helm",body="Twilight Mail"})
		
    
    -- Defense sets
    sets.defense.PDT = {ammo="Crepuscular Pebble",
        head="Null Masque",neck="Warder's Charm +1",ear1="Night Earring",ear2="Eabani Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Shadow Ring",ring2="Murky Ring",
        back="Shadow Mantle",waist="Null Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}


    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    -- Delay 450 GK, 25 Save TP => 65 Store TP for a 5-hit (25 Store TP in gear)
    sets.engaged = {ammo="Aurgelmir Orb +1",
        head="Flam. Zucchetto +2",neck="Moonbeam Nodowa",ear1="Dedition Earring",ear2="Kasuga Earring +2",
        body="Kasuga Domaru +1",hands=gear.valorous_acc_hands,ring1="Niqmaddu Ring",ring2="Chirich Ring +1",
        back=gear.stp_jse_back,waist="Ioskeha Belt",legs="Wakido Haidate +3",feet="Flam. Gambieras +2"}
   
    sets.engaged.PDT = {ammo="Staunch Tathlum +1",
        head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Nyame Mail",hands="Wakido Kote +3",ring1="Defending Ring",ring2="Patricius Ring",
        back="Moonlight Cape",waist="Ioskeha Belt",legs="Wakido Haidate +3",feet="Nyame Sollerets"}
     

	-- Weapons sets
	sets.weapons.Dojikiri = {main="Dojikiri Yasutsuna",sub="Utu Grip"}
    sets.weapons.ShiningOne={main+"Shining One",sub="Utu Grip"}
	
	-- Buff sets
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {neck="Vim Torque +1"}
	sets.buff.Hasso = {}
	sets.buff['Third Eye'] = {} --legs="Sakonji Haidate +3"
    sets.buff.Sekkanoki = {hands="Kasuga Kote +1"}
    sets.buff.Sengikori = {feet="Kas. Sune-Ate +1"}
    sets.buff['Meikyo Shisui'] = {feet="Sak. Sune-Ate +1"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DRK' then
        set_macro_page(1, 8)
    elseif player.sub_job == 'DRG' then
        set_macro_page(4, 8)
    end
end
