local profile = {};
gcdisplay = gFunc.LoadFile('common\\gcdisplay.lua');
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');


sets = T{
    Idle = {
        Main =  'Terra\'s Staff',
        Sub =   'Bugard Strap +1',
        Ammo =  'Bibiki Seashell',
        Head =  'Maat\'s Cap',
        Neck =  'Orochi Nodowa',
        Ear1 =  'Loquac. Earring',
        Ear2 =  'Celestial Earring',
        Body =  'Dalmatica +1',
        Hands = 'Yigit Gages',
        Ring1 = 'Tamas Ring',
        Ring2 = 'Defending Ring',
        Back =  'Hexerei Cape',
        Waist = 'Salire Belt',
        Legs =  'Yigit Seraweels',
        Feet =  'Goliard Clogs',
    },

    Idle_Regen = {
    },

    Idle_Refresh = {
    },

    Resting = {
        Main = 'Chatoyant Staff',
        Sub = 'Staff Strap',
        Ammo = 'Hedgehog Bomb',
        Head = 'Walahra Turban',
        Neck = 'Grandiose Chain',
        Ear1 = 'Relaxing Earring',
        Ear2 = 'Boroka Earring',
        Body = 'Errant Hpl.',
        Hands = 'Sorcerer\'s Gloves',
        Ring1 = 'Star Ring',
        Ring2 = 'Star Ring',
        Back = 'Invigorating Cape',
        Waist = 'Qiqirn Sash +1',
        Legs = 'Yigit Seraweels',
        Feet = 'Goliard Clogs',
    },

	Town = {
    },

	DT = {
	},
    
	Precast = {
    },

    Cure = {
        Main = 'Chatoyant Staff',
        Sub = 'Bugard Strap +1',
        Ammo = 'Hedgehog Bomb',
        Head = 'Walahra Turban',
        Neck = 'Promise badge',
        Ear1 = 'Magnetic Earring',
        Ear2 = 'Loquac. Earring',
        Body = 'Dalmatica +1',
        Hands = 'Yigit Gages',
        Ring1 = 'Tamas Ring',
        Ring2 = 'Star Ring',
        Back = 'Prism Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Jet Seraweels',
        Feet = 'Rostrum pumps',
    },
    Haste = {
        Head = 'Walahra Turban',
        Body = 'Goliard saio',
        Ear1 = 'Loquac. Earring',
        Waist = 'Headlong Belt',
        Feet = 'Rostrum pumps',
        Back = 'Veela Cape'
    },
	Movement = {
        Feet = 'Herald\'s Gaiters',
	},

    BLM_Nuke = {
        Main =  'Chatoyant Staff',
        Sub =   'Bugard Strap +1',
        Ammo =  'Phtm. Tathlum',
        Head =  'Sorcerer\'s Petas.',
        Neck =  'Lmg. Medallion',
        Ear1 =  'Novio Earring',
        Ear2 =  'Moldavite Earring',
        Body =  'Morrigan\'s Robe',
        Hands = 'Zenith Mitts',
        Ring1 = 'Tamas Ring',
        Ring2 = 'Snow Ring',
        Back =  'Prism Cape',
        Waist = 'Salire Belt',
        Legs =  'Jet Seraweels',
        Feet =  'Goliard Clogs',
    },

    BLM_Ele = {                                                          
        Main = 'Chatoyant Staff',
        Sub = 'Bugard Strap +1',
        Ammo = 'Phtm. Tathlum',
        Head = 'Sorcerer\'s Petas.',
        Neck = 'Elemental Torque',
        Ear1 = 'Novio Earring',
        Ear2 = 'Elemental Earring',
        Body = 'Genie Weskit',
        Hands = 'Wizard\'s Gloves',
        Ring1 = 'Tamas Ring',
        Ring2 = 'Balrahn\'s Ring',
        Back = 'Prism Cape',
        Waist = 'Salire Belt',
        Legs = 'Jet Seraweels',
        Feet = 'Goliard Clogs',
    },  

    Dark = {
        Main = 'Chatoyant Staff',
        Sub = 'Bugard Strap +1',
        Ammo = 'Phtm. Tathlum',
        Head = 'Wizard\'s Petasos',
        Neck = 'Dark Torque',
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Dark Earring',
        Body = 'Errant Hpl.',
        Hands = 'Sorcerer\'s Gloves',
        Ring1 = 'Tamas Ring',
        Ring2 = 'Snow Ring',
        Back = 'Prism Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Wizard\'s Tonban',
        Feet = 'Igqira Huaraches',
    },

    Enfeeble = {
        Main = 'Chatoyant Staff',
        Sub = 'Bugard Strap +1',
        Ammo = 'Phtm. Tathlum',
        Head = 'Genie Tiara',
        Neck = 'Enfeebling Torque',
        Ear1 = 'Enfeebling Earring',
        Ear2 = 'Incubus Earring',
        Body = 'Wizard\'s Coat',
        Hands = 'Yigit Gages',
        Ring1 = 'Tamas Ring',
        Ring2 = 'Balrahn\'s Ring',
        Back = 'Prism Cape',
        Waist = 'Salire Belt',
        Legs = 'Igqira Lappas',
        Feet = 'Goliard Clogs',
    },
};

sets = sets:merge(gcinclude.sets, false);profile.Sets = sets;

profile.OnLoad = function()
    gSettings.AllowAddSet = false;
	gcinclude.Initialize:once(3);

    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
end

profile.OnUnload = function()
    gcinclude.Unload();
end

profile.HandleCommand = function(args)
	gcinclude.SetCommands(args);
end

profile.HandleDefault = function()
	gFunc.EquipSet(sets.Idle);
	
	local player = gData.GetPlayer();
    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.Tp_Default)
        if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
        gFunc.EquipSet('Tp_' .. gcdisplay.GetCycle('MeleeSet')); end
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    elseif (player.IsMoving == true) then
		gFunc.EquipSet(sets.Movement);
    end
	
	
	if (gcdisplay.GetToggle('DTset') == true) then
         
		gFunc.EquipSet(sets.DT);
	end
	if (gcdisplay.GetToggle('Kite') == true) then
		gFunc.EquipSet(sets.Movement);
	end

    gcinclude.CheckDefault ();
     
end

profile.HandleAbility = function()
	local ability = gData.GetAction();

    gcinclude.CheckCancels();
end

profile.HandleItem = function()
    local item = gData.GetAction();

end

profile.HandlePrecast = function()
    local spell = gData.GetAction();
    gcinclude.CheckCancels();
end

profile.HandleMidcast = function()
    local spell = gData.GetAction();
end

profile.HandleWeaponskill = function()
        end
    end
end

return profile;