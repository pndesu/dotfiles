return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
        local npairs = require('nvim-autopairs')
        npairs.setup({
            enable_check_bracket_line = false,
        })
        
        -- Add rule for < >
        local Rule = require('nvim-autopairs.rule')
        npairs.add_rules({
            Rule('<', '>'),
        })
    end
}
