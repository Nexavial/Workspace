local Data = {
    Part = nil,
    Image = {
        Webhook = {
            Game = "https://media.discordapp.net/attachments/1373813492892565645/1373813508797370409/AS_GAME.png?ex=682bc708&is=682a7588&hm=a3dca6e1770b61b653aaa7db45ecfa1342f635410eb7fa9f02b3a57cc339c272&=&format=webp&quality=lossless",
            Raid1 = "https://media.discordapp.net/attachments/1373813492892565645/1373814289521053786/AS_Raid1.png?ex=682bc7c2&is=682a7642&hm=3463d697b9a46598762ec43b350fc2f7b38352f42b13a4f80023d072dfb4c083&=&format=webp&quality=lossless&width=939&height=561",
            Story1 = "https://media.discordapp.net/attachments/1373813492892565645/1373814289147887697/AS_Story1.png?ex=682bc7c2&is=682a7642&hm=ad3ab6ccf41e62a6c4418f93c352188b40cc6b0b3afd82648701ca3f3659ef89&=&format=webp&quality=lossless",
            Story2 = "https://media.discordapp.net/attachments/1373813492892565645/1373814288786915399/AS_Story2.png?ex=682bc7c2&is=682a7642&hm=340706bf95a0e1c2129be74d9809beeb19bbdd675ae205c17c0369e894044e4d&=&format=webp&quality=lossless",
            Story3 = "https://media.discordapp.net/attachments/1373813492892565645/1373814288443117661/AS_Story3.png?ex=682bc7c2&is=682a7642&hm=2e4ef86edb93da0faf1d512440647c5005c521d4e3c195edf31680cca5071264&=&format=webp&quality=lossless&width=914&height=561",
            Story4 = "https://media.discordapp.net/attachments/1373813492892565645/1373814288136798238/AS_Story4.png?ex=682bc7c2&is=682a7642&hm=ea8521296299630a85aee1b8f278fee3553f682d2747b0a84a72f0144feae603&=&format=webp&quality=lossless"
        }
    },
    Skill = {
        Infinite = {
                Boss = {
                    ["Magma Boss"] = {1},
                    ["Smoke Boss"] = {3},
                    ["White Whale"] = {2,4, Size = Vector3.new(0,2,2)},
                    ["Lower Moon One"] = {2,4},
                    ["Upper Moons Six"] = {1, Size = Vector3.new(0,35,35)},
                    ["Gaaro Half Beast"] = {3}
                }
            },
            Delay = {
                --[[["SSS"] = {
                    ["White Whale"] = {Time = 3, Size = 160, Ignore = true}
                },
                ["Sand"] = {
                    ["Smoke Boss"] = {Time = 4, Size = 100},
                    ["Gaaro Half Beast"] = {Time = 4, Size = 65.5}
                },
                ["Lava"] = {
                    ["MagmaBoss"] = {Time = 4, Size = 65.5}
                },
                ["SmokeSkill"] = {
                    ["Lower Moon One"] = {Time = 4, Size = 65.5}
                },
                ["LashSlash"] = {
                    ["Upper Moons Six"] = {Time = 2, Size = 85}
                }]]
            },
            Horizontal = {
                --[[["SmokeSkill3"] = {
                    ["Smoke Boss"] = {Time = 0.75, Size = 120, Width = 25}
                }]]
            }
        },
        World = {
            Raid = {
                {
                    WorldRaid1 = {
                        Size = {
                            X = 1024, Y = 612
                        },
                        Image = "109550615151833",
                        WorldName = "Foggy Night Mansion",
                        LayoutOrder = 1
                    }
                },
                {},
                {},
                {},
                {}
            },
            Story = {
                {
                    World1 = {
                        Size = {
                            X = 1023, Y = 479
                        },
                        Image = "125489162871112",
                        WorldName = "Leaf Village",
                        LayoutOrder = 1
                    },
                    World2 = {
                        Size = {
                            X = 1023, Y = 479
                        },
                        Image = "132940797184270",
                        WorldName = "Marine Island",
                        LayoutOrder = 2
                    },
                    World3 = {
                        Size = {
                            X = 1023, Y = 628
                        },
                        Image = "112923551132572",
                        WorldName = "Red Light District",
                        LayoutOrder = 3
                    },
                    World4 = {
                        Size = {
                            X = 1023, Y = 479
                        },
                        Image = "134241261544793",
                        WorldName = "West City",
                        LayoutOrder = 4
                    },
                },
                {},
                {},
                {},
                {}
            }
        },
        Barrier = {
            "Workspace.Map.Door",
            "Workspace.Map.Props",
            "Workspace.Map.House",
            "Workspace.Map.Barrier",
            "Workspace.Map.ForceField",
            "Workspace.Map.Structures.Buildings"
        }
};Data.__index = Data;return Data
