Approach #1 to Drupal and Git
-----------------------------

I have imagined a typical Drupal 7 project with

 * A [site deployment module](http://dcycleproject.org/blog/44/what-site-deployment-module) called demo_deploy.
 * A update deployment script.
 * A theme, in this case [business](https://www.drupal.org/project/business).
 * Some contrib modules, in this case views, features, and devel.
 * A [patch to core](2196345-1-core-7.x-simpletest-handle_form_button.patch).
 * A [patch to a contrib module, in this case views](2232905-1-views-7.x-check-if-group-isset.patch).

The idea is to be able to install this easily [without cloning the database](http://dcycleproject.org/blog/48/do-not-clone-database), and to incrementally update environments with a single command.

I have tried three approaches, each having two "versions" and each hosted on github so you can try them.

 * Version 1: has the theme enabled, and an older version of views (on purpose), and comments disabled.
 * Version 2: has the new version of views enabled, the patches applied, and a new view and content type, disabled overlay and enabled pathauto.

Approach #1 (in this repo)
--------------------------

This approach is what most teams I've worked with already do, and is [described here](https://www.drupal.org/node/803746).

For the first deployment:

    git clone https://github.com/alberto56/drupal_git_approach_one.git
    cd drupal_git_approach_one
    # create your databae
    echo 'create database demo1'|mysql -uroot -proot
    drush si --db-url=mysql://root:root@localhost/demo1 -y
    drush en demo_deploy -y
    drush generate-content 40
    drush uli

To re-deploy your site from scratch, replacing the current database with a new one:

    drush si -y
    drush en demo_deploy -y
    drush generate-content 40

To update from version 1 to version 2, you can do the following:

    git checkout -b version2
    git pull origin version2
    sites/all/modules/custom/demo_deploy/scripts/update.sh

If you look at `update.sh`, it contains everything required to update any environment. It is better to put this script under version control rather than in a continuous integration server, because we want to be able to version it. (For some projects the script may change over time.)

Although this approach has the advantage of being simple, we will look at some other approaches which have some advantages.

Approach #2
-----------

In this approach, we have the following structure:

    - git root
    -- Drupal root
    --- ...
    -- scripts
    --- update.sh

For more details, and the advantages of this idea, see README.md at `https://github.com/alberto56/drupal_git_approach_two`.

Approach #3
-----------

This approach takes the structure of Approach #2 but introduces git submodules.

For more details, and the advantages of this idea, see README.md at `https://github.com/alberto56/drupal_git_approach_three`.
