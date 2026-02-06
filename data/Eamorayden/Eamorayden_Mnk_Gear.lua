function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc','FullAcc')
    state.WeaponskillMode:options('Match','PDL','Acc','Ngai')
    state.HybridMode:options('Normal','Meva','Ngai')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Godhands','Staff')

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None'}

    update_melee_groups()
	
gear.dex_jse_back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
gear.str_jse_back={name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}}
select_default_macro_book()
end
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Precast Sets
	
	-- Precast sets to enhance JAs on use
	sets.precast.JA['Hundred Fists'] = {legs="Hes. Hose"}
	sets.precast.JA['Boost'] = {}
	sets.precast.JA['Boost'].OutOfCombat = {ring1="Sljor Ring",neck="Justiciar's Torque"}
	sets.precast.JA['Dodge'] = {feet="Anch. Gaiters +4"}
	sets.precast.JA['Focus'] = {head="Anchor. Crown +1"}
	sets.precast.JA['Provoke']= {ring2="Supershear Ring",ring1="Eihwaz Ring",ear1="Cryptic Earring",ear2="Friomisi Earring",neck="Moonbeam necklace",ammo="Sapience Orb"}
--	sets.precast.JA['Counterstance'] = {} --feet="Hesychast's Gaiters +1"
	sets.precast.JA['Footwork'] = {feet="Bhikku Gaiters +2"}
--	sets.precast.JA['Formless Strikes'] = {body="Hesychast's Cyclas"}
--	sets.precast.JA['Mantra'] = {feet="Mel. Gaiters +2"} --feet="Hesychast's Gaiters +1"

sets.precast.JA['Chi Blast'] = {head="Hes. Crown"}
	
sets.precast.JA['Chakra'] = {head="Null Masque",neck="Unmoving Collar +1",ear1="Alabaster Earring",ear2="Tuisto Earring",hands="Hes. Gloves",body="Anch. Cyclas +2",ring1="Eihwaz Ring",ring2="Supershear Ring",waist="Plat. Mog. Belt",Legs="Nyame Flanchard",Feet="Nyame Sollerets"}



	-- Fast cast sets for spells
	
sets.precast.FC = {ammo="Sapience Orb",
		head="",neck="Baetyl Pendant",ear1="Etiolation Earring",ear2="Loquac. Earring",
		body=gear.TaeonFCBody,hands="Leyline Gloves",ring1="Naji's Loop",ring2="Prolix Ring",
		back="",waist="",legs="",feet=""}
	

--	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})

       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Coiste Bodhar", 
		head="Mpaca's Cap",neck="Fotia Gorget",ear1="Schere Earring",ear2="Sherida Earring",
		body="Mpaca's Doublet",hands="Mpaca's Gloves",ring1="Epona's Ring",ring2="Gere Ring",
		back=gear.str_jse_back,waist="Moonbow belt",legs="Mpaca's Hose",feet="Mpaca's Boots"}

	sets.precast.WS.PDL = {ammo="Coiste Bodhar",
		head="Mpaca's Cap",neck="Mnk. Nodowa +1",ear1="Schere Earring",ear2="Sherida Earring",
		body="Mpaca's Doublet",hands="Mpaca's Gloves",ring1="Epona's Ring",ring2="Gere Ring",
		back=gear.str_jse_back,waist="Moonbow belt",legs="Mpaca's Hose",feet="Mpaca's Boots"}	
	
	sets.precast.WS.Ngai={ammo="Coiste Bodhar",
		head="Mpaca's Cap",neck="Fotia Gorget",ear1="Schere Earring",ear2="Sherida Earring",
		body="Mpaca's Doublet",hands="Mpaca's Gloves",ring1="Epona's Ring",ring2="Gere Ring",
		back=gear.str_jse_back,waist="Moonbow belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}	
		

	sets.precast.WS.Acc=	set_combine(sets.precast.WS, {hands="Mummu Wrists +2",Neck="Mnk. Nodowa +1",back=gear.dex_jse_back}) 
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {hands="Gazu Bracelets +1",Neck="Mnk. Nodowa +1",back=gear.dex_jse_back})
	-- Specific weaponskill sets.

	sets.precast.WS['Raging Fists']    = set_combine(sets.precast.WS, {ear2="Moonshade Earring"})
	sets.precast.WS['Howling Fist']    = set_combine(sets.precast.WS, {ear2="Moonshade Earring"})
	sets.precast.WS['Asuran Fists']    = set_combine(sets.precast.WS, {body="Bhikku Cyclas +2",ring1="Sroda Ring",legs="Nyame Flanchard",feet="Nyame Sollerets",waist="Fotia Belt"})
	sets.precast.WS["Victory Smite"]   = set_combine(sets.precast.WS, {ear1="Odr Earring"})
	sets.precast.WS['Shijin Spiral']   = set_combine(sets.precast.WS, {back=gear.dex_jse_back})
	sets.precast.WS['Dragon Kick']     = set_combine(sets.precast.WS, {body="Bhikku Cyclas +2",ear2="Moonshade Earring"})
	sets.precast.WS['Tornado Kick']    = set_combine(sets.precast.WS, {ear2="Moonshade Earring"})
	sets.precast.WS['Shell Crusher'] = {ammo="Pemphredo Tathlum",
		head="Mpaca's Cap",neck="Null Loop",ear1="Moonshade Earring",ear2="Bhikku Earring +1",
		body="Bhikku Cyclas +2",hands="Mummu Wrists +2",ring1=gear.left_stinky,ring2=gear.right_stinky,
		back=gear.dex_jse_back,waist="Null Belt",legs="Bhikku Hose +2",feet="Anch. Gaiters +4"}
	
	sets.precast.WS["Raging Fists"].Acc = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WS.Acc,{ear2="Moonshade Earring"})
	sets.precast.WS["Howling Fist"].Acc = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WS.Acc,{ear2="Moonshade Earring"})
	sets.precast.WS["Asuran Fists"].Acc = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSAcc)
	sets.precast.WS["Victory Smite"].Acc = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WS.Acc, {ear1="Odr Earring"})
	sets.precast.WS["Shijin Spiral"].Acc = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WS.Acc,{head="Malignance Chapeau",body="Malignance Tabard"})
	sets.precast.WS["Dragon Kick"].Acc = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WS.Acc,{ear2="Moonshade Earring"})
	sets.precast.WS["Tornado Kick"].Acc = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WS.Acc,{ear2="Moonshade Earring"})

	sets.precast.WS["Raging Fists"].FullAcc = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WS.FullAcc,{ear2="Moonshade Earring"})
	sets.precast.WS["Howling Fist"].FullAcc = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WS.FullAcc,{ear2="Moonshade Earring"})
	sets.precast.WS["Asuran Fists"].FullAcc = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WS.FullAcc)
	sets.precast.WS["Victory Smite"].FullAcc = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WS.FullAcc, {})
	sets.precast.WS["Shijin Spiral"].FullAcc = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WS.FullAcc,{head="Malignance Chapeau",body="Malignance Tabard"})
	sets.precast.WS["Dragon Kick"].FullAcc = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WS.FullAcc,{ear2="Moonshade Earring"})
	sets.precast.WS["Tornado Kick"].FullAcc = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WS.FullAcc,{ear2="Moonshade Earring"})


	sets.precast.WS['Raging Fists'].Ngai    = set_combine(sets.precast.WS, {ear2="Moonshade Earring"})
	sets.precast.WS['Howling Fist'].Ngai   = set_combine(sets.precast.WS, {ear2="Moonshade Earring"})
	sets.precast.WS['Dragon Kick'].Ngai  = set_combine(sets.precast.WS, {ear2="Moonshade Earring"})
	sets.precast.WS['Tornado Kick'].Ngai   = set_combine(sets.precast.WS, {ear2="Moonshade Earring"})



--	sets.precast.WS['Cataclysm'] = {ammo="Ghastly Tathlum +1",
--		neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Crematio Earring",
--		hands="Malignance Gloves",ring1="Shiva Ring +1",
--		back="Toro Cape",legs="Nahtirah Trousers"}
	
--	 Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Schere Earring",ear2="Sherida Earring",}
--	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}
	
	-- Midcast Sets
--	sets.midcast.FastRecast = {ammo="Staunch Tathlum +1",
--		head=gear.herculean_fc_head,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
--		body="Dread Jupon",hands="Leyline Gloves",ring1="Murky Ring",ring2="Prolix Ring",
--		back="Moonlight Cape",waist="Moonbow belt",legs="Nyame Flanchard",feet="Hippo. Socks +1"}
		
--	-Specific spells
--	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {back="Mujin Mantle"})	
	-- Sets to return to when not performing an action.
	
	-- Resting sets
--	sets.resting = {body="Hesychast's Cyclas",ring2="Sheltered Ring"}
	

	-- Idle sets
	sets.idle = {ammo="Staunch Tathlum +1",
		head="Null Masque",neck="Elite Royal Collar",ear1="Infused Earring",ear2="Eabani Earring",
		body="Malignance Tabard",hands="Nyame Gauntlets",ring1="Murky Ring",ring2="Shneddick Ring",
		back="Null Shawl",waist="Null Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	-- Defense sets
	sets.defense.PDT = {ammo="Eluder's Sachet",
		head="Null Masque",neck="Loricate Torque +1",ear1="Tuisto Earring",ear2="Eabani Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Murky Ring",ring2="Shadow Ring",
		back="Shadow Mantle",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		

--	sets.Kiting = {ring1="Shneddick Ring"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee sets
	sets.engaged = {ammo="Coiste Bodhar", --1300 imp down 1293 imp up -- all engaged accs are /drg - like 10 or osme shit for other jobs 
		head="Bhikku Crown +2",neck="Mnk. Nodowa +1",ear1="Schere Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Gere Ring",
		back=gear.dex_jse_back,waist="Moonbow belt",legs="Bhikku Hose +2",feet="Malignance Boots"}

		sets.engaged.Acc = {ammo="Coiste Bodhar", --1343 imp down 1336 imp up 
		head="Bhikku Crown +2",neck="Mnk. Nodowa +1",ear1="Odr Earring",ear2="Bhikku Earring +1",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Gere Ring",
		back=gear.dex_jse_back,waist="Moonbow belt",legs="Bhikku Hose +2",feet="Malignance Boots"}

		sets.engaged.FullAcc ={ammo="Coiste Bodhar", --1390 imp down 1383 imp up
		head="Malignance Chapeau",neck="Mnk. Nodowa +1",ear1="Odr Earring",ear2="Bhikku Earring +1",
		body="Malignance Tabard",hands="Gazu Bracelets +1",ring1="Murky Ring",ring2="Chirich Ring +1",
		back=gear.dex_jse_back,waist="Moonbow belt",legs="Bhikku Hose +2",feet="Malignance Boots"}
	-- Defensive melee hybrid sets
sets.engaged.Meva = {ammo="Coiste Bodhar", --1284 imp down 1277 imp up 
		head="Bhikku Crown +2",neck="Mnk. Nodowa +1",ear1="Schere Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Gere Ring",
		back="Null Shawl",waist="Moonbow belt",legs="Bhikku Hose +2",feet="Malignance Boots"}	

	sets.engaged.Ngai= {ammo="Coiste Bodhar", 
		head="Bhikku Crown +2",neck="Warder's Charm +1",ear1="Schere Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Mpaca's Gloves",ring1="Shadow Ring",ring2="Gere Ring",
		back=gear.dex_jse_back,waist="Moonbow belt",legs="Bhikku Hose +2",feet="Nyame Sollerets"}	
	-- Hundred Fists/Impetus melee set mods
	
	sets.engaged.HF = set_combine(sets.engaged, {})
	sets.engaged.Acc.HF = set_combine(sets.engaged.Acc, {})
	sets.engaged.FullAcc.HF = set_combine(sets.engaged.FullAcc, {})

	sets.buff.Doom = set_combine(sets.buff.Doom, {})
--	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.buff.Impetus = {body="Bhikku Cyclas +2"}
    sets.buff.impetusWS= {body="Bhikku Cyclas +2"}
	sets.buff.Footwork = {feet="Anch. Gaiters +4"}
	sets.buff.FootworkWS = {neck="Monk's nodowa +1",feet="Anch. Gaiters +4"}
	sets.buff.Boost = {waist="Ask Sash"}
--	sets.DayIdle = {}
--	sets.NightIdle = {}
--   sets.Knockback = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.Phalanx_Received={head="Taeon Chapeau",body=gear.TaeonPhalanxBody,hands="Taeon Gloves",legs="Taeon Tights",feet="Taeon Boots"}
--	sets.Skillchain = {legs="Ryuo Hakama"}
	
	-- Weapons sets
	sets.weapons.Godhands = {main="Godhands"}
--	sets.weapons.Barehanded = {main=empty}
	sets.weapons.Staff = {main="Xoanon",sub=""}
--	sets.weapons.ProcStaff = {main="Erudite's Staff"}
--	sets.weapons.ProcClub = {main="Mafic Cudgel"}
--	sets.weapons.ProcSword = {main="Kyukoto",sub=empty}
--	sets.weapons.ProcGreatSword = {main="Lament",sub=empty}
--	sets.weapons.ProcScythe = {main="Hoe",sub=empty}
--	sets.weapons.ProcPolearm = {main="Pitchfork +1",sub=empty}
--	sets.weapons.ProcGreatKatana = {main="Hardwood Katana",sub=empty}
end

-- Select default macro book on initial load or subjob change.
--function select_default_macro_book()
	-- Default macro set/book
function select_default_macro_book()	
	 if player.sub_job == 'WAR' then
        set_macro_page(1, 1)
    elseif player.sub_job =='DRG' then
        set_macro_page(3, 1)
	else 
	set_macro_page(1, 1)
    end

	
function user_job_lockstyle()
	windower.chat.input('/lockstyleset 006')
end
end