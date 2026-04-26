return {
  {
    "hrsh7th/nvim-cmp",
    version = "v0.0.2",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      luasnip.config.setup({})
      vim.o.completeopt = "menu,menuone,noselect"

      local function has_words_before()
        if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
          return false
        end

        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        if col == 0 then
          return false
        end

        local text = vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
        return text:sub(col, col):match("%s") == nil
      end

      local function accept_copilot()
        if vim.fn.exists("*copilot#Accept") ~= 1 then
          return false
        end

        local ok, key = pcall(vim.fn["copilot#Accept"], "")
        if not ok or type(key) ~= "string" or key == "" then
          return false
        end

        vim.fn.feedkeys(key, "")
        return true
      end

      local function select_next_or_complete()
        if cmp.visible() then
          cmp.select_next_item()
        else
          cmp.complete()
        end
      end

      local function select_prev_or_fallback(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end

      local function tab_complete(fallback)
        if cmp.visible() then
          local entry = cmp.get_selected_entry()
          if entry then
            cmp.confirm({
              behavior = cmp.ConfirmBehavior.Replace,
              select = false,
            })
          elseif accept_copilot() then
            return
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            cmp.select_next_item()
          end
        elseif accept_copilot() then
          return
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end

      local function shift_tab_complete(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
          }),
          ["<Tab>"] = cmp.mapping(tab_complete, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(shift_tab_complete, { "i", "s" }),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "nvim_lsp_signature_help" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        },
      })

      local cmdline_mapping = cmp.mapping.preset.cmdline({
        ["<Tab>"] = {
          c = function()
            select_next_or_complete()
          end,
        },
        ["<S-Tab>"] = {
          c = function(fallback)
            select_prev_or_fallback(fallback)
          end,
        },
      })

      cmp.setup.cmdline("/", {
        mapping = cmdline_mapping,
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmdline_mapping,
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })
    end,
  },
}
