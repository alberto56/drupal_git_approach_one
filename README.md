Approach #1 to Drupal and Git
-----------------------------

I have imagined a typical Drupal 7 project with

 * A [site deployment module](http://dcycleproject.org/blog/44/what-site-deployment-module) called demo_deploy.
 * A update deployment script.
 * A theme, in this case [business](https://www.drupal.org/project/business).
 * Some contrib modules, in this case views, features, and devel.
 * An initial deployment script, which [does not clone the database](http://dcycleproject.org/blog/48/do-not-clone-database).
 * A [patch to core](2196345-1-core-7.x-simpletest-handle_form_button.patch).
 * A [patch to a contrib module, in this case views](2232905-1-views-7.x-check-if-group-isset.patch).

The idea is to be able to install this easily with a single command, and to incrementally update environments with a single command.

I have tried three approaches, each having two "versions" and each hosted on github so you can try them.

 * Version 1: has the theme enabled, and an older version of views (on purpose), and comments disabled.
 * Version 2: has the new version of views enabled, the patches applied, and a new view and content type, disabled overlay and enabled pathauto.

Approach #1 (in this repo)
--------------------------

This approach is what most teams I've worked with already do, and is [described here](https://www.drupal.org/node/803746).

To try it:

Approach #2
-----------

Advantages

README.md
drupal 8
.gitignore mashed

Approach #3
-----------


http://stackoverflow.com/questions/9282998/git-setup-best-practices

Advantages

Code-quality tools and metrics such as gource will


