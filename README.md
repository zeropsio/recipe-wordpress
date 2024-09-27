# Zerops x Wordpress

```yaml
#yamlPreprocessor=on
services:
  - hostname: app
    type: php-nginx@8.1
    buildFromGit: https://github.com/horejsi-prsi/prsi-wp-starter
    enableSubdomainAccess: true
    envSecrets:
      WORDPRESS_TITLE: WordPress on Zerops
      WORDPRESS_URL: ${zeropsSubdomain}

      WORDPRESS_ADMIN_EMAIL: "your@email.com"
      WORDPRESS_ADMIN_USER: admin
      WORDPRESS_ADMIN_PASSWORD: <@generateRandomString(<8>)>

      WORDPRESS_DEBUG: "false"
      WORDPRESS_DEBUG_DISPLAY: "false"
      WORDPRESS_DEBUG_LOG: "false"

      WORDPRESS_AUTH_KEY: <@generateRandomString(<64>)>
      WORDPRESS_AUTH_SALT: <@generateRandomString(<64>)>
      WORDPRESS_LOGGED_IN_KEY: <@generateRandomString(<64>)>
      WORDPRESS_LOGGED_IN_SALT: <@generateRandomString(<64>)>
      WORDPRESS_NONCE_KEY: <@generateRandomString(<64>)>
      WORDPRESS_NONCE_SALT: <@generateRandomString(<64>)>
      WORDPRESS_SECURE_AUTH_KEY: <@generateRandomString(<64>)>
      WORDPRESS_SECURE_AUTH_SALT: <@generateRandomString(<64>)>

  - hostname: storage
    type: object-storage
    objectStorageSize: 2
    objectStoragePolicy: public-read
    pririty: 10

  - hostname: redis
    type: valkey@7.2
    mode: NON_HA
    priority: 10

  - hostname: db
    type: mariadb@10.6
    mode: NON_HA
    priority: 10

  - hostname: adminer
    type: php-apache@8.3
    buildFromGit: https://github.com/zeropsio/recipe-adminer@main
    enableSubdomainAccess: true
    priority: 10
```
