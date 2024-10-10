local M = {}

-- -- https://www.youtube.com/watch?v=mh_EJhH49Ms (~8:30)
-- M.dap = {
--     n = {
--         ["<leader>db"] = {
--             "<cmd> DapToggleBreakpoint <CR>",
--             "Toggle breakpoint"
--         },
--         ["<leader>dus"] = {
--             function()
--                local widgets = require('dap.ui.widgets');
--                local sidebar = widgets.sidebar(widgets.scope);
--                sidebar.open();
--             end,
--         },
--     },
-- }

M.crates = {
    n = {
      ["<leader>wu"] = {
         function()
           require('crates').update_all_crates()
         end, 
         "Update crate"
      },
    },
}

M.copilot = {
  i = {
    ["<C-A>"] = {
      function() vim.fn.feedkeys(vim.fn'copilot#Accept', '') end,
      "Copilot Accept",
      { replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true }
    }
  }
}


return M
