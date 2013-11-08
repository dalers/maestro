Maestro(TM) is a web application for design and manufacturing teams to manage their part and supplier (vendor) information. Maestro is compatible with Parts&Vendors(TM), "The Personal Parts List Manager and Vendor Database"(1). Maestro has a modular architecture, additional  modules are planned for material management and project planning.

Although Maestro is in active development, it may be suitable for production use. For more information on the current status of Maestro, see the [Maestro project wiki](https://github.com/dalers/maestro/wiki) and experiment with your use cases.

The purpose of the [Maestro project](https://www.github.com/dalers/maestro) is to create, as a community, the leading environment for integrating SME business processs.

Maestro is licensed under the terms of the BSD 2-clause license. See  [LEGAL](https://github.com/dalers/maestro/wiki/Legal) for more information.

Getting Started
===============
Maestro is a PHP/MySQL application. You must have a standard AMP stack or equivalent on your system in order to configure and use Maestro. Maestro uses the Yii framework, and requires PHP 5.1 or greater.

* Clone the [Maestro project repo](https://github.com/dalers/maestro) to your system. The master branch contains the most recent release.

```
> git clone git://github.com/dalers/maestro.git maestro
```

* Download the [latest Yii v1 release](http://www.yiiframework.com) to your system. E.g. download yii-1.1.14.f0fee9.tar.gz. Extract the Yii framework to your system.

```
> tar -xzf yii-1.1.14.f0fee9.tar.gz
```

* Confirm the path to the Yii framework is correct in files maestro/index.php and index-test.php.

```
$yii=dirname(__FILE__).'/../yii-1.1.14.f0fee9/framework/yii.php';
```

* Create a database for Maestro.

```
> cd maestro/protected/data
> mysql -u root -p < ./create_db.sql
```

* Load the database schema.

```
> cd maestro
> ./protected/yiic migrate new
> ./protected/yiic migrate
```

* Load demo data from SCC (Swift Construction Company).

```
> cd /usr/local/www/maestro/protected/data
> ./load_maestro_unix.sh
```

You can now access Maestro and login (e.g. [localhost/maestro](http://localhost/maestro)).

Once you have logged in to Maestro, you are encouraged to review the [Maestro Guided Tour](http://github.com/dalers/maestro/wiki/Maestro-guided-tour), which will guide you step-by-step through configuring Maestro and using its basic features.

Version Control and Issue Tracking
==================================
* [Maestro project repo](https://github.com/dalers/maestro)
* [Maestro issue tracker](https://github.com/dalers/maestro/issues)

Communication Channels
======================
At this time, the official communication channel is the [issue tracker](https://github.com/dalers/maestro/issues). Other options (e.g. mailing list, Google Group...) are being considered and will be announced when avaiable.

Developer Guidelines
====================
The Maestro project follows the Gitflow workflow using the Gitflow Fork & Pull model:
* Fork the GitHub atkphpframework/achievo repo
* Clone your fork locally
* Checkout the develop branch to work in, or create a local topic branch from either the develop branch or a release branch.
* Develop and test your work
* Push your topic branch to your GitHub clone
* Issue a pull request to the atkframework group to have your changes merged, typically into the develop branch for on-going development.

For more information, see [General Guidelines](https://github.com/dalers/maestro/wiki/General-guidelines).

Project Documentation
=====================
Official project documentation is found in the [Maestro wiki](https://github.com/dalers/maestro/wiki/), in particular:
* [Features](https://github.com/dalers/maestro/wiki/Features)
* [Guided tour](http://github.com/dalers/maestro/wiki/Guided-tour)
* [Wiki style guide](https://github.com/dalers/maestro/wiki/Wiki-style-guide)
* [General guidelines](https://github.com/dalers/maestro/wiki/General-guidelines)
* [Trademark and logo policy](https://github.com/dalers/maestro/wiki/Trademark-and-logo-policy)
* [Setting up your development environment](http://github.com/dalers/maestro/wiki/Setting-up-your-development-environment)
* [Hacking maestro](http://github.com/dalers/maestro/wiki/Hacking-maestro)
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
