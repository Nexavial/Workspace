local Player = game:GetService("Players")
local Request = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
local Workspace = game:GetService("Workspace")
local UserPlayer = Player.LocalPlayer
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local VirtualUser = game:GetService("VirtualUser")
local TweenService = game:GetService("TweenService")
local VirtualInput = game:GetService("VirtualInputManager")
local UserPlayerID = Player:GetUserIdFromNameAsync(UserPlayer.Name)
local UserPlayerGui = UserPlayer.PlayerGui
local TeleportService = game:GetService("TeleportService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local function PlaceCost(unit)
    local Unit
    for i,v in next, UserPlayer.Slots:GetChildren() do
        if v.Value == unit then
            Unit = v.Name:split("Slot")[2]
        end
    end
    for i,v in next, UserPlayerGui.Bottom.Frame.Frame:GetChildren()[7]:GetChildren() do
        if v:IsA("TextButton") and v.Frame.SlotNumber.Text == tostring(Unit) then
            local Cost = v.Frame.Cost.Text:split("$")[2]
            return Cost
        end
    end
    return 0
end

local Data_1 = ReplicatedStorage.Remotes.GetPlayerData:InvokeServer()
local Data_2 = ReplicatedStorage.Remotes.GetTeleportData:InvokeServer()

local function GetCost(unit, cost)
    local Data = Data_1
    local Unit = nil
    local Cost = cost

    for i,v in next, Data.UnitData do
        if v.UnitName == unit and v.Equipped then
            Unit = Data.UnitData[i]
            break
        end
    end
    if not Unit then
        return
    end
    if type(Cost) == "number" then
        --// [ Soul ] \\--
        if Unit.EquippedSoul == "IdolSoul" and Data.SoulData[Unit.EquippedSoul].Upgrades < 5 then
            Cost = Cost - (Cost * 0.01)
        elseif Unit.EquippedSoul == "IdolSoul" and Data.SoulData[Unit.EquippedSoul].Upgrades < 10 then
            Cost = Cost - (Cost * 0.025)
        elseif (Unit.EquippedSoul == "BenevolentSoul" or Unit.EquippedSoul == "IdolSoul") and Data.SoulData[Unit.EquippedSoul].Upgrades >= 10 then
            Cost = Cost - (Cost * 0.04)
        end

        --// [ Enchant ] \\--
        if table.find({"Midas", "Efficiency"}, Unit.Enchant) and not ReplicatedStorage.EnchantsDisabled.Value then
            Cost = Cost - (Cost * 0.20)
        end

        --// [ Challenge ] \\--
        if Data_2.Challenge == "High Cost" then
            Cost = Cost * 1.33
        end
    elseif type(Cost) == "table" then
        for i,v in ipairs(Cost) do
            --// [ Soul ] \\--
            if Unit.EquippedSoul == "IdolSoul" and Data.SoulData[Unit.EquippedSoul].Upgrades < 5 then
                Cost[i] = Cost[i] - (Cost[i] * 0.01)
            elseif Unit.EquippedSoul == "IdolSoul" and Data.SoulData[Unit.EquippedSoul].Upgrades < 10 then
                Cost[i] = Cost[i] - (Cost[i] * 0.025)
            elseif (Unit.EquippedSoul == "BenevolentSoul" or Unit.EquippedSoul == "IdolSoul") and Data.SoulData[Unit.EquippedSoul].Upgrades >= 10 then
                Cost[i] = Cost[i] - (Cost[i] * 0.04)
            end

            --// [ Enchant ] \\--
            if table.find({"Midas", "Efficiency"}, Unit.Enchant) and not ReplicatedStorage.EnchantsDisabled.Value then
                Cost[i] = Cost[i] - (Cost[i] * 0.20)
            end

            --// [ Challenge ] \\--
            if Data_2.Challenge == "High Cost" then
                Cost[i] = Cost[i] * 1.33
            end
        end
    end
    return Cost
end

warn(GetCost("AiHoshinoEvo", 600))
