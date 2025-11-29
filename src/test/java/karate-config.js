function fn() {
    var env = karate.env; // obtiene el valor pasado desde la línea de comando
    if (!env) {
        env = 'dev';
    }

    var config = {
        baseUrl: 'https://dev.api.com'
    };

    if (env == 'qa') {
        config.baseUrl = 'https://reqres.in';
    } else if (env == 'stage') {
        config.baseUrl = 'https://stage.api.com';
    } else if (env == 'prod') {
        config.baseUrl = 'https://prod.api.com';
    }

    return config;
}
