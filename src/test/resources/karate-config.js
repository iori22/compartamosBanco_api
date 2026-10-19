function fn() {
    var env = karate.env; // Obtiene el ambiente enviado desde la consola o runner
    if (!env) {
        env = 'dev';
    }

    // Configuración base por defecto (dev)
    var config = {
        baseUrl: 'https://serverest.dev'
    };

    if (env == 'qa') {
        baseUrl: 'https://serverest.dev'
    } else if (env == 'stage') {
        config.baseUrl = 'https://stage.api.com';
    } else if (env == 'prod') {
        config.baseUrl = 'https://prod.api.com';
    }

    return config;
}