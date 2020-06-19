ESX = nil


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

RegisterNetEvent('setgroup')
AddEventHandler('setgroup', function()
    group = true
end)    

Citizen.CreateThread(function()
    while true do
        
        Citizen.Wait( 5000 )

        if NetworkIsSessionStarted() then
            TriggerServerEvent( "checkadmin")
        end
    end
end )


function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)


	AddTextEntry('FMMC_KEY_TIP1', TextEntry) 
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght) 
	blockinput = true 

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
		Citizen.Wait(0)
	end
		
	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult() 
		Citizen.Wait(500) 
		blockinput = false 
		return result 
	else
		Citizen.Wait(500) 
		blockinput = false 
		return nil 
	end
end

RMenu.Add('ped', 'main', RageUI.CreateMenu("Peds", "Menu peds"))

Citizen.CreateThread(function()
    while true do

    		
    	RageUI.IsVisible(RMenu:Get('ped', 'main'), true, true, true, function()
            RageUI.Button("Normal", "Pour se remettre en normal", {RightLabel = ""}, true, function(Hovered, Active, Selected)
                if (Selected) then   
                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                    local isMale = skin.sex == 0


                    TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
                        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                            TriggerEvent('skinchanger:loadSkin', skin)
                            TriggerEvent('esx:restoreLoadout')
                    end)
                    end)
                    end)
            end
            end)
        
			RageUI.Button("Singe", "Pour se mettre en singe", {RightLabel = ""}, true, function(Hovered, Active, Selected)
                if (Selected) then   
                local j1 = PlayerId()
    			local p1 = GetHashKey('a_c_chimp')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
   				 ESX.ShowNotification('Tu est maintenant un singe')
                end      
            end)
            RageUI.Button("Danseuse", "Pour se mettre en danseuse", {RightLabel = ""}, true, function(Hovered, Active, Selected)
                if (Selected) then   
                local j1 = PlayerId()
    			local p1 = GetHashKey('csb_stripper_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
   				 ESX.ShowNotification('Tu est maintenant une danseuse')
                end      
            end)
            RageUI.Button("Cosmonaute", "Pour se mettre en cosmonaute", {RightLabel = ""}, true, function(Hovered, Active, Selected)
                if (Selected) then   
                local j1 = PlayerId()
    			local p1 = GetHashKey('s_m_m_movspace_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
   				 ESX.ShowNotification('Tu est maintenant un cosmonaute')
                end      
            end)
             RageUI.Button("Alien", "Pour se mettre en alien", {RightLabel = ""}, true, function(Hovered, Active, Selected)
                if (Selected) then   
                local j1 = PlayerId()
    			local p1 = GetHashKey('s_m_m_movalien_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
   				 ESX.ShowNotification('Tu est maintenant un alien')
                end      
            end)
             RageUI.Button("Chat", "Pour se mettre en chat", {RightLabel = ""}, true, function(Hovered, Active, Selected)
                if (Selected) then   
                local j1 = PlayerId()
                local p1 = GetHashKey('a_c_cat_01')
                RequestModel(p1)
                while not HasModelLoaded(p1) do
                  Wait(100)
                 end
                 SetPlayerModel(j1, p1)
                 SetModelAsNoLongerNeeded(p1)
                 ESX.ShowNotification('Tu est maintenant un chat')
                end      
            end)
             RageUI.Button("Aigle", "Pour se mettre en aigle", {RightLabel = ""}, true, function(Hovered, Active, Selected)
                if (Selected) then   
                local j1 = PlayerId()
                local p1 = GetHashKey('a_c_chickenhawk')
                RequestModel(p1)
                while not HasModelLoaded(p1) do
                  Wait(100)
                 end
                 SetPlayerModel(j1, p1)
                 SetModelAsNoLongerNeeded(p1)
                 ESX.ShowNotification('Tu est maintenant un aigle')
                end      
            end)
             RageUI.Button("Coyote", "Pour se mettre en coyote", {RightLabel = ""}, true, function(Hovered, Active, Selected)
                if (Selected) then   
                local j1 = PlayerId()
                local p1 = GetHashKey('a_c_coyote')
                RequestModel(p1)
                while not HasModelLoaded(p1) do
                  Wait(100)
                 end
                 SetPlayerModel(j1, p1)
                 SetModelAsNoLongerNeeded(p1)
                 ESX.ShowNotification('Tu est maintenant un coyote')
                end      
            end)
             RageUI.Button("A choisir", "Pour choisir un ped", {RightLabel = ""}, true, function(Hovered, Active, Selected)
                if (Selected) then   
                local j1 = PlayerId()
                local newped = KeyboardInput('ped a choisir', '', 45)
                local p1 = GetHashKey(newped)
                RequestModel(p1)
                while not HasModelLoaded(p1) do
                  Wait(100)
                 end
                 SetPlayerModel(j1, p1)
                 SetModelAsNoLongerNeeded(p1)
                 ESX.ShowNotification('c bon c changer')
                end      
            end)
        end, function()
        end)
    	
            Citizen.Wait(0)
        end
    end)



 
    
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
                if group == true then 
                    if IsControlJustPressed(1,57) then
                        RageUI.Visible(RMenu:Get('ped', 'main'), not RageUI.Visible(RMenu:Get('ped', 'main')))
                        
                    end
                end
       		 end
    end)



    