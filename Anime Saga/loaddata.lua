local Data = {
    Part = nil,
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
