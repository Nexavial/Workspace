local GameData = {
    Story = {
        OnePiece = {
            LayoutOrder = 1;
            Name = "Voocha Village";
            Image = "rbxassetid://139956759761186";
            BossShow = "OnePiece_Mon_Boss1";
            StoryAble = true;
            Ani_Names = "Onepiece";
            Display_Series = "Pirates World";
            Requirements = {};
            Levels = {{
                id = "OnePiece_Chapter1";
            }, {
                id = "OnePiece_Chapter2";
            }, {
                id = "OnePiece_Chapter3";
            }, {
                id = "OnePiece_Chapter4";
            }, {
                id = "OnePiece_Chapter5";
            }, {
                id = "OnePiece_Chapter6";
            }, {
                id = "OnePiece_Chapter7";
            }, {
                id = "OnePiece_Chapter8";
            }, {
                id = "OnePiece_Chapter9";
            }, {
                id = "OnePiece_Chapter10";
            }};
        };
        Namek = {
            LayoutOrder = 2;
            Name = "Green Planet";
            Image = "rbxassetid://83551345782867";
            BossShow = "Namek_Mon_Boss1";
            StoryAble = true;
            Ani_Names = "DBZ";
            Display_Series = "Dragon Orb";
            Requirements = {
                Required_Levels = "OnePiece_Chapter10";
            };
            Levels = {{
                id = "Namek_Chapter1";
            }, {
                id = "Namek_Chapter2";
            }, {
                id = "Namek_Chapter3";
            }, {
                id = "Namek_Chapter4";
            }, {
                id = "Namek_Chapter5";
            }, {
                id = "Namek_Chapter6";
            }, {
                id = "Namek_Chapter7";
            }, {
                id = "Namek_Chapter8";
            }, {
                id = "Namek_Chapter9";
            }, {
                id = "Namek_Chapter10";
            }};
        };
        DemonSlayer = {
            LayoutOrder = 3;
            Name = "Demon Forest";
            Image = "rbxassetid://88600116685738";
            BossShow = "DemonSlayer_Mon_Boss1";
            StoryAble = true;
            Ani_Names = "DemonSlayer";
            Display_Series = "Evil Defeats";
            Requirements = {
                Required_Levels = "Namek_Chapter10";
            };
            Levels = {{
                id = "DemonSlayer_Chapter1";
            }, {
                id = "DemonSlayer_Chapter2";
            }, {
                id = "DemonSlayer_Chapter3";
            }, {
                id = "DemonSlayer_Chapter4";
            }, {
                id = "DemonSlayer_Chapter5";
            }, {
                id = "DemonSlayer_Chapter6";
            }, {
                id = "DemonSlayer_Chapter7";
            }, {
                id = "DemonSlayer_Chapter8";
            }, {
                id = "DemonSlayer_Chapter9";
            }, {
                id = "DemonSlayer_Chapter10";
            }};
        };
        Naruto = {
            LayoutOrder = 4;
            Name = "Leaf Village";
            Image = "rbxassetid://115842135671395";
            BossShow = "Naruto_Mon_Boss1";
            StoryAble = true;
            Ani_Names = "Naruto";
            Display_Series = "Ninja Clash";
            Requirements = {
                Required_Levels = "DemonSlayer_Chapter10";
            };
            Levels = {{
                id = "Naruto_Chapter1";
            }, {
                id = "Naruto_Chapter2";
            }, {
                id = "Naruto_Chapter3";
            }, {
                id = "Naruto_Chapter4";
            }, {
                id = "Naruto_Chapter5";
            }, {
                id = "Naruto_Chapter6";
            }, {
                id = "Naruto_Chapter7";
            }, {
                id = "Naruto_Chapter8";
            }, {
                id = "Naruto_Chapter9";
            }, {
                id = "Naruto_Chapter10";
            }};
        };
        OPM = {
            LayoutOrder = 5;
            Name = "Z City";
            Image = "rbxassetid://116889089754097";
            BossShow = "OPM_Mon_Boss1";
            StoryAble = true;
            Ani_Names = "OnePunchMan";
            Display_Series = "Strongest Hero";
            Requirements = {
                Required_Levels = "Naruto_Chapter10";
            };
            Levels = {{
                id = "OPM_Chapter1";
            }, {
                id = "OPM_Chapter2";
            }, {
                id = "OPM_Chapter3";
            }, {
                id = "OPM_Chapter4";
            }, {
                id = "OPM_Chapter5";
            }, {
                id = "OPM_Chapter6";
            }, {
                id = "OPM_Chapter7";
            }, {
                id = "OPM_Chapter8";
            }, {
                id = "OPM_Chapter9";
            }, {
                id = "OPM_Chapter10";
            }};
        };
    },
    Dropdowns = {
        Story = {},
        Image = {
            Story = {}
        }
    }
}
GameData.__index = GameData
function GameData:ConvertWorld(t, n, g)
    if t == "Story" then
        for i,v in next, GameData.Story do
            if v.Name == n or "" then
                return g and GameData.Story[i] or i
            end
        end
    end
end
for i,v in next, GameData.Story do
    GameData.Dropdowns.Story[v.Name] = {
        Type = {"Dropdown", "Dropdown2"},
        List = {
            "Chapter 1",
            "Chapter 2",
            "Chapter 3",
            "Chapter 4",
            "Chapter 5",
            "Chapter 6",
            "Chapter 7",
            "Chapter 8",
            "Chapter 9",
            "Chapter 10"
        },
        List2 = {
            "Normal",
            "Hard",
            "Nightmare"
        },
        DropdownTitle = "Select Chapter",
		DropdownTitle2 = "Select Difficulty",
        DefaultDropdown = "Chapter 1",
        DefaultDropdown2 = "Normal",
        LayoutOrder = v.LayoutOrder
    }
    GameData.Dropdowns.Image.Story[v.Name] = {
        Color = true,
        SizeY = 40,
        Image = v.Image,
        UICorner = 4,
        ScaleType = Enum.ScaleType.Stretch,
        BackgroundTransparency = 1
    }
end
return GameData
