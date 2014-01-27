Maestro(TM) is a web application for design and manufacturing teams to manage business processes involving parts, suppliers and material. Maestro supports Parts&Vendors(TM)(1) for entering new part and supplier information.

The purpose of the [Maestro project](https://www.github.com/maestrobpm/maestro) is to create, as a community, the leading platform for integrating SME business processes.

Maestro is in active development, and is not likely suitable for production at this time. For more information, see the [Maestro project wiki](https://github.com/maestrobpm/maestro/wiki) and experiment with your own use cases.

Maestro is licensed according to the [BSD 2-Clause License](http://opensource.org/licenses/BSD-2-Clause), a copy of which [is provided with Maestro (LICENSE file)](https://github.com/maestrobpm/maestro/blob/master/LICENSE). By submitting work to the Maestro project, you acknowledge that a) you have the legal right to do so, and b) you are licensing the work according to the [BSD 2-Clause License](http://opensource.org/licenses/BSD-2-Clause).

Maestro is copyright by its authors, as recorded in the repository commit log. The Maestro project does not use a Contributor Licence Agreement (CLA) or a Copyright Assignment Agreement (CAA). 

The Maestro name and image are unregistered trademarks of Dale Scott, who is providing them for use according to the [Maestro Trademark and Logo Policy](https://github.com/maestrobpm/maestro/wiki/Trademark-and-logo-policy).

Getting Started
===============
Maestro is a PHP/MySQL application. You must have a standard AMP stack or equivalent on your system in order to configure and use Maestro. Maestro uses the Yii framework, and requires PHP 5.1 or greater. This procedure follows install on a typical FreeBSD unix system, with PHP5, MySQL, and Apache2. It intentionally tries not to hide what's happening in master scripts.

* Download the [latest Yii v1 release](http://www.yiiframework.com) to your system. E.g. download yii-1.1.14.f0fee9.tar.gz. Extract the Yii framework to your system and make it readable by Apache.

```
# cd /usr/local/www
# tar -xzf yii-1.1.14.f0fee9.tar.gz
# chown -R www:www yii-1.1.14.f0fe99
```

* confirm your system meets Yii's basic requirements using the "requirements" app bundled in the framework download.

* Install wkhtmltopdf in server (wkhtmltopdf is not currently required, PDF reports are generated using Yii-PDF/HTML2PDF).

```
# cd /usr/ports/converters/wkhtmltopdf
# make config (leave defaults)
# make install clean
```

* enable PHP PDF extensions

* Clone the [Maestro project repo](https://github.com/maestrobpm/maestro) to your system. The master branch contains the most recent release.

```
> cd /usr/local/www
> git clone git://github.com/maestrobpm/maestro.git maestro
```

* Make the assets and runtime directories in the maestro application writable by the web server.

```
chown -R www:www maestro/assets
chown -R www:www maestro/protected/runtime
```

* Create a MySQL database for Maestro.

```
> cd maestro/protected/data
> mysql -u root -p < ./create_db.sql
```

* Load any stored procedures into the Maestro MySQL database.

```
> cd maestro/protected/data
> mysql -u root -p < ./load_suggest_location_proc.sql
```

* Migrate the database to the current schema.

```
> cd maestro
> ./protected/yiic migrate
```

* Load demo data from the Swift Construction Company.

```
> cd maestro/protected/data
> mysql -uroot -p --local-infile=1 --show-warnings --verbose < ./load_demo.sql
```

You can now access Maestro and login (e.g. [localhost/maestro](http://localhost/maestro)).

Once you have logged in to Maestro, you are encouraged to review the Maestro [Guided Tour](http://github.com/maestrobpm/maestro/wiki/Guided-tour), which guides you through configuring Maestro and using its basic features.

Code Repository and Issue Tracking
==================================
* [Maestro project repo](https://github.com/maestrobpm/maestro)
* [Maestro issue tracker](https://github.com/maestrobpm/maestro/issues) (also includes milestones)

Communication Channels
======================
At this time, the official communication channel is the [issue tracker](https://github.com/maestrobpm/maestro/issues). Other options (e.g. mailing list, Google Group...) are being considered and will be announced when available.

Developer Guidelines
====================
The basic development procedure is:
* Create a GitHub account and use GitHub to fork the Maestro project repo
* Clone your fork locally
* Create a local topic branch off the master branch
* Develop and test your work locally
* Push your topic branch to your GitHub clone
* Issue a pull request with your changes to the Maestro project

All development is currently done in the master branch, the Maestro project will likely move to the [Gitflow model](http://nvie.com/posts/a-successful-git-branching-model/) once the codebase has matured further.

For more information, see the [project wiki](https://github.com/maestrobpm/maestro/wiki).

Project Documentation
=====================
Official project documentation is found in the [Maestro wiki](https://github.com/maestrobpm/maestro/wiki/), in particular:
* [Maestro Features](https://github.com/maestrobpm/maestro/wiki/Maestro-Features)
* [Guided tour](http://github.com/maestrobpm/maestro/wiki/Guided-tour)
* [General guidelines](https://github.com/maestrobpm/maestro/wiki/General-guidelines)
* [Trademark and logo policy](https://github.com/maestrobpm/maestro/wiki/Trademark-and-logo-policy)
* [Development environment](http://github.com/maestrobpm/maestro/wiki/Development-environment)
* [Developing maestro](http://github.com/maestrobpm/maestro/wiki/Developing-maestro)

Support
=======
In the event you have a problem:

* Search the [Maestro wiki](https://github.com/maestrobpm/maestro/wiki/).
* Search the [Maestro issue tracker](https://github.com/maestrobpm/maestro/issues).
* Post an issue to [Maestro issue tracker](https://github.com/maestrobpm/maestro/issues).

For the best response when posting, try to include:

* What are you trying to achieve?
* What are the symptoms of your problem? Why do you think this  *is* a problem?
* What is your server (OS, web server, PHP and MySQL versions)? E.g. FreeBSD 9.1, Apache 2.2.22, PHP 5.3.10 and MySQL 5.5.20.
* Include as an example, the *simplest* code that demonstrates the symptoms.



(1) Parts&Vendors(TM) is a trademark of Trilogy Design. http://www.trilogydesign.com
