# fundamental-needs

Il est possible de faire les dossiers comme on veut.  
Le script va parcourir les dossiers, dans chaque dossier s'il ya un fichier **".sh"** il sera exécuté.  
Pour l'ordre d'éxécution des fichiers ce sera l'ordre alphabétique.
Le script execute les fichiers dans l'ordre alaphabétique

## Vhosts
Pour le dossier vhost, il contiendra que les fichiers **".conf"**, ils seront copiés vers `/etc/apache2/sites-available`.


## Configuration
### Apache
Remplacer **www-data** par **your_username**  
> **Ne pas oublier de modifier le php.ini pour toutes les versions php-fpm si nécessaire.**
```bash
# export APACHE_RUN_USER=your_username
# export APACHE_RUN_GROUP=your_username
sudo nano /etc/apache2/envvars

# user = your_username
# group = your_username
# listen.owner = your_username
# listen.group = your_username
sudo nano /etc/php/7.2/fpm/php.ini
```


```bash

```