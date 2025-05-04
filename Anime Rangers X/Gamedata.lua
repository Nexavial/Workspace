local GameData = {
    Code = {
       "CongratsFor1M",
        "Im Back",
        "SorryForIssues",
    },
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
            Image = "rbxassetid://93900824627541";
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
        Image = {
            Story = {}
        },
        Story = {},
        Ranger = {},
        Challenge = {}
    },
    ChallengeList = {
        "High Cost",
        "Speed Demon",
        "Budget Cuts",
        "One Life Only",
        "Limited Towers",
        "Expensive Upgrades"
    },
    NextChapter = {
        --//OnePiece
        OnePiece_RangerStage1 = "OnePiece_RangerStage2",
        OnePiece_RangerStage2 = "OnePiece_RangerStage3",
        OnePiece_RangerStage3 = "Namek_RangerStage1",
        --//Namek
        Namek_RangerStage1 = "Namek_RangerStage2",
        Namek_RangerStage2 = "Namek_RangerStage3",
        Namek_RangerStage3 = "DemonSlayer_RangerStage1",
        --//DemonSlayer
        DemonSlayer_RangerStage1 = "DemonSlayer_RangerStage2",
        DemonSlayer_RangerStage2 = "DemonSlayer_RangerStage3",
        DemonSlayer_RangerStage3 = "Naruto_RangerStage1",
        --//Naruto
        Naruto_RangerStage1 = "Naruto_RangerStage2",
        Naruto_RangerStage2 = "Naruto_RangerStage3",
        Naruto_RangerStage3 = "OPM_RangerStage1",
        --//OPM
        OPM_RangerStage1 = "OPM_RangerStage2",
        OPM_RangerStage2 = "OPM_RangerStage3",
        OPM_RangerStage3 = ""
    },
    LevelRequirements = {
        --//OnePiece
        OnePiece_Chapter1 = true,
        OnePiece_Chapter2 = "OnePiece_Chapter1",
        OnePiece_Chapter3 = "OnePiece_Chapter2",
        OnePiece_Chapter4 = "OnePiece_Chapter3",
        OnePiece_Chapter5 = "OnePiece_Chapter4",
        OnePiece_Chapter6 = "OnePiece_Chapter5",
        OnePiece_Chapter7 = "OnePiece_Chapter6",
        OnePiece_Chapter8 = "OnePiece_Chapter7",
        OnePiece_Chapter9 = "OnePiece_Chapter8",
        OnePiece_Chapter10 = "OnePiece_Chapter9",
        OnePiece_RangerStage1 = true,
        OnePiece_RangerStage2 = "OnePiece_Chapter10",
        OnePiece_RangerStage3 = "OnePiece_Chapter10",
        --//Namek
        Namek_Chapter1 = "OnePiece_Chapter10",
        Namek_Chapter2 = "Namek_Chapter1",
        Namek_Chapter3 = "Namek_Chapter2",
        Namek_Chapter4 = "Namek_Chapter3",
        Namek_Chapter5 = "Namek_Chapter4",
        Namek_Chapter6 = "Namek_Chapter5",
        Namek_Chapter7 = "Namek_Chapter6",
        Namek_Chapter8 = "Namek_Chapter7",
        Namek_Chapter9 = "Namek_Chapter8",
        Namek_Chapter10 = "Namek_Chapter9",
        Namek_RangerStage1 = "Namek_Chapter10",
        Namek_RangerStage2 = "Namek_Chapter10",
        Namek_RangerStage3 = "Namek_Chapter10",
        --//DemonSlayer
        DemonSlayer_Chapter1 = "Namek_Chapter10",
        DemonSlayer_Chapter2 = "DemonSlayer_Chapter1",
        DemonSlayer_Chapter3 = "DemonSlayer_Chapter2",
        DemonSlayer_Chapter4 = "DemonSlayer_Chapter3",
        DemonSlayer_Chapter5 = "DemonSlayer_Chapter4",
        DemonSlayer_Chapter6 = "DemonSlayer_Chapter5",
        DemonSlayer_Chapter7 = "DemonSlayer_Chapter6",
        DemonSlayer_Chapter8 = "DemonSlayer_Chapter7",
        DemonSlayer_Chapter9 = "DemonSlayer_Chapter8",
        DemonSlayer_Chapter10 = "DemonSlayer_Chapter9",
        DemonSlayer_RangerStage1 = "DemonSlayer_Chapter10",
        DemonSlayer_RangerStage2 = "DemonSlayer_Chapter10",
        DemonSlayer_RangerStage3 = "DemonSlayer_Chapter10",
        --//Naruto
        Naruto_Chapter1 = "DemonSlayer_Chapter10",
        Naruto_Chapter2 = "Naruto_Chapter1",
        Naruto_Chapter3 = "Naruto_Chapter2",
        Naruto_Chapter4 = "Naruto_Chapter3",
        Naruto_Chapter5 = "Naruto_Chapter4",
        Naruto_Chapter6 = "Naruto_Chapter5",
        Naruto_Chapter7 = "Naruto_Chapter6",
        Naruto_Chapter8 = "Naruto_Chapter7",
        Naruto_Chapter9 = "Naruto_Chapter8",
        Naruto_Chapter10 = "Naruto_Chapter9",
        Naruto_RangerStage1 = "Naruto_Chapter10",
        Naruto_RangerStage2 = "Naruto_Chapter10",
        Naruto_RangerStage3 = "Naruto_Chapter10",
        --//OPM
        OPM_Chapter1 = "Naruto_Chapter10",
        OPM_Chapter2 = "OPM_Chapter1",
        OPM_Chapter3 = "OPM_Chapter2",
        OPM_Chapter4 = "OPM_Chapter3",
        OPM_Chapter5 = "OPM_Chapter4",
        OPM_Chapter6 = "OPM_Chapter5",
        OPM_Chapter7 = "OPM_Chapter6",
        OPM_Chapter8 = "OPM_Chapter7",
        OPM_Chapter9 = "OPM_Chapter8",
        OPM_Chapter10 = "OPM_Chapter9",
        OPM_RangerStage1 = "OPM_Chapter10",
        OPM_RangerStage2 = "OPM_Chapter10",
        OPM_RangerStage3 = "OPM_Chapter10"
    },
    WebhookImageLink = {
        --//Game
        Game = "https://media.discordapp.net/attachments/1367832741508415518/1367836128987582535/Nexavial_ARX.png?ex=6816082a&is=6814b6aa&hm=78d2028287522da88e22b1cb33f35cdc8220168957d4e74de5c9f7b760a3f1e5&=&format=webp&quality=lossless",
        --//Normal
        OnePiece = "https://media.discordapp.net/attachments/1367832741508415518/1367833302035337257/Nexavial_Voocha_Village.png?ex=68160588&is=6814b408&hm=b4c877dea9f3d2b4770f221e2913c55a67fb97c9ee7aa474716aef5ca4a21376&=&format=webp&quality=lossless",
        Namek = "https://media.discordapp.net/attachments/1367832741508415518/1367833302387527831/Nexavial_Green_Planet.png?ex=68160588&is=6814b408&hm=95a5a9af058c50df5c7b0c49c0f9fa4ad3e418808010c62c44ced31f013bf3a3&=&format=webp&quality=lossless",
        DemonSlayer = "https://media.discordapp.net/attachments/1367832741508415518/1367833302886518805/Nexavial_Demon_Forest.png?ex=68160588&is=6814b408&hm=486f4bfecacf30f9459679d86a71474ace417c218649a7a4f41204ec2d3dcab3&=&format=webp&quality=lossless",
        Naruto = "https://media.discordapp.net/attachments/1367832741508415518/1367833304073768990/Nexavial_Leaf_Village.png?ex=68160588&is=6814b408&hm=ae7be24ccacb455a6b2c0eda8aecb55bd82b72a38899e10c436aa9da99f2a083&=&format=webp&quality=lossless",
        OPM = "https://media.discordapp.net/attachments/1367832741508415518/1367833303503212634/Nexavial_Z_City.png?ex=68160588&is=6814b408&hm=4970928ca8010d09378a4a2c690e031f0cd1b5910dbba6605d5cc3f731990941&=&format=webp&quality=lossless",
        --//Event
        EasterEgg = "https://media.discordapp.net/attachments/1367832741508415518/1367834629909905458/Nexavial_Easter_Event.png?ex=681606c4&is=6814b544&hm=12bae9e62756080258face4795332a4b70df26367fe20c0715f2197c0737a61d&=&format=webp&quality=lossless&width=550&height=293"
    }
}
local H = {
    {},
    {}
}
GameData.__index = GameData
for i,v in next, GameData.Story do
    H[2][i] = v.Name
    H[1][v.Name] = i
end
function GameData:ConvertWorld(n)
    return H[1][n] or H[2][n] or nil
end
function GameData:AdjustYSizeOffset(p, x, y)
    local i = x / y
	local v = p.AbsoluteSize.X
	return v / i
end
function GameData:AddImageList(p, x, y)
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
        GameData.Dropdowns.Ranger[v.Name] = {
            Type = "Dropdown",
            List = {
                "Ranger Stage 1",
                "Ranger Stage 2",
                "Ranger Stage 3"
            },
            Multi = true,
            DropdownTitle = "Select Ranger Stage",
            DefaultDropdown = {
                "Ranger Stage 1",
                "Ranger Stage 2",
                "Ranger Stage 3"
            },
            LayoutOrder = v.LayoutOrder
        }
        GameData.Dropdowns.Challenge[v.Name] = {
            Type = "Dropdown",
            List = GameData.ChallengeList,
            Multi = true,
            DropdownTitle = "Select Ignore Challenge",
            LayoutOrder = v.LayoutOrder
        }
        GameData.Dropdowns.Image.Story[v.Name] = {
            Color = true,
            MaxWidthXYSize = GameData:AdjustYSizeOffset(p, x, y),
            Image = v.Image,
            BackgroundTransparency = 1
        }
    end
end
return GameData
