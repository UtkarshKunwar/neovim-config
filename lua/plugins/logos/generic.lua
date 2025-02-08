local logos = {
    {
        [[           ░▓▓░           ]],
        [[        ░▓██▓███▓         ]],
        [[       ░██░░██▓░█▓▓       ]],
        [[    ▒█▒    ░██░    ▓█▒    ]],
        [[  ▒█▒       ▓█▒      ▓█░  ]],
        [[░█▒▓█▒      █▓         ██░]],
        [[▓█░   ░▓█░ ▓██░        ▒█▒]],
        [[  ██░   ░██▒██       ░█▓  ]],
        [[    █▓░   ░███░    ░█▓    ]],
        [[       ▒█▒    ▒█▓█░       ]],
        [[       ▒█▒█▒    ▓█▒       ]],
        [[     ░█▒   ▓█░    ▓█░     ]],
        [[ ░██░      ░██░██░   ░██  ]],
        [[▓█░        ░██  ░█▓░   ░█▓]],
        [[██         ░██    ░█▓   ██]],
        [[ ░█▓       ░██       ▓▓█░ ]],
        [[    ▒█▒    ░██     ▒█░    ]],
        [[     ░▒█▒  ░██   ▒█▒      ]],
        [[        ░▓███▓██▒         ]],
        [[           ▒█▓▒           ]],
    },
    {
        [[              ██             ]],
        [[             ████            ]],
        [[            █████            ]],
        [[           ███  █▒▓          ]],
        [[          ███     ██         ]],
        [[         ███      ███        ]],
        [[        ███░       ███       ]],
        [[       ███          ███      ]],
        [[      ████           ███     ]],
        [[     ████            ████    ]],
        [[ ██████                ██████]],
        [[   ████                ████  ]],
        [[      ███            ░███    ]],
        [[  ██     █         █▒     ██ ]],
        [[    ████      ██       ███   ]],
        [[       ░███████████████      ]],
    },
    {
        "   ░                          ░   ",
        "   ██                       ███   ",
        "   ████                  ███ ██   ",
        "█████▓▓██████████████████    █████",
        "██░▓▓▒▒▓▓▒▒▒▒▒▒░░▒▒▒▒▒  ▒▒▒    ░██",
        "██░▓▓▒▒▓▓▒▒▒▓▒▒░░  ░▒▒▒ ░▒     ░██",
        "██▒▒▒▓▓▒▒▓▒▒▒▓     ▒  ▒▒▒    ▒▒ ██",
        "██░▒▒▓▓▒▒▓▓▓ ▒▒░░▒▒▒  ▒▒     ▒▒░██",
        "██░▒▒▒▒░░▒▒▒▒    ▒▒ ░░ ▒  ░▒▒▒▒░██",
        "██░▒▒▒▒▒▒▓▒▒  ▒░░▒▒ ▒▒ ▒  ▒▒▒▒▒░██",
        "██░▒▒▒▒▒▒▓▓▓ ▒   ▒▒▒   ▒▒▒▒  ▒▒░██",
        "██░▒▒▒▒▒▒▒▒▒ ▒▒░░▒▒ ░░▒   ░▒▒▒▒░██",
        "█████░░▒▒▒▒▒ ▒▒░░   ▒▒ ▒▒▒░░░█████",
        "     ██▒▒▒  ░      ░▒▒▒▒░░███     ",
        "       ░░▒   ▒   ▒▒▓▓▓░░██        ",
        "         ███░▒▒░░▒▒░██▓▓█         ",
        "     ████    ██░░██    ████       ",
        "               ██                 ",
    },
    {
        "                                   ",
        "                                   ",
        "                                   ",
        "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
        "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
        "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
        "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
        "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
        "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
        "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
        " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
        " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
        "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
        "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
        "                                   ",
    },
    {
        [[            ██████            ]],
        [[        ████▒▒▒▒▒▒████        ]],
        [[      ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒██      ]],
        [[    ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██    ]],
        [[  ██▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒      ]],
        [[  ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▓▓▓▓  ]],
        [[  ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▒▒▓▓  ]],
        [[██▒▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒    ██]],
        [[██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██]],
        [[██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██]],
        [[██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██]],
        [[██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██]],
        [[██▒▒██▒▒▒▒▒▒██▒▒▒▒▒▒▒▒██▒▒▒▒██]],
        [[████  ██▒▒██  ██▒▒▒▒██  ██▒▒██]],
        [[██      ██      ████      ████]],
    },
    {
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣤⣤⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣤⣤⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣤⣤⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⣠⣶⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⣠⣶⣿⣿⣿⣿⣿⣿⣿⣿⣶⣄⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⣿⣿⣿⡆⠀⠀⠀⢸⣿⣿⠿⠿⢿⣿⣿⣿⣿⡿⠿⠿⣿⣿⡇⠀⠀⠀⣾⣿⣿⡿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀",
        "⠀⠀⠀⠀⢿⣿⠿⠿⠿⠿⣿⣿⣿⡏⠀⠀⠀⢹⣿⡇⠀⠀⠀⢸⣿⢱⣶⣴⣶⢹⣿⣿⡏⣶⣦⣶⡎⣿⡇⠀⠀⠀⢿⣿⠁⠀⠀⠈⣿⣿⣿⡿⠟⣋⣽⣿⣿⠇⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠘⣿⣧⣄⣀⣴⣿⣿⣿⣷⣄⣀⣠⣾⣟⠀⠀⠀⠀⠈⣿⣦⣙⣛⣡⣾⡿⢿⣷⣌⣛⣋⣴⣿⠁⠀⠀⠀⠘⣿⣦⣄⣀⣴⣿⣿⣿⣿⣶⣶⣤⣿⡟⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣏⣼⣌⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣰⣆⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠈⢿⣿⣿⣿⣿⣏⣼⣌⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠉⠉⢿⣿⣿⣿⣿⣿⣿⡏⠉⠁⠀⠀⠀⠀⠀⠀⠀⠉⠉⢹⣿⣿⣿⣿⣿⣿⡏⠉⠉⠀⠀⠀⠀⠀⠀⠀⠉⠉⣿⣿⣿⣿⣿⣿⣿⡏⠉⠁⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠁⠁⠁⠉⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠁⠉⠉⠈⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠁⠁⠁⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    },
    {
        [[             ▓██████████               ]],
        [[         ███████  █▒    ▒████          ]],
        [[      ███░   ░  ██ ▓    ▒███▒ ░█▓      ]],
        [[    ████     ▓   ▒█░    █▓   ░   █     ]],
        [[ ████       ▒██  ░███ ██         ▓ ██  ]],
        [[ █████████▓▓████████░██████       ▒▒███]],
        [[ █▒███      ▓██████▒    ░███▓█████████░]],
        [[██      █  █▓██  ▒   ██    █ █   ██▒░▒ ]],
        [[██       ░█▓ ██ ███  ▒██   █  █ ██   █ ]],
        [[██   ███▓   ███  ███ ██░   █ █████   ▓ ]],
        [[██████       ██            ██      ███ ]],
        [[ ████▓█████▓▒███████▒▓  ██████████████▓]],
        [[  █░  ░      ▓█   ██  ███  ▓▓      ▒ ░ ]],
        [[     ███      █▒████▒ ██   ▓     ██    ]],
        [[      ███░   ▓████     ▒█▒ ▓   ▒██▒    ]],
        [[       ▓███░████░        ███████▒      ]],
        [[            ▒▒░ ▓█▒▒▒███               ]],
    },
    {
        [[                               ░▒▒ ▒▓██░ ░  ]],
        [[                             ▒██▓░▓███▒░▓▒  ]],
        [[                     ░░ ▒   ▓██▓░▒████░▓█▒  ]],
        [[            ░▒▓███████▒▒██░▓███▓░████▒░█▓█▓░]],
        [[         ▒████████████▒███▒████▓▒████▒▒▒ ▒█▒]],
        [[     ░█████████████▓█████▒█████░▓███▓░   ▒██]],
        [[    ░██████████████████▓▒█████▓▒████▒    ▒██]],
        [[    ████████████████████████▓░█████▒   ░███▒]],
        [[   ░███████████████████████▒▓█████▓   ▒███▓░]],
        [[    ▒██▓░      █████████████████▒░▒▓████▓░  ]],
        [[    ░█░        ████████████████████████░    ]],
        [[                ░▓████████████████▒         ]],
        [[                   ░▒▓████████▓▒░           ]],
        [[                ░▒██████▒░                  ]],
        [[      ░▒░     ░██████▒                      ]],
        [[    ▓███▓█████▓░                            ]],
        [[  ░▓███████▒░                               ]],
        [[ ▒██▓░                                      ]],
        [[▒▒░                                         ]],
    },
    {
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡖⠁⠀⠀⠀⠀⠀⠀⠈⢲⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⣼⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣧⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[⠀⠀⠀⠀⠀⠀⠀⣸⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣇⠀⠀⠀⠀⠀⠀⠀ ]],
        [[⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇⠀⢀⣀⣤⣤⣤⣤⣀⡀⠀⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀ ]],
        [[⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣔⢿⡿⠟⠛⠛⠻⢿⡿⣢⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀ ]],
        [[⠀⠀⠀⠀⣀⣤⣶⣾⣿⣿⣿⣷⣤⣀⡀⢀⣀⣤⣾⣿⣿⣿⣷⣶⣤⡀⠀⠀⠀⠀ ]],
        [[⠀⠀⢠⣾⣿⡿⠿⠿⠿⣿⣿⣿⣿⡿⠏⠻⢿⣿⣿⣿⣿⠿⠿⠿⢿⣿⣷⡀⠀⠀ ]],
        [[⠀⢠⡿⠋⠁⠀⠀⢸⣿⡇⠉⠻⣿⠇⠀⠀⠸⣿⡿⠋⢰⣿⡇⠀⠀⠈⠙⢿⡄⠀ ]],
        [[⠀⡿⠁⠀⠀⠀⠀⠘⣿⣷⡀⠀⠰⣿⣶⣶⣿⡎⠀⢀⣾⣿⠇⠀⠀⠀⠀⠈⢿⠀ ]],
        [[⠀⡇⠀⠀⠀⠀⠀⠀⠹⣿⣷⣄⠀⣿⣿⣿⣿⠀⣠⣾⣿⠏⠀⠀⠀⠀⠀⠀⢸⠀ ]],
        [[⠀⠁⠀⠀⠀⠀⠀⠀⠀⠈⠻⢿⢇⣿⣿⣿⣿⡸⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠈⠀ ]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[⠀⠀⠀⠐⢤⣀⣀⢀⣀⣠⣴⣿⣿⠿⠋⠙⠿⣿⣿⣦⣄⣀⠀⠀⣀⡠⠂⠀⠀⠀ ]],
        [[⠀⠀⠀⠀⠀⠈⠉⠛⠛⠛⠛⠉⠀⠀⠀⠀⠀⠈⠉⠛⠛⠛⠛⠋⠁⠀⠀⠀⠀⠀ ]],
    },

    {
        [[=================     ===============     ===============   ========  ========]],
        [[\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //]],
        [[||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||]],
        [[|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||]],
        [[||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||]],
        [[|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||]],
        [[||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||]],
        [[|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||]],
        [[||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||]],
        [[||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||]],
        [[||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||]],
        [[||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||]],
        [[||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||]],
        [[||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||]],
        [[||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||]],
        [[||.=='    _-'                                                     `' |  /==.||]],
        [[=='    _-'                                                            \/   `==]],
        [[\   _-'                                                                `-_   /]],
        [[ `''                                                                      ``' ]],
    },

    {
        [[  ／|_       ]],
        [[ (o o /      ]],
        [[  |.   ~.    ]],
        [[  じしf_,)ノ ]],
    },

    {
        [[          ▀████▀▄▄              ▄█ ]],
        [[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
        [[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
        [[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
        [[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
        [[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
        [[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
        [[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
        [[   █   █  █      ▄▄           ▄▀   ]],
    },
    {
        [[⠀⠀⠀⠀⠀⠀⠀⢀⠀⠔⡀⠀⢀⠞⢰⠂⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⢸⠘⢰⡃⠔⠩⠤⠦⠤⢀⡀⠀⠀⠀⠀⠀]],
        [[⠀⠀⢐⡡⠔⠁⠆⠀⠀⠀⠀⠀⢀⠠⠙⢆⠀⠈⢁⠋⠥⣀⣀]],
        [[⠈⠉⠀⣰⠀⠀⠀⠀⡀⠀⢰⣆⢠⠠⢡⡀⢂⣗⣖⢝⡎⠉⠀]],
        [[⠀⠀⢰⣜⠘⡀⢡⠰⠳⣎⢂⣟⡎⠘⣬⡕⣈⣼⠢⠹⡟⠇⠀]],
        [[⠀⠠⢋⢿⢳⢼⣄⣆⣦⣱⣿⣿⣿⣷⠬⣿⣿⣿⣿⠑⠵⠀⠀]],
        [[⠀⠀⠀⡜⢩⣯⢝⡀⠁⠀⠙⠛⠛⠃⠀⠈⠛⠛⡿⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⢀⣀⡇⠀⠑⠀⠀⠀⠀⠐⢄⠄⢀⡼⠃⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⢸⣿⣷⣤⣀⠈⠲⡤⣀⣀⠀⡰⠋⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⢀⣾⣿⣿⣿⣿⣻⢿⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⡠⠟⠁⠙⠟⠛⠛⢿⣿⣾⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀]],
    },
    {
        [[⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣶⡋⠉⠙⠒⢤⡀⠀⠀⠀⠀⠀⢠⠖⠉⠉⠙⠢⡄⠀]],
        [[⠀⠀⠀⠀⠀⠀⢀⣼⣟⡒⠒⠀⠀⠀⠀⠀⠙⣆⠀⠀⠀⢠⠃⠀⠀⠀⠀⠀⠹⡄]],
        [[⠀⠀⠀⠀⠀⠀⣼⠷⠖⠀⠀⠀⠀⠀⠀⠀⠀⠘⡆⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⢷]],
        [[⠀⠀⠀⠀⠀⠀⣷⡒⠀⠀⢐⣒⣒⡒⠀⣐⣒⣒⣧⠀⢰⠀⠀⢠⢤⢠⡠⠀ ⢸]],
        [[⠀⠀⠀⠀⠀⢰⣛⣟⣂⠀⠘⠤⠬⠃⠰⠑⠥⠊⣿⠀⢸⠀⠀⠓⠃⠋⠂⠀ ⢸]],
        [[⠀⠀⠀⠀⠀⢸⣿⡿⠤⠀⢸⠁⠀⠀⢀⡆⠀⠀⣿⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⣸]],
        [[⠀⠀⠀⠀⠀⠈⠿⣯⡭⠀⠸⡀⠀⢀⣀⠀⠀⠀⡟⠀⠀⢸⠀⠀⠀⠀⠀⠀⢠⠏]],
        [[⠀⠀⠀⠀⠀⠀⠀⠈⢯⡥⠄⢱⠀⠀⠀⠀⠀⡼⠁⠀⠀⠀⠳⢄⣀⣀⣀⡴⠃⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⢱⡦⣄⣀⣀⣀⣠⠞⠁⠀⠀⠀⠀⠀⠀⠈⠉⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⠛⠃⠀⠀⠀⢹⠳⡶⣤⡤⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⣠⢴⣿⣿⣿⡟⡷⢄⣀⣀⣀⡼⠳⡹⣿⣷⠞⣳⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⢰⡯⠭⠹⡟⠿⠧⠷⣄⣀⣟⠛⣦⠔⠋⠛⠛⠋⠙⡆⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⢸⣿⠭⠉⠀⢠⣤⠀⠀⠀⠘⡷⣵⢻⠀⠀⠀⠀⣼⠀⣇⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⡇⣿⠍⠁⠀⢸⣗⠂⠀⠀⠀⣧⣿⣼⠀⠀⠀⠀⣯⠀⢸⠀⠀⠀⠀⠀⠀⠀]],
    },
    {
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣶⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⠙⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡾⣿⠀⠀⣸⣥⣸⠇⠀⠙⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣶⡇⠀⣴⡟⢸⢻⣀⢾⡿⣿⡿⠀⡀⠀⣞⢆⠀⠀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⠀⠀⣸⠏⡇⢸⣿⠇⠀⡼⣯⡿⠁⢸⠀⡇⣾⠀⠀⠀⣿⢹⡞⢹⣇⠀⣠⢾⣿⡇⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⣸⢏⢧⢀⣿⢠⡇⢺⣿⠀⣸⢡⡿⣁⠀⡘⠀⡇⣿⠀⠀⠀⡏⣾⡇⢸⠸⡞⣍⣿⢹⡇⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⢾⣿⢧⡀⣼⡇⠘⡄⢹⣿⣼⠸⠀⢳⣻⡟⠀⡾⠁⠀⡇⠀⣿⡄⠀⢀⣾⡿⢃⡄⢸⠀⠀⢏⣰⡅⢹⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠘⣧⢻⢿⣿⠀⠀⢹⡀⢻⣻⠀⠃⠈⢿⡗⢠⣿⠀⠰⠇⠀⢸⢧⣴⣿⠋⢡⣿⠀⣼⠀⠀⠸⣇⠇⣸⠀⠀⠀⠀⠀⠀]],
        [[⢠⣄⠀⠀⠀⢱⣸⠀⡇⢠⠀⠀⠃⠹⡝⣄⠀⢸⣿⣿⡫⠀⠀⠀⠀⣸⣿⢧⣾⠏⠀⢁⡎⠀⠀⠀⢠⣇⡞⡞⣀⢤⣴⣾⢽⡟]],
        [[⠈⣿⣷⢄⡀⠈⢿⢸⣧⠈⢧⠀⠀⠀⠹⣎⠳⣼⣿⣏⣯⡆⠀⠀⢀⣿⣿⣿⠃⠀⠀⣼⠀⠀⡴⢠⣿⡟⣺⡯⠟⣩⠜⢁⡜⠀]],
        [[⠀⠀⢷⡝⣍⠳⣄⠸⣿⡀⢷⡈⢣⣠⣤⣤⣾⡿⠋⢁⣶⣶⣿⠋⢀⡤⠤⣀⣿⣏⡁⢻⣦⠃⡼⣼⡜⠁⠚⢁⡴⢁⡜⠁⠀⠀]],
        [[⠀⠀⠀⠀⠈⠻⣝⢦⣌⣻⣿⠁⠀⣾⡏⢠⠃⡴⣻⡿⡰⠃⣠⠞⠀⠀⠀⠀⢹⡟⠃⢀⣎⣏⢇⢸⣮⣿⢥⣴⣾⡿⠃⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⢤⣌⣓⣿⣿⣿⡀⢸⣿⡇⣸⡿⠀⢸⡿⢁⡔⠋⠀⠀⠀⢀⡠⢾⣧⣆⢎⣾⣿⣿⣿⣀⣬⠝⡿⠋⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠈⠪⣙⢿⢹⣿⣿⣿⣟⠉⢳⣿⣧⣄⣸⡶⣎⣠⣶⣽⡾⠟⣫⠻⢿⣿⢀⣿⡿⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⣳⣝⣿⣟⠻⠭⠭⠵⠶⠯⠟⡛⠛⡛⢒⣒⣉⡉⠁⢠⢟⣿⠾⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⢯⡱⡄⠀⠀⠀⢛⣦⣆⡀⠀⠀⠀⠀⡞⠈⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡤⡞⠀⢨⢿⣾⣄⠀⠀⠹⣶⠶⠁⠀⢀⣴⢯⠀⠈⡗⠢⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠈⢷⣎⣠⠛⢁⣀⡤⠤⠴⠧⢼⣆⣈⢣⡘⠆⣠⠞⢰⠃⣀⣀⣀⣀⡀⠈⠳⢅⣶⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠑⠒⠢⠬⠤⠤⠤⠤⠤⠤⠼⠭⠤⠤⠅⠒⠒⠚⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
    },
    {
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⣠⣄⠀⢻⣿⣿⣿⣿⣿⡿⠀⣠⣄⠀⠀⠀⢻⣿⣿⣏⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⠀⠀⠀⠀⠰⣿⣿⠀⢸⣿⣿⣿⣿⣿⡇⠀⣿⣿⡇⠀⠀⢸⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣷⣤⣄⣀⣠⣤⣾⣿⣿⣿⣿⣽⣿⣿⣦⣄⣀⣀⣤⣾⣿⣿⣿⣿⠃⠀⠀⢀⣀⠀⠀]],
        [[⠰⡶⠶⠶⠶⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠛⠉⠉⠙⠛⠋⠀]],
        [[⠀⠀⢀⣀⣠⣤⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠷⠶⠶⠶⢤⣤⣀⠀]],
        [[⠀⠛⠋⠉⠁⠀⣀⣴⡿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⣤⣀⡀⠀⠀⠀⠀⠘⠃]],
        [[⠀⠀⢀⣤⡶⠟⠉⠁⠀⠀⠉⠛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⠉⠀⠀⠀⠉⠙⠳⠶⣄⡀⠀⠀]],
        [[⠀⠀⠙⠁⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠁⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
    },
    {
        [[⠀⠀⢀⣤⣤⣤⣤⣤⣤⣀⡀⠀⠀⢀⣀⠄⠀⠀⣀⣠⣤⡤⠤⠀⠀⠀⠀⠀]],
        [[⡼⠋⠁⠀⠈⠉⠙⠛⠛⠉⣡⣿⡟⠀⠀⣼⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿⠁⠀⠀⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⠀⠀⠀⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⢀⣤⣶⣶⣶⣿⣿⣿⣿⡇⠀⠀⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠈⠉⠉⠙⢿⣿⣿⣿⣿⡇⠀⠀⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠶⢶⣶⣾⣿⣿⣿⠁⠀⢠⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⡏⠀⢀⣾⣿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⡿⠀⢀⣾⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⢀⣾⡟⢁⣴⣟⣡⣤⣤⣶⣶⣶⣶⣶⣦⣤⣀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⢠⣾⣟⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣴⠞]],
        [[⠀⠀⠀⠀⢀⣴⡿⠿⠛⠛⠋⠉⠉⠉⠉⠉⠉⠛⠛⠿⣿⣿⣿⣿⣿⠟⠁⠀]],
        [[⠀⠀⠀⠘⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⠟⠁⠀⠀⠀]],
    },
    {
        [[⠀⠀⠀⠀⠀⠀⢀⡤⠂⠀⠀⠀⢀⣀⣤⠔⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠢⣤⣀⠀⠀⠀⠀⠐⣤⡀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⣠⣾⡿⠁⢀⣴⣾⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣷⣄⠀⠘⣿⣷⡀⠀⠀⠀⠀]],
        [[⠀⢰⣿⣿⡏⠀⠀⠀⠀⠘⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡿⠀⠀⠀⠀⠀⣿⣿⣷⠀⠀]],
        [[⠀⣿⣿⣿⠃⠀⠀⠀⠀⠀⢹⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⣤⠀⠠⣤⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⠇⠀⠀⠀⠀⠀⢸⣿⣿⣇⠀]],
        [[⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠀⠀⠀⣠⣤⣤⣤⣬⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣥⣤⣤⣄⡀⠀⠀⠈⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣧]],
        [[  ⣿⣿⣿⣿⣤⣤⣤⣄⣀⠀⣀⣴⣿⣿⣿⡿⠿⣛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣻⡿⢿⣿⣿⣷⣄⡀⠀⠀⠀⣀⣠⣤⣤⣼⣿⣿⣿⡏]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⢀⣴⣿⣿⣿⠿⢋⣵⣾⣿⣿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣷⣭⡛⢿⣿⣿⣷⣄⠈⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⡿⠟⢁⣶⣿⣿⡿⠋⠁ ⣼⣿⣿⣿⣿⣿⣿⣿⣿⡄⠈⠻⣿⣿⣿⣦⠉⠻⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[     ⠀  ⣿⣿⣿⡿⠋⠁⠀⢸⣿⣿⡇⠀⠀ ⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⣿⣿⣿⡇⠀ ⠙⢿⣿⣿⡇       ⠀]],
        [[⠀       ⣿⣿⣿⣿⠀⠀⠀⢸⣿⣿⡇⠀⠀ ⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⣿⣿⣿⡇⠀⠀⠀⢸⣿⣿⣿⡇⠀      ]],
        [[⠀       ⢸⣿⣿⣿⡀⠀ ⢸⣿⣿⣿⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⢸⣿⣿⣿⡇⠀      ]],
        [[⠀       ⢸⣿⣿⣿⡇⠀⠀⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⡿⠃⠀⠀⠀⠀⢠⣿⣿⣿⡇⠀⠀⠀⣾⣿⣿⣿⠀⠀      ]],
        [[⠀⠀⠀⠀⠀    ⠻⣿⣿⣿⡄⠀⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⢰⣿⣿⣿⣿⡟⠀⠀⣰⣿⣿⡿⠋⠀⠀⠀   ⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀   ⠀⠀⠉⠛⠂⠀⠹⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⣸⣿⣿⣿⣿⠃⠀⠀⠚⠋⠁⠀⠀⠀⠀⠀⠀⠀  ⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣷⡀⠀⠀ ⠀⠀ ⠀⠀⠀⢠⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⢿⡄⠀⠀  ⠀⠀⠀⣰⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠂⠀⠀  ⠀⠚⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
    },
}

return logos
