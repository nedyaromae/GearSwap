function user_job_setup()
	-- Options: Override default values
	state.OffenseMode:options('Normal','FullAcc')
	state.Weapons:options('Naegling','Loxotic','Gaxe','ShiningOne','Aspis')
	state.WeaponskillMode:options('Normal','PDL')
	state.HybridMode:options('Normal','Meva')
	state.UnlockWeapons = M(true, 'Unlock Weapons')

	gear.da_jse_back = {name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.wsd_jse_back ={name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}}
	gear.critrate_jse_back={name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Crit.hit rate+10','Damage taken-5%',}}
	gear.vit_wsd_jse_back={name="Cichol's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Damage taken-5%',}}

	--Ikenga_axe_bonus = 300  -- It is 300 at R25. Uncomment if you need to manually adjust because you are using below R25 or above
	
	select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	-- Precast Sets
	
    sets.Enmity = {ammo="Sapience Orb",
		head="Pummeler's Mask +2",neck="Moonbeam Necklace",ear1="Cryptic Earring",ear2="Friomisi Earring",
		body="Souv. Cuirass +1",hands="Pumm. Mufflers +2",ring1="Apeile Ring +1",ring2="Eihwaz Ring",
		back=gear.vit_wsd_jse_back,waist="Flume Belt",legs="Souv. Diechlings +1",feet="Eschite Greaves"}
	sets.Knockback = {}
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Berserk'] = {body="Pumm. Lorica +4",feet="Agoge Calligae +1",back="Cichol's Mantle"}
	sets.precast.JA['Berserk'].OutOfCombat={main="Naegling",sub="Diamond Aspis",body="Pumm. Lorica +4",feet="Agoge Calligae +1",back="Cichol's Mantle"}
	sets.precast.JA['Warcry'] = {head="Agoge Mask +4"}
	sets.precast.JA['Warcry'].OutOfCombat = {main="Naegling",sub="Diamond Aspis",head="Agoge Mask +4"}
	sets.precast.JA['Defender'] = {}
	sets.precast.JA['Aggressor'] = {head="Pummeler's Mask +2"}
	sets.precast.JA['Aggressor'].OutOfCombat = {main="Naegling",sub="Diamond Aspis",head="Pummeler's Mask +2"}
	sets.precast.JA['Mighty Strikes'] = {hands="Agoge Mufflers"}
	sets.precast.JA["Warrior's Charge"] = {}
	sets.precast.JA['Tomahawk'] = {ammo="Thr. Tomahawk",feet="Agoge Calligae +1"}
	sets.precast.JA['Retaliation'] = {}
	sets.precast.JA['Retaliation'].OutOfCombat={main="Naegling",sub="Diamond Aspis"}
	sets.precast.JA['Restraint'] = {}
	sets.precast.JA['Restraint'].OutOfCombat={main="Naegling",sub="Diamond Aspis"}
	sets.precast.JA['Blood Rage'] = {body="Boii Lorica +2"}
	sets.precast.JA['Blood Rage'].OutOfCombat = {main="Naegling",sub="Diamond Aspis",body="Boii Lorica +2"}
	sets.precast.JA['Brazen Rush'] = {}
	sets.precast.JA['Meditate']={}
	sets.precast.JA['Provoke'] = set_combine(sets.Enmity,{})
                   
		   
	-- Fast cast sets for spells

	sets.precast.FC = {ammo="Sapience Orb",
		head="Sakpata's Helm",neck="Baetyl Pendant",ear1="Etiolation Earring",ear2="Loquac. Earring",
		body="",hands="Leyline Gloves",ring1="Naji's Loop",ring2="Lebeche Ring",
		back="",waist="",legs="",feet="Odyssean Greaves"}
	

	-- Midcast Sets
	sets.midcast.FastRecast = set_combine(sets.precast.FC,{})
                   
	sets.midcast.Cure = {}
	
						                   
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Knobkierrie",
		head="Agoge Mask +4",neck="War. Beads +1",ear1="Moonshade Earring",ear2="Thrud Earring",
		body="Pumm. Lorica +4",hands="Boii Mufflers +2",ring1="Sroda Ring",ring2="Cornelia's Ring",
		back=gear.wsd_jse_back,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.precast.WS.PDL={ammo="Knobkierrie",
		head="Agoge Mask +4",neck="War. Beads +1",ear1="Moonshade Earring",ear2="Thrud Earring",
		body="Pumm. Lorica +4",hands="Sakpata's Gauntlets",ring1="Sroda Ring",ring2="Cornelia's Ring",
		back=gear.wsd_jse_back,waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Nyame Sollerets"}
		
	sets.precast.WS.FullAcc=set_combine(sets.precast.WS,{})


    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.	
    sets.precast.WS['Savage Blade'] =set_combine(sets.precast.WS,{})
    sets.precast.WS['Savage Blade'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})


	sets.precast.WS['Judgment']=set_combine(sets.precast.WS['Savage Blade'],{})
	sets.precast.WS['Black Halo']=set_combine(sets.precast.WS['Savage Blade'],{})
	
	sets.precast.WS['Red Lotus Blade']=set_combine(sets.precast.WS['Savage Blade'], {head="Nyame Helm",Body="Nyame Mail",hands="Nyame Gauntlets",feet="Nyame Sollerets",waist="Eschan Stone"})
	sets.precast.WS['Fell Cleave']=set_combine(sets.precast.WS['Savage Blade'],{ear1="Schere Earring"})
	
    sets.precast.WS['Upheaval'] = set_combine(sets.precast.WS, {back=gear.vit_wsd_jse_back})
    sets.precast.WS['Upheaval'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Upheaval'].PDL=set_combine(sets.precast.WS.PDL, {back=gear.vit_wsd_jse_back,ammo="Crepuscular Pebble"})
     
    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Resolution'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	
    sets.precast.WS['Ruinator'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Ruinator'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	
    sets.precast.WS['Rampage'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Rampage'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	
    sets.precast.WS['Raging Rush'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Raging Rush'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	
    sets.precast.WS["Ukko's Fury"] = set_combine(sets.precast.WS, {head="Boii Mask +2",hands="Flam. Manopolas +2",ear1="Schere Earring",ear2="Boii Earring +1",ammo="Yetshila +1",back=gear.critrate_jse_back})
    sets.precast.WS["Ukko's Fury"].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	
    sets.precast.WS["King's Justice"] = set_combine(sets.precast.WS, {})
    sets.precast.WS["King's Justice"].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	

	sets.precast.WS["Burning Blade"]={ammo="Coiste Bodhar",
		head="Null Masque",neck="Lissome Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Boii Lorica +2",hands="Sakpata's Gauntlets",ring1="Chirich Ring +1",ring2="Chirich Ring",
		back="Solemnity Cape",waist="Null Belt",legs="Sakpata's Cuisses",feet="Pumm. Calligae +4"}

	sets.precast.WS["Flat Blade"]=set_combine(sets.precast.WS["Burning Blade"],{})


	sets.precast.WS["Impulse Drive"] =set_combine(sets.precast.WS, {ammo="Yetshila +1",back=gear.critrate_jse_back,ear2="Boii Earring +1"})

	sets.precast.WS["Stardiver"] = set_combine(sets.precast.WS, {head="Boii Mask +2",hands="Flam. Manopolas +2",ear1="Schere Earring",ear2="Boii Earring +1",ammo="Yetshila +1",back=gear.critrate_jse_back,neck="Fotia Gorget"})

	sets.precast.WS["Requiescat"] =set_combine(sets.precast.WS, {legs="Sakpata's Cuisses",feet="Sakpata's Leggings",ear1="Schere Earring",ear2="Boii Earring +1",neck="Fotia Gorget",ammo="Coiste Bodhar",back=gear.da_jse_back,ring1="Petrov Ring"})
	
	sets.precast.WS["Armor Break"]={ammo="Pemphredo Tathlum",
		head="Boii Masque +2",neck="Null Loop",ear1="Crep. Earring",ear2="Boii Earring +1",
		body="Pumm. Lorica +4",hands="Boii Mufflers +2",ring1="Metamor. Ring +1",ring2=gear.right_stinky,
		back="Null shawl",waist="Null Belt",legs="Pumm. Cuisses +4",feet="Pumm. Calligae +4"}
	sets.precast.WS["Full Break"]=set_combine(sets.precast.WS["Armor Break"],{})
	sets.precast.WS["Weapon Break"]=set_combine(sets.precast.WS["Armor Break"],{})
	sets.precast.WS["Shield Break"]=set_combine(sets.precast.WS["Armor Break"],{})
	sets.precast.WS["Shockwave"]=set_combine(sets.precast.WS["Armor Break"],{})
	sets.precast.WS["Raiden Thrust"]= {ammo="Knobkierrie",
		head="Nyame Helm",neck="Sibyl Scarf",ear1="Moonshade Earring",ear2="Thrud Earring",
		body="Nyame Flanchard",hands="Nyame Gauntlets",ring1="Sroda Ring",ring2="Cornelia's Ring",
		back=gear.wsd_jse_back,waist="Eschan Stone",legs="Nyame Flanchard",feet="Nyame Sollerets"}


		sets.precast.WS["Cataclysm"]={ammo="Knobkierrie",
		head="Pixie Hairpin +1",neck="Baetyl Pendant",ear1="Moonshade Earring",ear2="Friomisi Earring",
		body="Nyame Flanchard",hands="Nyame Gauntlets",ring1="Sroda Ring",ring2="Cornelia's Ring",
		back=gear.wsd_jse_back,waist="Eschan Stone",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Cessance Earring",ear2="Boii Earring +1",}
	sets.AccMaxTP = {ear1="Cessance Earring",ear2="Boii Earring +1"}
	
	--Specialty WS set overwrites.
	sets.AccWSMightyCharge = {ammo="Yetshila +1"}
	sets.AccWSCharge = {ammo="Yetshila +1"}
	sets.AccWSMightyCharge = {ammo="Yetshila +1"}
	sets.WSMightyCharge = {ammo="Yetshila +1"}
	sets.WSCharge = {ammo="Yetshila +1"}
	sets.WSMighty = {ammo="Yetshila +1"}

     -- Sets to return to when not performing an action.
           
     -- Resting sets
     sets.resting = {}
           
	-- Idle sets
	sets.idle = {ammo="Staunch Tathlum +1",
		head="Null Masque",neck="Elite Royal Collar",ear1="Infused Earring",ear2="Eabani Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Chirich Ring +1",ring2="Shneddick Ring",
		back="Null Shawl",waist="Null Belt",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
		
	
	-- Defense sets
	sets.defense.PDT = {ammo="Eluder's Sachet",
		head="Sakpata's Helm",neck="Loricate Torque +1",ear1="Tuisto Earring",ear2="Eabani Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Shadow Ring",ring2="Murky Ring",
		back="Shadow Mantle",waist="Carrier's Sash",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
		

	sets.midcast.Warp=	{ammo="Staunch Tathlum +1",
		head="Souv. Schaller +1",neck="Loricate Torque +1",ear1="Meili Earring",ear2="Eabani Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Defending Ring",ring2="Murky Ring",
		back="Shadow Mantle",waist="Audumbla Sash",legs="Founder's Hose",feet="Odyssean Greaves"}

	sets.midcast.Escape=set_combine(sets.midcast.Warp,{})
	

--	sets.Kiting = {ring1="Shneddick Ring"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
--	sets.buff.Sleep = {head="Frenzy Sallet"}
     
            -- Engaged sets
	sets.engaged = {ammo="Coiste Bodhar", --1297 naegling 1298 loxotic 1348 lycurgos 1301 shining one
		head="Boii Mask +2",neck="War. Beads +1",ear1="Schere Earring",ear2="Boii Earring +1",
		body="Boii Lorica +2",hands="Sakpata's Gauntlets",ring1="Chirich Ring +1",ring2="Chirich Ring",
		back=gear.da_jse_back,waist="Ioskeha Belt +1",legs="Sakpata's Cuisses",feet="Pumm. Calligae +4"}
		
		
	sets.engaged.FullAcc={ammo="Coiste Bodhar", --1392 lycurgos 1341 naegling 1342 loxotic 1345 shining one
		head="Boii Mask +2",neck="War. Beads +1",ear1="Cessance Earring",ear2="Boii Earring +1",
		body="Boii Lorica +2",hands="Sakpata's Gauntlets",ring1="Chirich Ring +1",ring2="Chirich Ring",
		back=gear.da_jse_back,waist="Ioskeha Belt +1",legs="Pumm. Cuisses +4",feet="Pumm. Calligae +4"}


	sets.engaged.Aspis= {ammo="Coiste Bodhar", 
		head="Boii Mask +2",neck="Lissome Necklace",ear1="Schere Earring",ear2="Boii Earring +1",
		body="Boii Lorica +2",hands="Sakpata's Gauntlets",ring1="Chirich Ring +1",ring2="Chirich Ring",
		back=gear.da_jse_back,waist="Ioskeha Belt +1",legs="Pumm. Cuisses +4",feet="Pumm. Calligae +4"}
		

		
	sets.engaged.Meva= {ammo="Coiste Bodhar", 
		head="Sakpata's Helm",neck="War. Beads +1",ear1="Schere Earring",ear2="Boii Earring +1",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Chirich Ring +1",ring2="Chirich Ring",
		back="Null Shawl",waist="Ioskeha Belt +1",legs="Sakpata's Cuisses",feet="Pumm. Calligae +4"}

	
    


	

	
            -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
            -- sets if more refined versions aren't defined.
            -- If you create a set with both offense and defense modes, the offense mode should be first.
            -- EG: sets.engaged.Dagger.Accuracy.Evasion

	
	--Extra Special Sets
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Retaliation = {}
	sets.buff.Sleep= {neck="Vim Torque"}
	sets.buff.Restraint = {}
	sets.Phalanx_Received = {head="Odyssean Helm",body="Yorium Cuirass",hands="Souv. Handsch. +1",legs="Sakpata's leggings",feet="Souveran Schuhs +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {head=gear.valorousTH})
	sets.Refresh_Received ={waist="Gishdubar Sash"}
	
	-- Weapons sets
	sets.weapons.Naegling= {main="Naegling", sub="Blurred shield +1"}
	sets.weapons.Loxotic= {main="Loxotic mace +1", sub="Blurred shield +1"}
	sets.weapons.ShiningOne= {main="Shining One", sub="Utu Grip"}
	sets.weapons.Gaxe = {main="Lycurgos", sub="Utu Grip"}
	sets.weapons.Aspis={main="Naegling", sub="Diamond Aspis"}
	sets.weapons.Staff={main="Kaja Staff",sub="Utu Grip"}

end
	
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DRG' then
        set_macro_page(1, 4)
    elseif player.sub_job =='SAM' then
        set_macro_page(3, 4)
	else 
	set_macro_page(1, 4)
    end
	end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 011')
	end

function job_post_precast(spell, spellMap, eventArgs)
	if spell.type == 'WeaponSkill' then

		local WSset = standardize_set(get_precast_set(spell, spellMap))
		local wsacc = check_ws_acc()
		
		if (WSset.ear1 == "Moonshade Earring" or WSset.ear2 == "Moonshade Earring") then
			-- Replace Moonshade Earring if we're at cap TP
			if get_effective_player_tp(spell, WSset) > 3200 then
				if wsacc:contains('Acc') and not state.Buff['Sneak Attack'] and sets.AccMaxTP then
					local AccMaxTPset = standardize_set(sets.AccMaxTP)

					if (AccMaxTPset.ear1:startswith("Lugra Earring") or AccMaxTPset.ear2:startswith("Lugra Earring")) and not classes.DuskToDawn and sets.AccDayMaxTPWSEars then
						equip(sets.AccDayMaxTPWSEars[spell.english] or sets.AccDayMaxTPWSEars)
					else
						equip(sets.AccMaxTP[spell.english] or sets.AccMaxTP)
					end
				elseif sets.MaxTP then
					local MaxTPset = standardize_set(sets.MaxTP)
					if (MaxTPset.ear1:startswith("Lugra Earring") or MaxTPset.ear2:startswith("Lugra Earring")) and not classes.DuskToDawn and sets.DayMaxTPWSEars then
						equip(sets.DayMaxTPWSEars[spell.english] or sets.DayMaxTPWSEars)
					else
						equip(sets.MaxTP[spell.english] or sets.MaxTP)
					end
				else
				end
			else
				if wsacc:contains('Acc') and not state.Buff['Sneak Attack'] and (WSset.ear1:startswith("Lugra Earring") or WSset.ear2:startswith("Lugra Earring")) and not classes.DuskToDawn and sets.AccDayWSEars then
					equip(sets.AccDayWSEars[spell.english] or sets.AccDayWSEars)
				elseif (WSset.ear1:startswith("Lugra Earring") or WSset.ear2:startswith("Lugra Earring")) and not classes.DuskToDawn and sets.DayWSEars then
					equip(sets.DayWSEars[spell.english] or sets.DayWSEars)
				end
			end
		elseif (WSset.ear1:startswith("Lugra Earring") or WSset.ear2:startswith("Lugra Earring")) and not classes.DuskToDawn then
			if wsacc:contains('Acc') and not state.Buff['Sneak Attack'] and sets.AccDayWSEars then
				equip(sets.AccDayWSEars[spell.english] or sets.AccDayWSEars)
			elseif sets.DayWSEars then
				equip(sets.DayWSEars[spell.english] or sets.DayWSEars)
			end
		end
		
		if wsacc:contains('Acc') and not state.Buff['Sneak Attack'] then
			if state.Buff.Charge and state.Buff['Mighty Strikes'] and sets.ACCWSMightyCharge then
				equip(sets.ACCWSMightyCharge)
			elseif state.Buff.Charge and sets.ACCWSCharge then
				equip(sets.ACCWSCharge)
			elseif state.Buff['Mighty Strikes'] and sets.ACCWSMighty then
				equip(sets.AccWSMighty)
			end
		else
			if state.Buff.Charge and state.Buff['Mighty Strikes'] and sets.WSMightyCharge then
				equip(sets.WSMightyCharge)
			elseif state.Buff.Charge and sets.WSCharge then
				equip(sets.WSCharge)
			elseif state.Buff['Mighty Strikes'] and sets.WSMighty then
				equip(sets.WSMighty)
			end
		end
		elseif spell.english == 'Berserk' and not (in_combat or player.status == 'Engaged') and sets.precast.JA['Berserk'].OutOfCombat then   equip(sets.precast.JA['Berserk'].OutOfCombat) 
		elseif spell.english == 'Warcry' and not (in_combat or player.status == 'Engaged') and sets.precast.JA['Warcry'].OutOfCombat then   equip(sets.precast.JA['Warcry'].OutOfCombat)   
		elseif spell.english == 'Blood Rage' and not (in_combat or player.status == 'Engaged') and sets.precast.JA['Blood Rage'].OutOfCombat then   equip(sets.precast.JA['Blood Rage'].OutOfCombat)  
		elseif spell.english == 'Restraint' and not (in_combat or player.status == 'Engaged') and sets.precast.JA['Restraint'].OutOfCombat then   equip(sets.precast.JA['Restraint'].OutOfCombat)   
		elseif spell.english == 'Aggressor' and not (in_combat or player.status == 'Engaged') and sets.precast.JA['Aggressor'].OutOfCombat then   equip(sets.precast.JA['Aggressor'].OutOfCombat) 
		elseif spell.english == 'Retaliation' and not (in_combat or player.status == 'Engaged') and sets.precast.JA['Retaliation'].OutOfCombat then   equip(sets.precast.JA['Retaliation'].OutOfCombat)


					
	end

	end