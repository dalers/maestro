Maestro(TM) is a web application for design and manufacturing teams to manage their part and supplier (vendor) information. Maestro is compatible with Parts&Vendors(TM), "The Personal Parts List Manager and Vendor Database"(1). Maestro has a modular architecture, additional  modules are planned for material management and project planning.

Maestro is in active development and may be suitable for production use. For more information on the current status of Maestro, see the [Maestro project wiki](https://github.com/dalers/maestro/wiki) and experiment with your own use cases.

The purpose of the [Maestro project](https://www.github.com/dalers/maestro) is to create, as a community, the leading platform for integrating SME business processes.

Maestro is licensed under the terms of the BSD 2-clause license. See  [LEGAL](https://github.com/dalers/maestro/wiki/Legal) for more information.

Getting Started
===============
Maestro is a PHP/MySQL application. You must have a standard AMP stack or equivalent on your system in order to configure and use Maestro. Maestro uses the Yii framework, and requires PHP 5.1 or greater. The instructions here reference a FreeBSD unix system.

* Clone the [Maestro project repo](https://github.com/dalers/maestro) to your system. The master branch contains the most recent release.

```
> cd /usr/local/www
> git clone git://github.com/dalers/maestro.git maestro
```

* Make the assets and runtime directories in the maestro application writable by the web server.

```
chown -R www:www maestro/assets
chown -R www:www maestro/protected/runtime
```

* Download the [latest Yii v1 release](http://www.yiiframework.com) to your system. E.g. download yii-1.1.14.f0fee9.tar.gz. Extract the Yii framework to your system.

```
> tar -xzf yii-1.1.14.f0fee9.tar.gz
```

* Make the Yii framework readable by the web server.

```
chown -R www:www yii-1.1.14.f0fe99
```

* Create a database for Maestro.

```
> cd maestro/protected/data
> mysql -u root -p < ./create_db.sql
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

Once you have logged in to Maestro, you are encouraged to review the Maestro [Guided Tour](http://github.com/dalers/maestro/wiki/Guided-tour), which guides you through configuring Maestro and using its basic features.

Code Repository and Issue Tracking
==================================
* [Maestro project repo](https://github.com/dalers/maestro)
* [Maestro issue tracker](https://github.com/dalers/maestro/issues) (also includes milestones)

Communication Channels
======================
At this time, the official communication channel is the [issue tracker](https://github.com/dalers/maestro/issues). Other options (e.g. mailing list, Google Group...) are being considered and will be announced when available.

Developer Guidelines
====================
The basic development procedure is:
* Create a GitHub account and use GitHub to fork the Maestro project repo
* Clone your fork locally
* Create a local topic branch off the master branch
* Develop and test your work locally
* Push your topic branch to your GitHub clone
* Issue a pull request with your changes to the Maestro project

All development is currently done in the master branch, although the Maestro project will likely move to the [Gitflow model](http://nvie.com/posts/a-successful-git-branching-model/) once the codebase has matured further.

For more information, see the [General Guidelines article in the project wiki](https://github.com/dalers/maestro/wiki/General-guidelines).

Project Documentation
=====================
Official project documentation is found in the [Maestro wiki](https://github.com/dalers/maestro/wiki/), in particular:
* [Features](https://github.com/dalers/maestro/wiki/Features)
* [Guided tour](http://github.com/dalers/maestro/wiki/Guided-tour)
* [Wiki style guide](https://github.com/dalers/maestro/wiki/Wiki-style-guide)
* [General guidelines](https://github.com/dalers/maestro/wiki/General-guidelines)
* [Trademark and logo policy](https://github.com/dalers/maestro/wiki/Trademark-and-logo-policy)
* [Setting up a development environment](http://github.com/dalers/maestro/wiki/Setting-up-a-development-environment)
* [Developing maestro](http://github.com/dalers/maestro/wiki/Developing-maestro)
* [Legal](https://github.com/dalers/maestro/wiki/Legal)

Support
=======
In the event you have a problem:

* Search the [Maestro wiki](https://github.com/dalers/maestro/wiki/).
* Search the [Maestro issue tracker](https://github.com/dalers/maestro/issues).
* Post an issue to [Maestro issue tracker](https://github.com/dalers/maestro/issues).

To get the most informed response when posting, try to include:

* What are you trying to achieve?
* What are the symptoms of your problem? Why do you think this  *is* a problem?
* What is your server (OS, web server, PHP and MySQL versions)? E.g. FreeBSD 9.1, Apache 2.2.22, PHP 5.3.10 and MySQL 5.5.20.
* Include as an example, the *simplest* code that demonstrates the symptoms.


(1) Parts&Vendors(TM) is a trademark of Trilogy Design. http://www.trilogydesign.com
