drush vset maintenance_mode 1
drush fra
drush updb -y
drush cc all
drush vset maintenance_mode 0
