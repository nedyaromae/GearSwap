function user_job_setup()
	state.OffenseMode:options('Normal')
	state.HybridMode:options('KalungaBS','Normal')
	state.WeaponskillMode:options('Match','Normal')
	state.CastingMode:options('Normal')
	state.IdleMode:options('Normal','Reraise')
	state.RestingMode:options('Normal')
	state.PhysicalDefenseMode:options()
	state.MagicalDefenseMode:options()
	state.ResistDefenseMode:options()
	state.Weapons:options('None','Agwu','Ikengas')

	-- Set up Jug Pet cycling 
	-- INPUT PREFERRED JUG PETS HERE
	state.JugMode = M{['description']='Jug Mode','GenerousArthur','FatsoFargann','ScissorlegXerin','BlackbeardRandy','AttentiveIbuki','DroopyDortwin','WarlikePatrick','AcuexFamiliar'}
	

	-- Set up Monster Correlation Modes 
	state.CorrelationMode = M{['description']='Correlation Mode', 'Neutral', 'Favorable'}
	

	-- Set up Pet Modes for Hybrid sets 
	state.PetMode = M{['description']='Pet Mode','Tank','DD'}


	-- Set up Reward Modes 
	state.RewardMode = M{['description']='Reward Mode', 'Theta', 'Zeta', 'Eta'}
	

	
	--Example of how to change default ready moves.
	--ready_moves.default.WarlikePatrick = 'Tail Blow'


	--Ikenga_axe_bonus = 300  -- It is 300 at R25. Uncomment if you need to manually adjust because you are using below R25 or above

--	select_default_macro_book()
end

-- BST gearsets
function init_gear_sets()
	-- PRECAST SETS
	sets.precast.JA['Killer Instinct'] = {} --head="Ankusa Helm +1"
	sets.precast.JA['Bestial Loyalty'] = {}
	sets.precast.JA['Call Beast'] = sets.precast.JA['Bestial Loyalty']
	sets.precast.JA.Familiar = {}
	sets.precast.JA.Tame = {}
	sets.precast.JA.Spur = {back="Artio's Mantle"}
	sets.precast.JA['Feral Howl'] = {}

	sets.precast.JA.Reward = {ammo="Staunch Tathlum +1",
		head="Null Masque",neck="Loricate Torque +1",ear1="Alabaster Earring",ear2="Nukumi Earring +1",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1=gear.left_stinky,ring2=gear.right_stinky,
		back="Artio's Mantle",waist="Incarnation Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.precast.JA.Reward.Theta = set_combine(sets.precast.JA.Reward, {ammo="Pet Food Theta"})
	sets.precast.JA.Reward.Zeta = set_combine(sets.precast.JA.Reward, {ammo="Pet Food Zeta"})
	sets.precast.JA.Reward.Eta = set_combine(sets.precast.JA.Reward, {ammo="Pet Food Eta"})
	
	sets.RewardAxe = {}
	sets.RewardAxesDW = {}

	sets.precast.JA.Charm = {}
	sets.Phalanx_Received={head="Taeon Chapeau",body=gear.TaeonPhalanxBody,hands="Taeon Gloves",legs="Taeon Tights",feet="Taeon Boots"}

	sets.precast.FC = {ammo="Sapience Orb",
        head="",neck="Baetyl Pendant",ear1="Etiolation Earring",ear2="Loquac. Earring",
        body=gear.TaeonFCBody,hands="Leyline Gloves",ring1="Naji's Loop",ring2="Prolix Ring",
        back="",waist="Null Belt",legs="",feet=""}

		-- WEAPONSKILLS
		-- Default weaponskill sets.
	sets.precast.WS ={ammo="Coiste Bodhar",
		head="Nyame Helm",neck="Rep. Plat. Medal",ear1="Moonshade Earring",ear2="Thrud Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",ring2="Cornelia's Ring",
        back="Null Shawl",waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}


	-- Specific weaponskill sets.
	sets.precast.WS['Ruinator'] = set_combine(sets.precast.WS, {})

	sets.precast.WS['Onslaught'] = set_combine(sets.precast.WS, {})

	sets.precast.WS['Primal Rend'] = set_combine(sets.precast.WS, {})

	sets.precast.WS['Cloudsplitter'] = set_combine(sets.precast.WS['Primal Rend'], {})

		-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}

				-- PET SIC & READY MOVES
--	sets.midcast.Pet.WS = {main=gear.PHYKumbha1,sub=gear.PHYKumbha2,ammo="Voluspa Tathlum",
--		head="Totemic Helm +1",neck="Shulmanu Collar",ear1="Enmerkar Earring",ear2="Domesticator's Earring",
--		body=gear.taeon_pet_body,hands="Nukumi Manoplas +1",ring1="Varar Ring +1",ring2="C. Palug Ring",
--		back="Artio's Mantle",waist="Incarnation Sash",legs=gear.valorous_physical_pet_legs,feet="Totemic Gaiters +1"}

	sets.midcast.Pet.DebuffReady = {main="Agwu's Axe",sub="Diamond Aspis",ammo="Hesperiidae",
		head="Nyame Helm",neck="Adad Amulet",ear1="Alabaster Earring",ear2="Nukumi Earring +1",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Tali'ah Ring",ring2="Murky Ring",
		back="Artio's Mantle",waist="Incarnation Sash",legs="Nyame Flanchard",feet="Gleti's Boots"}
				
	sets.midcast.Pet.MagicReady = set_combine(sets.midcast.Pet.DebuffReady, {})
		
	sets.midcast.Pet.PhysicalDebuffReady = set_combine(sets.midcast.Pet.DebuffReady, {})

	sets.midcast.Pet.ReadyRecast = {legs="Gleti's Breeches"}
	sets.midcast.Pet.ReadyRecastDW = {legs="Gleti's Breeches"}
	sets.midcast.Pet.Neutral = {}
	sets.midcast.Pet.Favorable = {}
	sets.midcast.Pet.TPBonus = set_combine(sets.midcast.Pet.DebuffReady, {})


	-- RESTING
	sets.resting = {}

	sets.idle = {ammo="Staunch Tathlum +1",
		head="Null Masque",neck="Warder's Charm +1",ear1="Night Earring",ear2="Eabani Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Shneddick Ring",ring2="Murky Ring",
        back="Null Shawl",waist="Null Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
	sets.idle.Reraise = set_combine(sets.idle, {head="Crepuscular Helm",body="Twilight Mail"})
	sets.idle.Weak= set_combine(sets.idle, {head="Crepuscular Helm",body="Twilight Mail"})

--	sets.idle.Pet = {ammo="Voluspa Tathlum",
--		head="Anwig Salade",neck="Loricate Torque +1",ear1="Enmerkar Earring",ear2="Handler's Earring +1",
--		body="Tot. Jackcoat +3",hands="Ankusa Gloves +1",ring1="Defending Ring",ring2="C. Palug Ring",
--		back="Artio's Mantle",waist="Isa Belt",legs="Tali'ah Sera. +2",feet="Ankusa Gaiters +3"}
--
--	sets.idle.Pet.Engaged = {ammo="Voluspa Tathlum",
--		head="Anwig Salade",neck="Shulmanu Collar",ear1="Enmerkar Earring",ear2="Handler's Earring +1",
--		body="Tot. Jackcoat +3",hands="Gleti's Gauntlets",ring1="Defending Ring",ring2="C. Palug Ring",
--		back="Artio's Mantle",waist="Isa Belt",legs="Tali'ah Sera. +2",feet="Ankusa Gaiters +3"}

--	sets.idle.Pet.Engaged.DW = {ammo="Voluspa Tathlum",
--		head="Anwig Salade",neck="Shulmanu Collar",ear1="Enmerkar Earring",ear2="Handler's Earring +1",
--		body="Tot. Jackcoat +3",hands="Ankusa Gloves +1",ring1="Defending Ring",ring2="C. Palug Ring",
--		back="Artio's Mantle",waist="Isa Belt",legs="Tali'ah Sera. +2",feet="Ankusa Gaiters +3"}

	-- DEFENSE SETS
	sets.defense.PDT = {ammo="Crepuscular Pebble",
		head="Null Masque",neck="Warder's Charm +1",ear1="Night Earring",ear2="Eabani Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Shadow Ring",ring2="Murky Ring",
        back="Shadow Mantle",waist="Null Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

--	sets.defense.PetPDT = {ammo="Voluspa Tathlum",
--		head="Anwig Salade",neck="Loricate Torque +1",ear1="Enmerkar Earring",ear2="Handler's Earring +1",
--		body="Tot. Jackcoat +3",hands="Ankusa Gloves +1",ring1="Defending Ring",ring2="C. Palug Ring",
--		back="Pastoralist's Mantle",waist="Isa Belt",legs="Tali'ah Sera. +2",feet="Ankusa Gaiters +3"}

--	sets.defense.PetMDT = {ammo="Voluspa Tathlum",
--		head="Anwig Salade",neck="Loricate Torque +1",ear1="Enmerkar Earring",ear2="Handler's Earring +1",
--		body="Tot. Jackcoat +3",hands="Ankusa Gloves +1",ring1="Defending Ring",ring2="C. Palug Ring",
--		back="Pastoralist's Mantle",waist="Isa Belt",legs="Tali'ah Sera. +2",feet="Ankusa Gaiters +3"}

--	sets.defense.PetMEVA = sets.defense.PetMDT

--	sets.defense.PKiller = set_combine(sets.defense.PDT, {body="Nukumi Gausape +1"})
--	sets.defense.Reraise = set_combine(sets.defense.PDT, {head="Crepuscular Helm",body="Twilight Mail"})

	sets.defense.MDT = {ammo="Crepuscular Pebble",
		head="Null Masque",neck="Warder's Charm +1",ear1="Night Earring",ear2="Eabani Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Shadow Ring",ring2="Murky Ring",
        back="Null Shawl",waist="Null Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.defense.MEVA = sets.defense.MDT

	sets.DayIdle = {}
	sets.NightIdle = {}

	-- MELEE (SINGLE-WIELD) SETS
	sets.engaged = {ammo="Coiste Bodhar",
		head="Malignance Chapeau",neck="Lissome Necklace",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Petrov Ring",ring2="Epona's Ring",
		back="Null Shawl",waist="Sailfi Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

	sets.engaged.KalungaBS={ammo="Crepuscular Pebble",
		head="Null Masque",neck="Warder's Charm +1",ear1="Night Earring",ear2="Eabani Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Shadow Ring",ring2="Murky Ring",
        back="Null Shawl",waist="Null Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	
	-- MELEE (DUAL-WIELD) SETS FOR DNC AND NIN SUBJOB
	sets.engaged.DW = {ammo="Coiste Bodhar",
		head="Malignance Chapeau",neck="Lissome Necklace",ear1="Brutal Earring",ear2="Eabani Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Petrov Ring",
		back="Null Shawl",waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}


	sets.buff['Killer Instinct'] = {}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.Knockback = {}

	
	-- Weapons sets
--	sets.weapons.PetPDTAxe = {main ="Izizoeksi"}
--	sets.weapons.DualWeapons = {main ="Izizoeksi",sub="Hunahpu"}
	sets.weapons.Agwu={Main="Agwu's Axe",sub="Diamond Aspis"}
	sets.weapons.Ikengas={main="Ikenga's Axe",sub="Diamond Aspis"}
	sets.weapons.Naegling={main="Naegling",sub="Diamond Aspis"}


-------------------------------------------------------------------------------------------------------------------
-- Complete Lvl 76-99 Jug Pet Precast List +Funguar +Courier +Amigo
-------------------------------------------------------------------------------------------------------------------

	sets.precast.JA['Bestial Loyalty'].FunguarFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Seedbed Soil"})
	sets.precast.JA['Bestial Loyalty'].CourierCarrie = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Fish Oil Broth"})
	sets.precast.JA['Bestial Loyalty'].AmigoSabotender = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Sun Water"})
	sets.precast.JA['Bestial Loyalty'].NurseryNazuna = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="D. Herbal Broth"})
	sets.precast.JA['Bestial Loyalty'].CraftyClyvonne = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Cng. Brain Broth"})
	sets.precast.JA['Bestial Loyalty'].PrestoJulio = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="C. Grass. Broth"})
	sets.precast.JA['Bestial Loyalty'].SwiftSieghard = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Mlw. Bird Broth"})
	sets.precast.JA['Bestial Loyalty'].MailbusterCetas = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Gob. Bug Broth"})
	sets.precast.JA['Bestial Loyalty'].AudaciousAnna = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="B. Carrion Broth"})
	sets.precast.JA['Bestial Loyalty'].TurbidToloi = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Auroral Broth"})
	sets.precast.JA['Bestial Loyalty'].LuckyLulush = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="L. Carrot Broth"})
	sets.precast.JA['Bestial Loyalty'].DipperYuly = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Wool Grease"})
	sets.precast.JA['Bestial Loyalty'].FlowerpotMerle = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Vermihumus"})
	sets.precast.JA['Bestial Loyalty'].DapperMac = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Briny Broth"})
	sets.precast.JA['Bestial Loyalty'].DiscreetLouise = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Deepbed Soil"})
	sets.precast.JA['Bestial Loyalty'].FatsoFargann = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="C. Plasma Broth"})
	sets.precast.JA['Bestial Loyalty'].FaithfulFalcorr = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Lucky Broth"})
	sets.precast.JA['Bestial Loyalty'].BugeyedBroncha = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Svg. Mole Broth"})
	sets.precast.JA['Bestial Loyalty'].BloodclawShasra = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Rzr. Brain Broth"})
	sets.precast.JA['Bestial Loyalty'].GorefangHobs = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="B. Carrion Broth"})
	sets.precast.JA['Bestial Loyalty'].GooeyGerard = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Cl. Wheat Broth"})
	sets.precast.JA['Bestial Loyalty'].CrudeRaphie = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Shadowy Broth"})

	-------------------------------------------------------------------------------------------------------------------
	-- Complete iLvl Jug Pet Precast List
	-------------------------------------------------------------------------------------------------------------------

	sets.precast.JA['Bestial Loyalty'].DroopyDortwin = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Swirling Broth"})
	sets.precast.JA['Bestial Loyalty'].PonderingPeter = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Vis. Broth"})
	sets.precast.JA['Bestial Loyalty'].SunburstMalfik = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Shimmering Broth"})
	sets.precast.JA['Bestial Loyalty'].AgedAngus = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Ferm. Broth"})
	sets.precast.JA['Bestial Loyalty'].WarlikePatrick = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Livid Broth"})
	sets.precast.JA['Bestial Loyalty'].ScissorlegXerin = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Spicy Broth"})
	sets.precast.JA['Bestial Loyalty'].BouncingBertha = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Bubbly Broth"})
	sets.precast.JA['Bestial Loyalty'].RhymingShizuna = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Lyrical Broth"})
	sets.precast.JA['Bestial Loyalty'].AttentiveIbuki = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Salubrious Broth"})
	sets.precast.JA['Bestial Loyalty'].SwoopingZhivago = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Windy Greens"})
	sets.precast.JA['Bestial Loyalty'].AmiableRoche = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Airy Broth"})
	sets.precast.JA['Bestial Loyalty'].HeraldHenry = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Trans. Broth"})
	sets.precast.JA['Bestial Loyalty'].BrainyWaluis = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Crumbly Soil"})
	sets.precast.JA['Bestial Loyalty'].HeadbreakerKen = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Blackwater Broth"})
	sets.precast.JA['Bestial Loyalty'].SuspiciousAlice = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Furious Broth"})
	sets.precast.JA['Bestial Loyalty'].AnklebiterJedd = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Crackling Broth"})
	sets.precast.JA['Bestial Loyalty'].FleetReinhard = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Rapid Broth"})
	sets.precast.JA['Bestial Loyalty'].CursedAnnabelle = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Creepy Broth"})
	sets.precast.JA['Bestial Loyalty'].SurgingStorm = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Insipid Broth"})
	sets.precast.JA['Bestial Loyalty'].SubmergedIyo = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Deepwater Broth"})
	sets.precast.JA['Bestial Loyalty'].RedolentCandi = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Electrified Broth"})
	sets.precast.JA['Bestial Loyalty'].AlluringHoney = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Bug-Ridden Broth"})
	sets.precast.JA['Bestial Loyalty'].CaringKiyomaro = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Fizzy Broth"})
	sets.precast.JA['Bestial Loyalty'].VivaciousVickie = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Tant. Broth"})
	sets.precast.JA['Bestial Loyalty'].HurlerPercival = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Pale Sap"})
	sets.precast.JA['Bestial Loyalty'].BlackbeardRandy = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Meaty Broth"})
	sets.precast.JA['Bestial Loyalty'].GenerousArthur = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Dire Broth"})
	sets.precast.JA['Bestial Loyalty'].ThreestarLynn = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Muddy Broth"})
	sets.precast.JA['Bestial Loyalty'].MosquitoFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Wetlands Broth"})
	sets.precast.JA['Bestial Loyalty']['Left-HandedYoko'] = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Heavenly Broth"})
	sets.precast.JA['Bestial Loyalty'].BraveHeroGlenn = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Wispy Broth"})
	sets.precast.JA['Bestial Loyalty'].SharpwitHermes = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Saline Broth"})
	sets.precast.JA['Bestial Loyalty'].ColibriFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Sugary Broth"})
	sets.precast.JA['Bestial Loyalty'].ChoralLeera = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Glazed Broth"})
	sets.precast.JA['Bestial Loyalty'].SpiderFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Sticky Webbing"})
	sets.precast.JA['Bestial Loyalty'].GussyHachirobe = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Slimy Webbing"})
	sets.precast.JA['Bestial Loyalty'].AcuexFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Poisonous Broth"})
	sets.precast.JA['Bestial Loyalty'].FluffyBredo = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Venomous Broth"})
	sets.precast.JA['Bestial Loyalty'].WeevilFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Pristine Sap"})
	sets.precast.JA['Bestial Loyalty'].StalwartAngelina = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="T. Pristine Sap"})
	sets.precast.JA['Bestial Loyalty'].SweetCaroline = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Aged Humus"})
	sets.precast.JA['Bestial Loyalty']['P.CrabFamiliar'] = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Rancid Broth"})
	sets.precast.JA['Bestial Loyalty'].JovialEdwin = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Pungent Broth"})
	sets.precast.JA['Bestial Loyalty']['Y.BeetleFamiliar'] = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Zestful Sap"})
	sets.precast.JA['Bestial Loyalty'].EnergizedSefina = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Gassy Sap"})
	sets.precast.JA['Bestial Loyalty'].LynxFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Frizzante Broth"})
	sets.precast.JA['Bestial Loyalty'].VivaciousGaston = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Spumante Broth"})
	sets.precast.JA['Bestial Loyalty']['Hip.Familiar'] = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Turpid Broth"})
	sets.precast.JA['Bestial Loyalty'].DaringRoland = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Feculent Broth"})
	sets.precast.JA['Bestial Loyalty'].SlimeFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Decaying Broth"})
	sets.precast.JA['Bestial Loyalty'].SultryPatrice = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Putrescent Broth"})
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(6, 16)
	elseif player.sub_job == 'NIN' then
		set_macro_page(4, 16)
	elseif player.sub_job == 'THF' then
		set_macro_page(6, 16)
	elseif player.sub_job == 'RUN' then
		set_macro_page(6, 16)
	else
		set_macro_page(6, 16)
	end
end

state.Weapons:options('None','Agwu','Ikenga')

autows_list = {['DualWeapons']='Ruinator'}

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 011')
	end