local rwin = { "rbxassetid://1476296697", "rbxassetid://1836977068", "rbxassetid://1841009278", "rbxassetid://1845783281" }
for i,v in next, game.Players.LocalPlayer.PlayerGui.Music:GetDescendants() do
    if v:IsA("Sound") then
        if v.Name == "Lose" then
            v.SoundId = "rbxassetid://1846252357"
        elseif v.Name == "Win" then
            v.SoundId = rwin[math.random(#rwin)]
        elseif v.Name == "Bomb" then
            v.SoundId = "rbxassetid://1839856540"
        elseif v.Name == "1" then
            if v.Parent.Name == "StartRound" then
                v.SoundId = "rbxassetid://1837972509"
            else
                v.SoundId = "rbxassetid://"
            end
        end
    end
end
