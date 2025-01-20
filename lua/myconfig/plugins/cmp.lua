-- cmp-nvim-lsp loading
local cmp = require "cmp"
cmp.setup {
    sources = {
        {name = 'path'},
        {name = 'nvim_lsp', keyword_length = 1},
        {name = 'buffer',   keyword_length = 3},
        {name = 'luasnip',  keyword_length = 2},
        {name = 'nvim_lsp_signature_help' },
    },
   snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)  -- Use luasnip for snippet expansion
    end,
  },
  mapping = {
    ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
    ['<Down>'] = cmp.mapping.select_next_item(select_opts),

    ['<C-j>'] = require('cmp').mapping.select_next_item(),
    ['<C-k>'] = require('cmp').mapping.select_prev_item(),

    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),

    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-y>'] = cmp.mapping.confirm({select = true}),
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    ['<C-f>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, {'i', 's'}),

    ['<C-b>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {'i', 's'}),

    ['<Tab>'] = cmp.mapping(function(fallback)
      local col = vim.fn.col('.') - 1

      if cmp.visible() then
        cmp.select_next_item(select_opts)
      elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        fallback()
      else
        cmp.complete()
      end
    end, {'i', 's'}),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item(select_opts)
      else
        fallback()
      end
    end, {'i', 's'}),
  },
  completion = {
    completeopt = 'menu,menuone,noinsert,noselect',  -- Avoid inserting suggestions automatically
    keyword_length = 3,  -- Start triggering completion after 3 characters
  },
  preselect = require('cmp').PreselectMode.Item,  -- Automatically select the first item
  sorting = {
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.recently_used,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
  window = {
    completion = {
      max_height = 5,
      col_offset = -3,                     -- Set the column offset
      side_padding = 0,                    -- Set padding
      winhighlight = "Normal:CmpPmenu,CursorLine:CmpPmenuSel,Search:None", -- Highlighting options
    },
    documentation = {
      max_width = 60,                      -- Maximum width of the documentation popup
      max_height = 12,                     -- Maximum height for the documentation
    },
  },
   -- window = {
   --   completion = cmp.config.window.bordered(),
   --   documentation = cmp.config.window.bordered(),
   -- },
   formatting = {
    fields = {'menu', 'abbr', 'kind'},
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = 'λ',
        luasnip = '⋗',
        buffer = 'Ω',
        path = '🖫',
      }

      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
   experimental = {
     ghost_text = true,  -- Show inline suggestions
   },
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').clangd.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    -- Enable signature help and other useful features
    client.default_capabilities.signature_help = true
    -- You can also enable other LSP features here like diagnostics, code actions, etc.
  end,
  -- Optionally, you can add custom clangd settings via `cmd` or `settings`
  cmd = { "clangd", "--completion-style=detailed", "--clang-tidy", "--suggest-missing-includes" },
  -- settings = {
  --   clangd = {
  --     compileFlags = {
  --       add = { "-std=c++11" }  
  --     },
  --   },
  -- },
}

-- -- Set up nvim-cmp
-- cmp.setup({
--   snippet = {
--     expand = function(args)
--       require('luasnip').lsp_expand(args.body)  -- Expand snippets using LuaSnip
--     end,
--   },
--   mapping = {
--     ['<C-j>'] = cmp.mapping.select_prev_item(), -- Select previous suggestion
--     ['<C-k>'] = cmp.mapping.select_next_item(), -- Select next suggestion
--     ['<C-d>'] = cmp.mapping.scroll_docs(-4),    -- Scroll docs up
--     ['<C-f>'] = cmp.mapping.scroll_docs(4),     -- Scroll docs down
--     ['<C-Space>'] = cmp.mapping.complete(),     -- Trigger completion
--     ['<C-e>'] = cmp.mapping.abort(),            -- Abort completion
--     ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm selected item
--   },
--   sources = {
--     { name = 'nvim_lsp' },       -- LSP completion source
--     { name = 'buffer' },         -- Buffer completion source
--     { name = 'path' },           -- Path completion source
--     { name = 'luasnip' },        -- Snippet source
--   },
--   completion = {
--     completeopt = 'menu,menuone,noselect', -- This is important for smooth completion
--   },
--   window = {
--     completion = cmp.config.window.bordered(),
--     documentation = cmp.config.window.bordered(),
--   },
--   experimental = {
--     ghost_text = true,  -- Show inline suggestions
--   },
-- })

-- lspconfig.clangd.setup({
--   capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
--   on_attach = function(client, bufnr)
--     -- Enable signature help on attach
--     client.resolved_capabilities.signature_help = true
--     client.resolved_capabilities.completion = { completionItem = { snippetSupport = true } }
--     -- vim.lsp.buf.signature_help()
--   end,
-- })
