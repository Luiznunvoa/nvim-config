local M = {}

M.setup = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
        [[                                                                       ]],
        [[                                                                     ]],
        [[       ████ ██████           █████      ██                     ]],
        [[      ███████████             █████                             ]],
        [[      █████████ ███████████████████ ███   ███████████   ]],
        [[     █████████  ███    █████████████ █████ ██████████████   ]],
        [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
        [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
        [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
        [[                                                                       ]],
    }

    dashboard.section.buttons.val = {
        dashboard.button("e", "󰔶   New File", ":ene <BAR> startinsert <CR>"),
        dashboard.button("d", "󰝤   Search Files", ":edit .<CR>"),
        dashboard.button("q", "   Quit", ":qa<CR>"),
    }

    alpha.setup(dashboard.opts)
end

return M

