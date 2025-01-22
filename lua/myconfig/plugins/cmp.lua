-- cmp-nvim-lsp loading
local cmp = require "cmp"
cmp.setup {
    sources = {
        {name = 'fuzzy_buffer' },  -- Enable fuzzy scoring from cmp-fuzzy
        {name = 'nvim_lsp', keyword_length = 1},
        {name = 'nvim_lsp_signature_help' },
        {name = 'luasnip',  keyword_length = 2},
        {name = 'buffer',   keyword_length = 3},
        {name = 'path'},
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
    autocomplete = { require('cmp.types').cmp.TriggerEvent.TextChanged },
    completeopt = 'menu,menuone,noinsert,noselect',  -- Avoid inserting suggestions automatically
    keyword_length = 3,  -- Start triggering completion after 3 characters
    max_items = 10,
  },
  preselect = require('cmp').PreselectMode.Item,  -- Automatically select the first item
  sorting = {
        comparators = {
            cmp.config.compare.recently_used,
            cmp.config.compare.locality,
            cmp.config.compare.score,
            cmp.config.compare.exact,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.offset,
            cmp.config.compare.order,
        },
    },
   window = {
     completion = cmp.config.window.bordered(),
     documentation = cmp.config.window.bordered(),
   },
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
