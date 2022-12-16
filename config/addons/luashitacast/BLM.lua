local profile = {};
gcdisplay = gFunc.LoadFile('common\\gcdisplay.lua');
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');


sets = T{
    Idle = {
        main = 'Terra\'s Staff',
        sub = 'Bugard Strap +1',
        ammo = 'Phtm. Tathlum',
        head = 'Src. Petasos +1'
        body = 'Src. Coat +1,
        hands = 'Zenith Mitts',
        legs = 'Mahatma Slops',
        feet = 'Rostrum Pumps',
        neck = 'Elemental Torque',
        waist = 'Hierarch Belt',
        ear1 = 'Loquac. earring',
        ear2 = 'Moldavite Earring',
        ring1 = 'Tamas Ring',
        ring2 = 'Snow Ring',
        back = 'Prism Cape',
    },
	Resting = {
    },
    Idle_Regen = {
    },
    Idle_Refresh = {
    },
	Town = {
    },
	DT = {
	},
	Precast = {
    },
    Stoneskin_Precast = {
    },
    Cure = {
    },
	Movement = {
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