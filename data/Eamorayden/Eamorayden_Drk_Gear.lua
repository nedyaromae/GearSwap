function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal')
    state.WeaponskillMode:options('Match')
    state.HybridMode:options('Normal')
    state.PhysicalDefenseMode:options('PDT')
	state.IdleMode:options('Normal','Reraise')
	state.Weapons:options('Agwu','Lycurgos')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Passive = M{['description'] = 'Passive Mode','None','MP','Twilight'}
	state.DrainSwapWeaponMode = M{'Always','Never','300','1000'}

	-- Additional local binds
	send_command('bind ^` input /ja "Hasso" <me>')
	send_command('bind !` input /ja "Seigan" <me>')
	send_command('bind @` gs c cycle SkillchainMode')
	
--	select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	-- Precast Sets
	-- Precast sets to enhance JAs
	sets.precast.JA['Diabolic Eye'] = {}
	sets.precast.JA['Arcane Circle'] = {}
	sets.precast.JA['Souleater'] = {}
	sets.precast.JA['Weapon Bash'] = {}
	sets.precast.JA['Nether Void'] = {}
	sets.precast.JA['Blood Weapon'] = {}
	sets.precast.JA['Dark Seal'] = {}
	sets.precast.JA['Last Resort'] = {}
                   
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
                   
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}
           
	sets.precast.Step = {}
	
	sets.precast.Flourish1 = {}
		   
	-- Fast cast sets for spells

	sets.precast.FC = {ammo="Sapience Orb",
		head="Carmine Mask +1",neck="Baetyl Pendant",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
		body="",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Kishar Ring",
		back="",waist="Flume Belt +1",legs="",feet="Odyssean Greaves"}

	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
		
	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Sapience Orb",
		head="Carmine Mask +1",neck="Baetyl Pendant",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
		body="Sakpata's Plate",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Kishar Ring",
		back="Null Shawl",waist="Flume Belt +1",legs="",feet="Odyssean Greaves"}

                   
	-- Specific spells
 
		   
	sets.midcast.Absorb = set_combine(sets.midcast['Dark Magic'], {})
           

	sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {})
	
	sets.DrainWeapon = {}
	
	--sets.AbsorbWeapon = {main="Liberator",sub="Khonsu",range="Ullr",ammo=empty}
	--sets.DreadWeapon = {main="Crepuscular Scythe",sub="Utu Grip",} 	
                   
	sets.midcast.Aspir = sets.midcast.Drain
	
	
	sets.midcast.Cure = {}
	
	sets.Self_Healing = {waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
						                   
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Knobkierrie",	
		head="Nyame Helm",neck="Rep. Plat. Medal",ear1="Moonshade Earring",ear2="Thrud Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Sroda Ring",ring2="Cornelia's Ring",
        back="Null Shawl",waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}


	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.	
    sets.precast.WS['Catastrophe'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Torcleaver'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Entropy'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {})
    
           
     -- Sets to return to when not performing an action.
           
     -- Resting sets
     sets.resting = {}
    sets.weapons.Agwu={main="Agwu's Claymore",sub="Utu Grip"}
	sets.weapons.Lycurgos={main="Lycurgos",sub="Utu Grip"}
	sets.Phalanx_Received = {head="Odyssean Helm",body="Yorium Cuirass",legs="Sakpata's leggings"}
	-- Swap to these on Moonshade using WS if at 3000 TP
--	sets.MaxTP = {ear1="Lugra Earring +1",ear2="Lugra Earring",}
--	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}
	--sets.AccDayMaxTPWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	--sets.DayMaxTPWSEars = {ear1="Ishvara Earring",ear2="Brutal Earring",}
	--sets.AccDayWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	--sets.DayWSEars = {ear1="Brutal Earring",ear2="Moonshade Earring",}
     
            -- Idle sets
           
    sets.idle = {ammo="Staunch Tathlum +1",
		head="Null Masque",neck="Warder's Charm +1",ear1="Eabani Earring",ear2="Night Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Murky Ring",ring2="Chirich Ring +1",
		back="Null Shawl",waist="Null Belt",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
		

	sets.idle.Weak = set_combine(sets.idle, {head="Crepuscular Helm",body="Twilight Mail"})
		
	sets.idle.Reraise = set_combine(sets.idle, {head="Crepuscular Helm",body="Twilight Mail"})
           
    -- Defense sets
	sets.defense.PDT = {ammo="Crepuscular Pebble",
		head="Sakpata's Helm",neck="Warder's Charm +1",ear1="Eabani Earring",ear2="Night Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Murky Ring",ring2="Shadow Ring",
		back="Shadow Mantle",waist="Null Belt",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
     
	sets.Kiting = {ring2="Shneddick Ring"}
	sets.passive.Reraise = {head="Crepuscular Helm",body="Twilight Mail"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Vim Torque +1"}
	sets.buff['Dark Seal'] = {} --head="Fallen's Burgeonet +3"
     
	-- Engaged sets
	sets.engaged = {ammo="Coiste Bodhar", 
		head="Sakpata's Helm",neck="Vim Torque +1",ear1="Schere Earring",ear2="Brutal Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Niqmaddu Ring",ring2=gear.right_moonlight,
		back="Null Shawl",waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
--Example sets:
--[[
    sets.engaged.Adoulin = {}
	sets.engaged.SomeAcc.Adoulin = {}
	sets.engaged.Acc.Adoulin = {}
	sets.engaged.FullAcc.Adoulin = {}
	sets.engaged.Fodder.Adoulin = {}
	
	sets.engaged.PDT = {}
	sets.engaged.SomeAcc.PDT = {}
	sets.engaged.Acc.PDT = {}
	sets.engaged.FullAcc.PDT = {}
	sets.engaged.Fodder.PDT = {}
	
	sets.engaged.PDT.Adoulin = {}
	sets.engaged.SomeAcc.PDT.Adoulin = {}
	sets.engaged.Acc.PDT.Adoulin = {}
	sets.engaged.FullAcc.PDT.Adoulin = {}
	sets.engaged.Fodder.PDT.Adoulin = {}
	
	sets.engaged.MDT = {}
	sets.engaged.SomeAcc.MDT = {}
	sets.engaged.Acc.MDT = {}
	sets.engaged.FullAcc.MDT = {}
	sets.engaged.Fodder.MDT = {}
	
	sets.engaged.MDT.Adoulin = {}
	sets.engaged.SomeAcc.MDT.Adoulin = {}
	sets.engaged.Acc.MDT.Adoulin = {}
	sets.engaged.FullAcc.MDT.Adoulin = {}
	sets.engaged.Fodder.MDT.Adoulin = {}
	
            -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
            -- sets if more refined versions aren't defined.
            -- If you create a set with both offense and defense modes, the offense mode should be first.
            -- EG: sets.engaged.Dagger.Accuracy.Evasion

-- Liberator melee sets
    sets.engaged.Liberator = {}
	sets.engaged.Liberator.SomeAcc = {}
	sets.engaged.Liberator.Acc = {}
	sets.engaged.Liberator.FullAcc = {}
	sets.engaged.Liberator.Fodder = {}
	
    sets.engaged.Liberator.Adoulin = {}
	sets.engaged.Liberator.SomeAcc.Adoulin = {}
	sets.engaged.Liberator.Acc.Adoulin = {}
	sets.engaged.Liberator.FullAcc.Adoulin = {}
	sets.engaged.Liberator.Fodder.Adoulin = {}
	
    sets.engaged.Liberator.AM = {}
	sets.engaged.Liberator.SomeAcc.AM = {}
	sets.engaged.Liberator.Acc.AM = {}
	sets.engaged.Liberator.FullAcc.AM = {}
	sets.engaged.Liberator.Fodder.AM = {}
	
    sets.engaged.Liberator.Adoulin.AM = {}
	sets.engaged.Liberator.SomeAcc.Adoulin.AM = {}
	sets.engaged.Liberator.Acc.Adoulin.AM = {}
	sets.engaged.Liberator.FullAcc.Adoulin.AM = {}
	sets.engaged.Liberator.Fodder.Adoulin.AM = {}

	sets.engaged.Liberator.PDT = {}
	sets.engaged.Liberator.SomeAcc.PDT = {}
	sets.engaged.Liberator.Acc.PDT = {}
	sets.engaged.Liberator.FullAcc.PDT = {}
	sets.engaged.Liberator.Fodder.PDT = {}
	
	sets.engaged.Liberator.PDT.Adoulin = {}
	sets.engaged.Liberator.SomeAcc.PDT.Adoulin = {}
	sets.engaged.Liberator.Acc.PDT.Adoulin = {}
	sets.engaged.Liberator.FullAcc.PDT.Adoulin = {}
	sets.engaged.Liberator.Fodder.PDT.Adoulin = {}
	
	sets.engaged.Liberator.PDT.AM = {}
	sets.engaged.Liberator.SomeAcc.PDT.AM = {}
	sets.engaged.Liberator.Acc.PDT.AM = {}
	sets.engaged.Liberator.FullAcc.PDT.AM = {}
	sets.engaged.Liberator.Fodder.PDT.AM = {}
	
	sets.engaged.Liberator.PDT.Adoulin.AM = {}
	sets.engaged.Liberator.SomeAcc.PDT.Adoulin.AM = {}
	sets.engaged.Liberator.Acc.PDT.Adoulin.AM = {}
	sets.engaged.Liberator.FullAcc.PDT.Adoulin.AM = {}
	sets.engaged.Liberator.Fodder.PDT.Adoulin.AM = {}
	
	sets.engaged.Liberator.MDT = {}
	sets.engaged.Liberator.SomeAcc.MDT = {}
	sets.engaged.Liberator.Acc.MDT = {}
	sets.engaged.Liberator.FullAcc.MDT = {}
	sets.engaged.Liberator.Fodder.MDT = {}
	
	sets.engaged.Liberator.MDT.Adoulin = {}
	sets.engaged.Liberator.SomeAcc.MDT.Adoulin = {}
	sets.engaged.Liberator.Acc.MDT.Adoulin = {}
	sets.engaged.Liberator.FullAcc.MDT.Adoulin = {}
	sets.engaged.Liberator.Fodder.MDT.Adoulin = {}
	
	sets.engaged.Liberator.MDT.AM = {}
	sets.engaged.Liberator.SomeAcc.MDT.AM = {}
	sets.engaged.Liberator.Acc.MDT.AM = {}
	sets.engaged.Liberator.FullAcc.MDT.AM = {}
	sets.engaged.Liberator.Fodder.MDT.AM = {}
	
	sets.engaged.Liberator.MDT.Adoulin.AM = {}
	sets.engaged.Liberator.SomeAcc.MDT.Adoulin.AM = {}
	sets.engaged.Liberator.Acc.MDT.Adoulin.AM = {}
	sets.engaged.Liberator.FullAcc.MDT.Adoulin.AM = {}
	sets.engaged.Liberator.Fodder.MDT.Adoulin.AM = {}
]]--
	--Extra Special Sets
	
	sets.buff.Souleater = {}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Vim Torque +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets

	
    end
	
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(2, 15)
    elseif player.sub_job == 'SAM' then
        set_macro_page(3, 15)
    elseif player.sub_job == 'DNC' then
        set_macro_page(4, 15)
    elseif player.sub_job == 'THF' then
        set_macro_page(1, 15)
    else
        set_macro_page(5, 15)
    end
end