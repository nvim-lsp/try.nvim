-- {% extends 'init.base_template.lua' %}

-- {% block content %}

require('lspconfig').tsserver.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

-- {% endblock %}
