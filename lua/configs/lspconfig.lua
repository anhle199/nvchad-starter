local map = vim.keymap.set
local nvlsp = require "nvchad.configs.lspconfig"

local action_organize_imports = function()
  vim.lsp.buf.code_action {
    apply = true,
    context = {
      only = { "source.organizeImports" },
      diagnostics = {},
    },
  }
end

local on_attach = function(client, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
  map("n", "<leader>rn", require "nvchad.lsp.renamer", opts "NvRenamer")
  map("n", "<leader>rf", function()
    vim.lsp.buf.references()
  end, opts "references")
  map("n", "<leader>d", function()
    vim.diagnostic.open_float()
  end, opts "floating diagnostic")
  map("n", "<leader>D", function()
    vim.diagnostic.setloclist()
  end, opts "diagnostic setloclist")

  if client.name == "vtsls" then
    map("n", "<leader>co", action_organize_imports, opts "organize imports")
  end

  if client.name == "pyright" then
    map("n", "<leader>co", action_organize_imports, opts "organize imports")
    client.server_capabilities.hoverProvider = false
  end

  if client.name == "yamlls" then
    if vim.fn.has "nvim-0.10" == 0 then
      client.server_capabilities.documentFormattingProvider = true
    end
  end
end

-- custom config
local jsonls_settings = {
  json = {
    format = {
      enable = true,
    },
    validate = {
      enable = true,
    },
  },
}
local yamlls_settings = {
  redhat = {
    telemetry = {
      enabled = false,
    },
  },
  yaml = {
    keyOrdering = false,
    format = {
      enable = true,
    },
    validate = true,
    schemaStore = {
      -- Must disable built-in schemaStore support to use
      -- schemas from SchemaStore.nvim plugin
      enable = false,
      -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
      url = "",
    },
  },
}
local pyright_settings = {
  python = {
    analysis = {
      typeCheckingMode = "off",
      diagnosticMode = "openFilesOnly",
      diagnosticSeverityOverrides = {
        reportImportCycles = "error",
        reportUnusedImport = "warning",
        reportUnusedClass = "warning",
        reportUnusedFunction = "warning",
        reportUnusedVariable = "warning",
        reportDuplicateImport = "error",
        reportUnnecessaryCast = "warning",
        reportUnnecessaryComparison = "warning",
        reportUnnecessaryContains = "warning",
      },
    },
  },
}
-- https://github.com/yioneko/vtsls/blob/main/packages/service/configuration.schema.json
local vtsls_settings = {
  complete_function_calls = true,
  vtsls = {
    enableMoveToFileCodeAction = true,
    autoUseWorkspaceTsdk = true,
  },
  javasciprt = {},
  typescript = {
    updateImportsOnFileMove = {
      enabled = "always",
    },
    suggest = {
      completeFunctionCalls = true,
    },
    inlayHints = {
      enumMemberValues = {
        enabled = true,
      },
      functionLikeReturnTypes = {
        enabled = true,
      },
      parameterNames = {
        enabled = "literals",
      },
      parameterTypes = {
        enabled = true,
      },
      propertyDeclarationTypes = {
        enabled = true,
      },
      variableTypes = {
        enabled = false,
      },
    },
  },
}
vtsls_settings.javascript = vtsls_settings.typescript

-- config
dofile(vim.g.base46_cache .. "lsp")
require("nvchad.lsp").diagnostic_config()

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    on_attach(client, args.buf)
  end,
})

local lua_lsp_settings = {
  Lua = {
    workspace = {
      library = {
        vim.fn.expand "$VIMRUNTIME/lua",
        vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
        vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
        "${3rd}/luv/library",
      },
    },
  },
}

-- Support 0.10 temporarily
local capabilities = nvlsp.capabilities
local on_init = nvlsp.on_init
if vim.lsp.config then
  vim.lsp.config("*", { capabilities = capabilities, on_init = on_init })
  vim.lsp.config("lua_ls", { settings = lua_lsp_settings })
  vim.lsp.config("vtsls", { settings = vtsls_settings })
  vim.lsp.config("jsonls", { settings = jsonls_settings })
  vim.lsp.config("yamlls", { settings = yamlls_settings })
  vim.lsp.config("pyright", { settings = pyright_settings })
  vim.lsp.enable { "lua_ls", "html", "cssls", "vtsls", "jsonls", "yamlls", "pyright" }
else
  require("lspconfig").lua_ls.setup {
    capabilities = capabilities,
    on_init = on_init,
    settings = lua_lsp_settings,
  }
  require("lspconfig").html.setup {
    capabilities = capabilities,
    on_init = on_init,
  }
  require("lspconfig").cssls.setup {
    capabilities = capabilities,
    on_init = on_init,
  }
  require("lspconfig").vtsls.setup {
    capabilities = capabilities,
    on_init = on_init,
    settings = vtsls_settings,
  }
  require("lspconfig").jsonls.setup {
    capabilities = capabilities,
    on_init = on_init,
    settings = jsonls_settings,
  }
  require("lspconfig").yamlls.setup {
    capabilities = capabilities,
    on_init = on_init,
    settings = yamlls_settings,
  }
  require("lspconfig").pyright.setup {
    capabilities = capabilities,
    on_init = on_init,
    settings = pyright_settings,
  }
end
