local isHudVisible = false

Citizen.CreateThread(function()

    Citizen.Wait(500)

    isHudVisible = true
    SendNUIMessage({ action = "show" })

    while true do
        Citizen.Wait(200)

        local ped = PlayerPedId()


        if IsPedInAnyVehicle(ped, false) then
            local veh = GetVehiclePedIsIn(ped, false)


            local speed = GetEntitySpeed(veh) * 3.6 -- km/h
            local rpm = GetVehicleCurrentRpm(veh) * 100
            local fuel = GetVehicleFuelLevel(veh)


            SendNUIMessage({
                action = "update",
                speed = speed,
                rpm = rpm,
                fuel = fuel
            })


            if not isHudVisible then
                SendNUIMessage({ action = "show" })
                isHudVisible = true
            end
        else

            if isHudVisible then
                SendNUIMessage({ action = "hide" })
                isHudVisible = false
            end
        end
    end
end)
