# fundamental-needs

Il est possible de faire les dossiers comme on veut.  
Le script va parcourir les dossiers, dans chaque dossier s'il ya un fichier **".sh"** il sera exécuté.  
Pour l'ordre d'éxécution des fichiers ce sera l'ordre alphabétique.
Le script execute les fichiers dans l'ordre alaphabétique

## Vhosts
Pour le dossier vhost, il contiendra que les fichiers **".conf"**, ils seront copiés vers `/etc/apache2/sites-available`.

## Installations
- <a target="_blank" href="https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent" target="_blank">Création d'une clé ssh</a>
- <a target="_blank" href="https://httpd.apache.org/">Apache2</a>
- <a target="_blank" href="https://www.mysql.com/fr/">MySQL</a>
- <a target="_blank" href="https://www.php.net/">Php (7.2, 7.4, 8.0)</a> et <a target="_blank" href="https://symfony.com/download">Symfony cli</a>
- <a target="_blank" href="https://getcomposer.org/">Composer</a>
- <a target="_blank" href="https://git-scm.com/">Git</a>
- <a target="_blank" href="https://github.com/nvm-sh/nvm">Nvm</a>
- Applications :
    - <a href="https://snapcraft.io/docs" target="_blank">snapd</a>
        - <a href="https://code.visualstudio.com/" target='_blank'>vscode</a> via snap packages
        - <a href="https://insomnia.rest/" target='_blank'>insomnia</a> via snap packages
    - <a href="https://flameshot.org/" target='_blank'>Flameshot</a>
    - <a href="https://github.com/phw/peek" target='_blank'>Peek</a>
    - <a href="https://fishshell.com/" target='_blank'>Fish shell</a>

## Configuration
### Apache, php, Symfony cli
Remplacer **www-data** par son nom d'utilisateur.  
> Ne pas oublier de modifier le php.ini pour toutes les versions php-fpm si nécessaire.

#### Apache2
Voir les [vhost](https://github.com/Masth0/fundamental-needs/tree/master/vhosts)
```bash
# export APACHE_RUN_USER=username
# export APACHE_RUN_GROUP=username
sudo nano /etc/apache2/envvars
```

#### Php
```bash
# user = username
# group = username
# listen.owner = username
# listen.group = username
sudo nano /etc/php/7.2/fpm/php.ini
```

#### Symfony cli
```bash
# Use it as a local file:
/home/yourname/.symfony/bin/symfony
# Or add the following line to your shell configuration file:
export PATH="$HOME/.symfony/bin:$PATH"
# Or install it globally on your system:
mv /home/yourname/.symfony/bin/symfony /usr/local/bin/symfony
```