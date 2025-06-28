repeat task.wait() until game:IsLoaded()
local Nexavial = {}; Nexavial.__index = Nexavial
local UserData = {
    Data = {
        Raw = {},
        Macro = {
            Files = {},
            Enable = false,
            Record = {Database = {World = "", Units = {}}},
            Status = nil,
            Support = false,
            Playing = {
                Index = 0,
                Value = nil,
                Ended = false,
                Money = 0
            },
            SelectFileDropdown = {}
        },
        Units = {}
    },
    Signals = {}
}

--// [[ Variable 1]] \\--
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

assert(getgenv and not getgenv().MAMMOTH, "Library has been loaded.")
assert(game.CreatorId == 12229756 and (game.PlaceId == 12886143095 or game.PlaceId == 18583778121 or game.PlaceId == 12900046592), "Game not supported.")
assert(isfile and readfile and writefile and delfile and isfolder and getgenv and require(UserPlayer:WaitForChild("PlayerScripts", math.huge):WaitForChild("PlayerModule", math.huge)).cameras, "Your exploit is not supported.")

repeat
    task.wait()
until UserPlayerGui:FindFirstChild("TeleportUI") == nil

--// [[ Variable 2]] \\--
local Remotes = ReplicatedStorage:WaitForChild("Remotes", math.huge)
local Interact = game.PlaceId ~= 12900046592 and Remotes:WaitForChild("Teleporter", math.huge):WaitForChild("Interact", math.huge)
local TowerInfo = require(ReplicatedStorage:WaitForChild("Modules", math.huge):WaitForChild("TowerInfo", math.huge))

--// [[ Function 1 ]] \\--
function Nexavial:UserData()
    pcall(function()
        return Remotes:WaitForChild("GetPlayerData", math.huge):InvokeServer()
    end)
    return {}
end
function Nexavial:AddSignal(conc, func)
    local func_ = conc:Connect(func)
    table.insert(UserData.Signals, func_)
    return func_
end
function Nexavial:SetArrayTable(ignore)
    return {
        __len = function(l)
            local c = 0
            for i,v in next, l do
                if not table.find(ignore or {}, i) then
                    c += 1
                end
            end
            return c
        end
    }
end

--// [[ LoadString ]] \\--
local OutData = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Nexavial/Workspace/refs/heads/main/Functions/file.lua"))()
local Library = loadstring(game:HttpGetAsync("https://nexavial-loader.vercel.app/ui"))()
local Configs = Library.Options
local Windows = Library:CreateWindow(
    {
        Icon = "Nexavial",
        Title = "Nexavial Hub",
        Theme = "Blue",
        Ignore = {
            "Macro Recording"
        },
        Content = "by ϟ MAMMOTH ☯ (Anime Last Stand 1.0 - 26/06/2025)",
        Loading = {
            Max = 18 + 1,
            Theme = "Theme",
            Transparency = "Toggle Transparency"
        },
        HideRoot = true,
        WindowSize = UserInputService.TouchEnabled and UDim2.fromOffset(527, 407) or UDim2.fromOffset(617, 487),
        SaveFolder = "Nexavial Hub/Anime Last Stand/"..tostring(UserPlayerID),
        Transparent = true,
        NotifyMinimize = true,
        ToggleSettings = {
            BackgroundTransparency = 0.3,
            Icon = "103964252939819",
            Desc = "Nexavial Toggle",
            Title = "Nexavial"
        }
    }
)

do
    OutData:writefile("Nexavial Hub/Anime Last Stand/Macro/Starter.json", {Database = {World = "", Units = {}}})
end

local Tabs = {
    Join = Windows:AddTab({Title = "Join", Icon = "76118728159366"}),
    Macro = Windows:AddTab({Title = "Macro", Icon = "138549539170533"}),
    Settings = Windows:AddTab({Title = "Settings", Icon = "73465145164606"})
}

--// [[ #Tab-Macro ]] \\--
Tabs.Macro:AddSection({Title = "Main"})
UserData.Data.Macro.Status = Tabs.Macro:AddParagraph({
    Type = "Code",
    Title = '<font color="rgb(255, 0, 0)">Macro Status: 🔴</font>', --[[🟢 Playing, 🟡 Recording, 🔴 None, 🟠 Play Ended]]
    Desc = '<font color="rgb(255, 255, 255)">Index: 0/0</font>\n<font color="rgb(255, 255, 255)">Time: 0</font>'
})
table.insert(UserData.Data.Macro.SelectFileDropdown,
Tabs.Macro:AddDropdown("Select Macro File (Main)",
{
    List = OutData:listfiles("Nexavial Hub/Anime Last Stand/Macro", "json"),
    Title = "Select Macro File",
    Default = "Starter",
    Callback = function()
        UserData.Data.Macro.Record = {Database = {World = "", Units = {}}}
        setmetatable(UserData.Data.Macro.Record, Nexavial:SetArrayTable({"Database"}))
    end
}))
Tabs.Macro:AddSection({Title = "Options"})
Tabs.Macro:AddTextBox("File Name (Macro)",
{
    Desc = 'Enter the name you want for the file, for example, "MAMMOTH Handsome". Once done, you can press the "Create Macro File" button',
    Title = "Enter File Name",
    Finished = true,
    PlaceholderText = "File Name here..."
})
Tabs.Macro:AddButton({
    Desc = "Create a macro with the specified name.",
    Title = "Create Macro File",
    Callback = function()
        Windows:Dialog({
            Title = "Create",
            Content = string.format("Are you sure to create the ".."%s.json", Configs["File Name (Macro)"].Value),
            Buttons = {
                {Title = "No"},
                {Title = "Yes", Light = true, Callback = function()
                    local sucecs, errors = pcall(function()
                        assert(#Configs["File Name (Macro)"].Value >= 1, "Please Enter the File Name first.")
                        assert(not isfile(string.format("Nexavial Hub/Anime Last Stand/Macro/%s.json", Configs["File Name (Macro)"].Value)), "The Macro File you want to Create already exists.")
                        OutData:writefile("Nexavial Hub/Anime Last Stand/Macro/Starter.json", {Database = {World = "", Units = {}}})
                        repeat
                            if not isfile(string.format("Nexavial Hub/Anime Last Stand/Macro/%s.json", Configs["File Name (Macro)"].Value)) then
                                writefile(string.format("Nexavial Hub/Anime Last Stand/Macro/%s.json", Configs["File Name (Macro)"].Value), HttpService:JSONEncode({Database = {World = "", Units = {}}}))
                            end
                            UserData.Data.Macro.Files = OutData:listfiles("Nexavial Hub/Anime Last Stand/Macro", "json")
                            task.wait()
                        until Library.Destroyed or table.find(UserData.Data.Macro.Files, Configs["File Name (Macro)"].Value);if Library.Destroyed then return end
                        for _,v in ipairs(UserData.Data.Macro.SelectFileDropdown) do
                            if v.Name == "Select Macro File (Main)" then
                                repeat
                                    UserData.Data.Macro.Files = OutData:listfiles("Nexavial Hub/Anime Last Stand/Macro", "json")
                                    v:NewList(UserData.Data.Macro.Files)
                                    task.wait()
                                until Library.Destroyed or table.find(Configs[v.Name].List, Configs["File Name (Macro)"].Value)
                            else
                                for _,b in ipairs({"Event","Story","Portal","Ranger","Challenge"}) do
                                    repeat
                                        UserData.Data.Macro.Files = OutData:listfiles("Nexavial Hub/Anime Last Stand/Macro", "json")
                                        v:NewDropdown(b, UserData.Data.Macro.Files)
                                        task.wait()
                                    until Library.Destroyed or table.find(Configs[v.Name].List[b].List, Configs["File Name (Macro)"].Value)
                                end
                            end
                        end
                    end)
                    if sucecs then
                        Library:Notify(
                            {
                                Icon = "139982085258959",
                                Color = true,
                                Title = "Successful Create",
                                Content = string.format("%s.json", Configs["File Name (Macro)"].Value),
                                Duration = 5,
                                CanClose = true
                            }
                        )
                        Configs["File Name (Macro)"]:SetValue("")
                    else
                        errors = tostring(errors)
                        if errors:find(": ") then
                            errors = errors:split(": ")[2]
                        end
                        Library:Notify(
                            {
                                Icon = "91371867094572",
                                Color = true,
                                Title = "Unsuccessful Create",
                                Content = errors,
                                Duration = 5,
                                CanClose = true
                            }
                        )
                    end
                end}
            }
        })
    end
})
Tabs.Macro:AddButton({
    Desc = "Delete the Selected Macro.",
    Title = "Remove Select Macro",
    Callback = function()
        Windows:Dialog({
            Title = "Remove",
            Content = string.format("Are you sure to remove the ".."%s.json", Configs["Select Macro File (Main)"].Value),
            Buttons = {
                {Title = "No"},
                {Title = "Yes", Light = true, Callback = function()
                    local name = Configs["Select Macro File (Main)"].Value
                    local sucecs, errors = pcall(function()
                        assert(name, "Please Select the Macro File first.")
                        assert(name ~= "Starter", "Unable to delete the Starter Macro File.")
                        assert(not Configs["Select Macro File (Main)"].Locked, "Unable to delete the Selected Macro File because it's currently undergoing some process.")
                        assert(isfile(string.format("Nexavial Hub/Anime Last Stand/Macro/%s.json", name)), "The Macro File you want to Delete was not found.")
                        OutData:writefile("Nexavial Hub/Anime Last Stand/Macro/Starter.json", {Database = {World = "", Units = {}}})
                        repeat
                            if isfile(string.format("Nexavial Hub/Anime Last Stand/Macro/%s.json", name)) then
                               delfile(string.format("Nexavial Hub/Anime Last Stand/Macro/%s.json", name))
                            end
                            UserData.Data.Macro.Files = OutData:listfiles("Nexavial Hub/Anime Last Stand/Macro", "json")
                            task.wait()
                        until Library.Destroyed or not table.find(UserData.Data.Macro.Files, name);if Library.Destroyed then return end
                        for i,v in ipairs(UserData.Data.Macro.SelectFileDropdown) do
                            if v.Name == "Select Macro File (Main)" then
                                repeat
                                    UserData.Data.Macro.Files = OutData:listfiles("Nexavial Hub/Anime Last Stand/Macro", "json")
                                    v:NewList(UserData.Data.Macro.Files)
                                    task.wait()
                                until Library.Destroyed or not table.find(Configs[v.Name].List, name)
                            else
                                for a,b in next, {"Event","Story","Portal","Ranger","Challenge"} do
                                    repeat
                                        UserData.Data.Macro.Files = OutData:listfiles("Nexavial Hub/Anime Last Stand/Macro", "json")
                                        v:NewDropdown(b, UserData.Data.Macro.Files)
                                        task.wait()
                                    until Library.Destroyed or not table.find(Configs[v.Name].List[b].List, name)
                                end
                            end
                        end
                    end)
                    if sucecs then
                        Library:Notify(
                            {
                                Icon = "139982085258959",
                                Color = true,
                                Title = "Successful Delete",
                                Content = string.format("%s.json", name),
                                Duration = 5,
                                CanClose = true
                            }
                        )
                    else
                        errors = tostring(errors)
                        if errors:find(": ") then
                            errors = errors:split(": ")[2]
                        end
                        Library:Notify(
                            {
                                Icon = "91371867094572",
                                Color = true,
                                Title = "Unsuccessful Delete",
                                Content = errors,
                                Duration = 5,
                                CanClose = true
                            }
                        )
                    end
                    if not Configs["Select Macro File (Main)"].Value then Configs["Select Macro File (Main)"]:SetValue(UserData.Data.Macro.Files[1]) end
                end}
            }
        })
    end
})
Tabs.Macro:AddSection({Title = "Playback and Recording"})
Tabs.Macro:AddSlider("Playback Delay",
{
    Max = 2,
    Min = 0,
    Title = "Playback Delay",
    Default = 0.15,
    Rounding = 2
})
Tabs.Macro:AddToggle("Macro Playback",
{
    Desc = "Playback all actions recorded in the Macro.",
    Title = "Macro Playback"
})
Tabs.Macro:AddToggle("Macro Recording",
{
    Desc = "Record all your actions into a Macro.",
    Title = "Macro Recording"
})

--// [[ #Tab-Settings ]] \\--
Tabs.Settings:AddSection({Title = "Game Settings"})
if setfpscap then
    Tabs.Settings:AddSlider("FPS Cap",
    {
        Max = 60,
        Min = 15,
        Title = "FPS Cap",
        Default = 60,
        Callback = function(bool)
            setfpscap(bool)
        end
    })
end
Tabs.Settings:AddToggle("White Screen",
{
    Title = "White Screen",
    Callback = function(bool)
        RunService:Set3dRenderingEnabled(not bool)
    end
})
Tabs.Settings:AddSection({Title = "Window Settings"})
Tabs.Settings:AddDropdown("Theme",
{
    List = {
        "Dark",
        "Light",
        "Rose",
        "Plant",
        "Red",
        "Blue",
        "Purple"
    },
    Title = "Theme",
    Default = "Blue",
    Callback = function(bool)
        Library:SetTheme(bool)
    end
})
Tabs.Settings:AddKeybind("Minimize Keybind",
{
    Mode = 2,
    Title = "Minimize Keybind",
    Default = Library.ToggleKey.Name,
    Callback = function(bool)
        Library:SetToggleKey(bool)
    end
})
Tabs.Settings:AddToggle("Toggle Transparency",
{
    Title = "Toggle Transparency",
    Default = true,
    Callback = function(bool)
        Windows:ToggleTransparency(bool)
    end
})

Library:AddCallback(function()
    for i,v in pairs(UserData.Signals) do
        v:Disconnect()
    end
    for i,v in pairs(UserData.Data.Raw) do
        v[1].__namecall = v[2]
        setreadonly(v[1], true)
    end
end)
Windows:LoadOptions({
    "Macro Recording"
})
Windows:SetAutoSave(true)
Windows:SaveOptions()
Windows:SelectTab(1)
Windows:LoadMinimize()

if Interact then
else
    local Data_1 = Nexavial:UserData()
    local Data_2 = Remotes:WaitForChild("GetTeleportData", math.huge):InvokeServer()

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
            if Unit.EquippedSoul == "IdolSoul" and table.find({1, 2, 3, 4}, Data.SoulData[Unit.EquippedSoul].Upgrades) then
                Cost = Cost - (Cost * 0.01)
            elseif Unit.EquippedSoul == "IdolSoul" and table.find({5, 6, 7, 8, 9}, Data.SoulData[Unit.EquippedSoul].Upgrades) then
                Cost = Cost - (Cost * 0.025)
            elseif (Unit.EquippedSoul == "BenevolentSoul" or Unit.EquippedSoul == "IdolSoul") and table.find({10, 11, 12, 13, 14, 15}, Data.SoulData[Unit.EquippedSoul].Upgrades) then
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
                if Unit.EquippedSoul == "IdolSoul" and table.find({1, 2, 3, 4}, Data.SoulData[Unit.EquippedSoul].Upgrades) then
                    Cost[i] = Cost[i] - (Cost[i] * 0.01)
                elseif Unit.EquippedSoul == "IdolSoul" and table.find({5, 6, 7, 8, 9}, Data.SoulData[Unit.EquippedSoul].Upgrades) then
                    Cost[i] = Cost[i] - (Cost[i] * 0.025)
                elseif (Unit.EquippedSoul == "BenevolentSoul" or Unit.EquippedSoul == "IdolSoul") and table.find({10, 11, 12, 13, 14, 15}, Data.SoulData[Unit.EquippedSoul].Upgrades) then
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
    local function GetTower(unit, pos)
        if not unit or not pos then
            return
        elseif type(pos) == "string" then
            pos = Vector3.new(table.unpack(pos:gsub(" ", ""):split(",")))
        end
        for i,v in next, Workspace.Towers:GetChildren() do
            if v.Name == unit and v.Owner.Value == UserPlayer and (v.Clickbox.Position == pos )--[[or (v.Clickbox.Position - pos).Magnitude < 1.5)]] then
                return v
            end
        end
    end
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
                return tonumber(Cost)
            end
        end
        return 0
    end
    local function MacroConfigs(type_, data_, Data_)
        if type_ == "Add" then
            UserData.Data.Macro.Record[tostring(#UserData.Data.Macro.Record + 1)] = data_
            UserData.Data.Macro.Record.Database.World = Data_2.MapName

            if Data_ and not table.find(UserData.Data.Macro.Record.Database.Units, Data_) then
                table.insert(UserData.Data.Macro.Record.Database.Units, Data_)
            end
        elseif type_ == "Write" then
            writefile(string.format("Nexavial Hub/Anime Last Stand/Macro/%s.json", Configs["Select Macro File (Main)"].Value), HttpService:JSONEncode(UserData.Data.Macro.Record))
        elseif type_ == "Select" then
            return Configs["Select Macro File (Main)"].Value
        elseif type_ == "Delays" then
            local v = data_
            local u = GetTower(v.Unit, v.Position)
            local p = PlaceCost(v.Unit)
            local x = u and TowerInfo[v.Unit][u.Upgrade.Value + 1]
            local g = (x or {}).Cost

            UserData.Data.Macro.Playing.Money = table.find({"Upgrade", "PlaceTower"}, v.Type) and GetCost(v.Unit, tonumber(g or p)) or 0

            repeat
                task.wait()
            until Library.Destroyed or not Configs["Macro Playback"].Value or (ReplicatedStorage.GameStarted.Value and not ReplicatedStorage.GameEnded.Value)
            repeat
                task.wait()
            until Library.Destroyed or not Configs["Macro Playback"].Value or ReplicatedStorage.ElapsedTime.Value >= tonumber(v.Time)
            repeat
                task.wait()
            until Library.Destroyed or not Configs["Macro Playback"].Value or UserPlayer.Cash.Value >= UserData.Data.Macro.Playing.Money
        end
    end
    Nexavial:AddSignal(Workspace.ChildAdded, function(v)
        if v.Name == "Map" and v:IsA("Folder") then
            Data_2 = Remotes:WaitForChild("GetTeleportData", math.huge):InvokeServer()
        end
    end)
    Nexavial:AddSignal(ReplicatedStorage:WaitForChild("GameStarted", math.huge):GetPropertyChangedSignal("Value"), function()
        if ReplicatedStorage.GameStarted.Value then
            Data_1 = Nexavial:UserData()
        end
    end)
    task.spawn(function()
        Nexavial:AddSignal(Workspace:WaitForChild("Towers", math.huge).ChildAdded, function(v)
            if v:WaitForChild("Owner", math.huge).Value == UserPlayer then
                UserData.Data.Units[v] = v:WaitForChild("Clickbox", math.huge).Position
            end
        end)
        for i,v in next, Workspace.Towers:GetChildren() do
            if v:FindFirstChild("Owner") and v.Owner.Value == UserPlayer then
                UserData.Data.Units[v] = v:WaitForChild("Clickbox", math.huge).Position
            end
        end
    end)
    if setreadonly and newcclosure and getrawmetatable and getnamecallmethod then
        pcall(function()
            local GetRawData = getrawmetatable(Remotes)
            local BackDataBase = GetRawData.__namecall
            setreadonly(GetRawData, false)
            GetRawData.__namecall = newcclosure(function(self, ...)
                local w = {}
                local v = {...}
                local x = getnamecallmethod()
                local t = self
                local e = ReplicatedStorage.ElapsedTime.Value
                task.spawn(function()
                    if (x == "FireServer" or x == "InvokeServer") and UserData.Data.Macro.Enable and ReplicatedStorage:WaitForChild("GameStarted", math.huge).Value and not ReplicatedStorage:WaitForChild("GameEnded", math.huge).Value then
                        if t.Name == "Sell" then
                            w = {
                                Type = t.Name,
                                Unit = v[1].Name,
                                Time = e,
                                Position = tostring(UserData.Data.Units[v[1]])
                            }
                        elseif t.Name == "Ability" then
                            w = {
                                Type = t.Name,
                                Unit = v[1].Name,
                                Time = e,
                                Value = v[2],
                                Position = tostring(UserData.Data.Units[v[1]])
                            }
                        elseif t.Name == "Upgrade" then
                            w = {
                                Type = t.Name,
                                Unit = v[1].Name,
                                Time = e,
                                Value = v[2],
                                Position = tostring(UserData.Data.Units[v[1]])
                            }
                        elseif t.Name == "PlaceTower" then
                            w = {
                                Type = t.Name,
                                Unit = v[1],
                                Time = e,
                                Position = tostring(v[2])
                            }
                        elseif t.Name == "ToggleAutoUse" then
                            w = {
                                Type = t.Name,
                                Unit = v[1].Name,
                                Time = e,
                                Value = v[3],
                                Ability = v[2],
                                Position = tostring(UserData.Data.Units[v[1]])
                            }
                        end
                        if w.Type then
                            MacroConfigs("Add", w, w.Unit)
                            MacroConfigs("Write")
                        end
                    end
                end)
                return BackDataBase(self, ...)
            end)
            Configs["Macro Recording"]:OnChanged(function(bool)
                UserData.Data.Macro.Enable = bool
                if bool then
                    Configs["Macro Playback"]:SetValue(false)
                    Configs["Macro Playback"]:Lock()
                    setmetatable(UserData.Data.Macro.Record, Nexavial:SetArrayTable({"Database"}))

                    task.spawn(function()
                        if not Configs["Select Macro File (Main)"].Value then
                            Configs["Macro Recording"]:SetValue(false)
                            Library:Notify({
                                Icon = "117120869774676",
                                Color = true,
                                Title = "Waring",
                                Content = "Please Select the Macro File first.",
                                Duration = 5,
                                CanClose = true
                            })
                        elseif not isfile(string.format("Nexavial Hub/Anime Last Stand/Macro/%s.json", Configs["Select Macro File (Main)"].Value)) then
                            Configs["Macro Recording"]:SetValue(false)
                            Library:Notify({
                                Icon = "117120869774676",
                                Color = true,
                                Title = "Waring",
                                Content = "The Macro File you want to Record was not found.",
                                Duration = 5,
                                CanClose = true
                            })
                        else
                            local data_ = HttpService:JSONDecode(readfile(string.format("Nexavial Hub/Anime Last Stand/Macro/%s.json", Configs["Select Macro File (Main)"].Value)))
                            setmetatable(data_, Nexavial:SetArrayTable({"Database"}))
                            if #data_ > 0 then
                                local selected
                                UserData.Data.Macro.Enable = false
                                Windows:Dialog({
                                    Title = "Waring",
                                    Content = "The selected file "..Configs["Select Macro File (Main)"].Value..".json has already been recorded. Are you sure you want to record it again?",
                                    Buttons = {
                                        {Title = "No", Callback = function()
                                            selected = false
                                            Configs["Macro Recording"]:SetValue(false)
                                        end},
                                        {Title = "Yes", Light = true, Callback = function()
                                            selected = true
                                            UserData.Data.Macro.Record = {Database = {World = "", Units = {}}}
                                            setmetatable(UserData.Data.Macro.Record, Nexavial:SetArrayTable({"Database"}))
                                            MacroConfigs("Write")
                                        end}
                                    }
                                })
                                repeat
                                    task.wait()
                                until selected ~= nil
                                UserData.Data.Macro.Enable = selected
                                if not selected then
                                    return
                                end
                            end
                        end
                        repeat
                            if not Configs["Macro Recording"].Value then
                                Library:Notify({
                                    Icon = "139982085258959",
                                    Color = true,
                                    Title = "Successful Recorded",
                                    Content = "Index: 0/"..tostring(#UserData.Data.Macro.Record).."\nMacro File: "..Configs["Select Macro File (Main)"].Value,
                                    Duration = 5,
                                    CanClose = true
                                })
                                break
                            end
                            task.wait()
                        until Library.Destroyed
                    end)
                else
                    Configs["Macro Playback"]:Unlock()
                end
            end)
            UserData.Data.Macro.Support = true
            table.insert(UserData.Data.Raw, {GetRawData, BackDataBase})
        end)
    else
        Configs["Macro Recording"]:SetValue(false)
        Configs["Macro Recording"]:Lock()
    end
    task.spawn(function()
        while not Library.Destroyed do
            pcall(function()
                local v
                local a,b
                if Configs["Macro Recording"].Value then
                    UserData.Data.Macro.Status:SetTitle('<font color="rgb(255, 255, 0)">Macro Status: 🟡 | Recording: '..Configs["Select Macro File (Main)"].Value..'</font>')
                    if #UserData.Data.Macro.Record > 0 then
                        v = UserData.Data.Macro.Record[tostring(#UserData.Data.Macro.Record)]
                        UserData.Data.Macro.Status:SetDesc('<font color="rgb(255, 255, 0)">Index: 0/'..tostring(#UserData.Data.Macro.Record)..'</font>\n<font color="rgb(255, 255, 0)">Event: '..v.Type..'</font>'..(v.Unit and '\n<font color="rgb(255, 255, 0)">Unit: '..v.Unit..'</font>' or '')..(v.Value and '\n<font color="rgb(255, 255, 0)">Value: '..tostring(v.Value)..'</font>' or '')..(v.Ability and '\n<font color="rgb(255, 255, 0)">Ability: '..tostring(v.Ability)..'</font>' or '')..'\n<font color="rgb(255, 255, 0)">Time: '..tostring(v.Time)..'</font>\n<font color="rgb(255, 255, 255)">Time: '..tostring(ReplicatedStorage.ElapsedTime.Value)..'</font>')
                    else
                        UserData.Data.Macro.Status:SetDesc('<font color="rgb(255, 255, 0)">Index: 0/0</font>\n<font color="rgb(255, 255, 255)">Time: '..tostring(ReplicatedStorage.ElapsedTime.Value)..'</font>')
                    end
                elseif Configs["Macro Playback"].Value and UserData.Data.Macro.Playing.Value then
                    if UserData.Data.Macro.Playing.Index >= #UserData.Data.Macro.Playing.Value and UserData.Data.Macro.Playing.Ended then
                        UserData.Data.Macro.Status:SetDesc('<font color="rgb(255, 165, 0)">Index: '..tostring(UserData.Data.Macro.Playing.Index)..'/'..tostring(UserData.Data.Macro.Playing.Index)..'</font>\n<font color="rgb(255, 255, 255)">Time: '..tostring(ReplicatedStorage.ElapsedTime.Value)..'</font>')
                        UserData.Data.Macro.Status:SetTitle('<font color="rgb(255, 165, 0)">Macro Status: 🟠 | Ended: '..MacroConfigs("Select")..'</font>')
                    else
                        v = UserData.Data.Macro.Playing.Value[tostring(UserData.Data.Macro.Playing.Index)]
                        a = UserData.Data.Macro.Playing.Money > 0 and '<font color="rgb(0, 255, 0)">' or '<font color="rgb(255, 0, 0)">'
                        UserData.Data.Macro.Status:SetDesc('<font color="rgb(0, 255, 0)">Index: '..tostring(UserData.Data.Macro.Playing.Index)..'/'..tostring(#UserData.Data.Macro.Playing.Value)..'</font>\n<font color="rgb(0, 255, 0)">Event: '..v.Type..'</font>\n'..a..'Money: '..tostring(UserData.Data.Macro.Playing.Money)..'</font>'..(v.Unit and '\n<font color="rgb(0, 255, 0)">Unit: '..v.Unit..'</font>' or '')..(v.Value and '\n<font color="rgb(0, 255, 0)">Value: '..tostring(v.Value)..'</font>' or '')..(v.Ability and '\n<font color="rgb(0, 255, 0)">Value: '..tostring(v.Ability)..'</font>' or '')..'\n'..a..'Time: '..tostring(v.Time)..'</font>\n<font color="rgb(255, 255, 255)">Time: '..tostring(ReplicatedStorage.ElapsedTime.Value)..'</font>')
                        UserData.Data.Macro.Status:SetTitle('<font color="rgb(0, 255, 0)">Macro Status: 🟢 | Playing: '..MacroConfigs("Select")..'</font>')
                    end
                else
                    UserData.Data.Macro.Status:SetDesc('<font color="rgb(255, 255, 255)">Index: 0/0</font>\n<font color="rgb(255, 255, 255)">Time: '..tostring(ReplicatedStorage.ElapsedTime.Value)..'</font>')
                    UserData.Data.Macro.Status:SetTitle('<font color="rgb(255, 0, 0)">Macro Status: 🔴 | None</font>')
                end
            end)
            task.wait()
        end
    end)
    Configs["Macro Playback"]:OnChanged(function(bool)
        if bool then
            if UserData.Data.Macro.Support then
                Configs["Macro Recording"]:SetValue(false)
                Configs["Macro Recording"]:Lock()
            end
            task.spawn(function()
                if not MacroConfigs("Select") then
                    Configs["Macro Playback"]:SetValue(false)
                    Library:Notify({
                        Icon = "117120869774676",
                        Color = true,
                        Title = "Waring",
                        Content = "Please Select the Macro File first.",
                        Duration = 5,
                        CanClose = true
                    })
                elseif not isfile(string.format("Nexavial Hub/Anime Last Stand/Macro/%s.json", MacroConfigs("Select"))) then
                    Configs["Macro Playback"]:SetValue(false)
                    Library:Notify({
                        Icon = "117120869774676",
                        Color = true,
                        Title = "Waring",
                        Content = "The Macro File you want to Playback was not found.",
                        Duration = 5,
                        CanClose = true
                    })
                else
                    UserData.Data.Macro.Playing.Value = HttpService:JSONDecode(readfile(string.format("Nexavial Hub/Anime Last Stand/Macro/%s.json", MacroConfigs("Select"))))
                    setmetatable(UserData.Data.Macro.Playing.Value, Nexavial:SetArrayTable({"Database"}))
                    if #UserData.Data.Macro.Playing.Value == 0 then
                        Configs["Macro Playback"]:SetValue(false)
                        Library:Notify({
                            Icon = "117120869774676",
                            Color = true,
                            Title = "Waring",
                            Content = "Please record a Macro before starting playback.",
                            Duration = 5,
                            CanClose = true
                        })
                    elseif UserData.Data.Macro.Playing.Value.Database.World ~= Data_2.MapName then
                        Configs["Macro Playback"]:SetValue(false)
                        Library:Notify({
                            Icon = "117120869774676",
                            Color = true,
                            Title = "Waring",
                            Content = "World does not match the recorded Macro data.",
                            Duration = 5,
                            CanClose = true
                        })
                    else
                        for i = 1, #UserData.Data.Macro.Playing.Value do
                            UserData.Data.Macro.Playing.Index = i
                            local v = UserData.Data.Macro.Playing.Value[tostring(i)]
                            local u = GetTower(v.Unit, v.Position)
                            if Library.Destroyed or not Configs["Macro Playback"].Value then
                                break
                            end
                            if v.Type == "Sell" then
                                if not u then
                                    Library:Notify({
                                        Icon = "117120869774676",
                                        Color = true,
                                        Title = "Waring",
                                        Content = "The Unit you want to Sell was not found.",
                                        Duration = 5,
                                        CanClose = true
                                    })
                                else
                                    MacroConfigs("Delays", v)
                                    if Library.Destroyed or not Configs["Macro Playback"].Value then
                                        break
                                    end
                                    Remotes.Sell:InvokeServer(u)
                                end
                            elseif v.Type == "Upgrade" then
                                if not u then
                                    Library:Notify({
                                        Icon = "117120869774676",
                                        Color = true,
                                        Title = "Waring",
                                        Content = "The Unit you want to Upgrade was not found.",
                                        Duration = 5,
                                        CanClose = true
                                    })
                                else
                                    MacroConfigs("Delays", v)
                                    if Library.Destroyed or not Configs["Macro Playback"].Value then
                                        break
                                    end
                                    Remotes.Upgrade:InvokeServer(u)
                                end
                            elseif v.Type == "Ability" then
                                if not u then
                                    Library:Notify({
                                        Icon = "117120869774676",
                                        Color = true,
                                        Title = "Waring",
                                        Content = "The Unit you want to use the Ability was not found.",
                                        Duration = 5,
                                        CanClose = true
                                    })
                                else
                                    MacroConfigs("Delays", v)
                                    if Library.Destroyed or not Configs["Macro Playback"].Value then
                                        break
                                    end
                                    Remotes.Ability:InvokeServer(u, tonumber(v.Value))
                                end
                            elseif v.Type == "PlaceTower" then
                                if PlaceCost(v.Unit) == 0 then
                                    Library:Notify({
                                        Icon = "117120869774676",
                                        Color = true,
                                        Title = "Waring",
                                        Content = "The Unit you want to Place was not found.",
                                        Duration = 5,
                                        CanClose = true
                                    })
                                else
                                    MacroConfigs("Delays", v)
                                    if Library.Destroyed or not Configs["Macro Playback"].Value then
                                        break
                                    end
                                    Remotes.PlaceTower:InvokeServer(v.Unit, CFrame.new(table.unpack(v.Position:gsub(" ", ""):split(","))))
                                end
                            elseif v.Type == "ToggleAutoUse" then
                                if not u then
                                    Library:Notify({
                                        Icon = "117120869774676",
                                        Color = true,
                                        Title = "Waring",
                                        Content = "The Unit you want to use the Auto Ability was not found.",
                                        Duration = 5,
                                        CanClose = true
                                    })
                                else
                                    MacroConfigs("Delays", v)
                                    if Library.Destroyed or not Configs["Macro Playback"].Value then
                                        break
                                    end
                                    Remotes.ToggleAutoUse:InvokeServer(u, tonumber(v.Ability), v.Value)
                                end
                            end
                            if i >= #UserData.Data.Macro.Playing.Value then
                                UserData.Data.Macro.Playing.Ended = true
                            end
                        end
                    end
                end
            end)
        else
            if UserData.Data.Macro.Support then
                Configs["Macro Recording"]:Unlock()
            end
            UserData.Data.Macro.Playing.Value = nil
            UserData.Data.Macro.Playing.Ended = false
        end
    end)
end
