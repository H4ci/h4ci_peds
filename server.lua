ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


local admins = {
    'steam:000000000000000',
    'steam:000000000000000'
}

function isAdmin(player)
    local allowed = false
    for i,id in ipairs(admins) do
        for x,pid in ipairs(GetPlayerIdentifiers(player)) do
            if string.lower(pid) == string.lower(id) then
                allowed = true
            end
        end
    end
    return allowed
end

RegisterServerEvent('checkadmin')
AddEventHandler('checkadmin', function()
	local id = source
	if isAdmin(id) then
		TriggerClientEvent("setgroup", source)
	end
end)

