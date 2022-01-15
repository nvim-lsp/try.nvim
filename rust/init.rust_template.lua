-- {% extends 'init.base_template.lua' %}

-- {% block content %}

require('lspconfig').rust_analyzer.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

-- {% endblock %}
