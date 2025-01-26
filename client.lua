local jumpCooldown = 2.0
local lastJumpTime = 0

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local player = PlayerPedId()
        if IsPedJumping(player) then
            local currentTime = GetGameTimer() / 1000 

            if currentTime - lastJumpTime < jumpCooldown then
                SetPedToRagdoll(player, 500, 500, 0, false, false, false)
                Citizen.Wait(100) 
            else
                lastJumpTime = currentTime
            end
        end
    end
end)