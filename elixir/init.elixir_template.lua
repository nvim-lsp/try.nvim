-- {% extends 'init.base_template.lua' %}

-- {% block content %}

local elixir_ls_bin = "/elixir-ls/language_server.sh"
require('lspconfig').elixirls.setup{
    cmd = {elixir_ls_bin},
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      elixirLS = {
        dialyzerEnabled = false, fetchDeps = false
      }
    }
}

-- {% endblock %}
