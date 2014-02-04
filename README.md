Maestro(TM) is a web application for design and manufacturing teams to manage business processes involving parts, suppliers and material. Maestro can load part and supplier data from Parts&Vendors(TM)*, enabling existing data to be easily migrated to Maestro or even to continue using Parts&Vendors as part of your workflow and avoid retraining staff (although data transfer to Maestro is one-way only).

The purpose of the [Maestro project](https://www.github.com/maestrobpm/maestro) is to create, as a community, the leading platform for integrating SME business processes. Maestro is in active development, and may not be suitable for production use at this time. For more information, see the [Maestro project wiki](https://github.com/maestrobpm/maestro/wiki) and experiment with your own use cases.

Maestro is licensed according to the business-friendly [BSD 2-Clause License](http://opensource.org/licenses/BSD-2-Clause), a copy of which [is provided with Maestro (the LICENSE file)](https://github.com/maestrobpm/maestro/blob/master/LICENSE). By submitting work to the Maestro project, you acknowledge that a) you have the legal right to do so, and b) you are licensing the work according to the [BSD 2-Clause License](http://opensource.org/licenses/BSD-2-Clause).

Maestro source is copyright by its authors, as recorded in the repository commit log. The Maestro project does not use a Contributor Licence Agreement (CLA) or a Copyright Assignment Agreement (CAA). 

The Maestro name and image are trademarks of Dale Scott, provided for use according to the [Maestro Trademark and Logo Policy](https://github.com/maestrobpm/maestro/wiki/Trademark-and-logo-policy).

Getting Started
===============
Maestro is a PHP/MySQL application. You must have a standard AMP stack or equivalent on your system in order to configure and use Maestro. Maestro uses the Yii framework (v1), and requires PHP 5.1 or greater. The following procedure installs Maestro on a FreeBSD unix system previously configured with Apache, MySQL and PHP.

Several parts of the process are scripted for convenience, but you are strongly urged to read the scripts first to understand their actions and help resolve any issues that may arise. The scripts support ONLY a vanilla FreeBSD system.

Before starting, load additional software required by Maestro.
* mdbtools - used to extract data from a Parts&Vendors (Microsoft Jet) database.
* rsync - used to synchronize the Maestro file vault with a remote file share. Loading the full SCC data set also requires rsync, as the process simulates the normal production flow with a simulated remote file share.  
* sSMTP - used to deliver mail from Maestro to a mail hub (SMTP server).
* Samba - used to provide a Windows-compatible file share for accessing the Maestro file vault (Samba is not required for loading SCC demo data)

After configuring and testing the new server software, proceed with installing Maestro.

* Download the [latest Yii v1 release](http://www.yiiframework.com) to your system (e.g. yii-1.1.14.f0fee9.tar.gz). Extract the contents to your system and make it readable by Apache.

```
# cd /usr/local/www
# tar -xzf yii-1.1.14.f0fee9.tar.gz
# chown -R www:www yii-1.1.14.f0fe99
```

* Confirm your system meets Yii's basic requirements using the "requirements" app included in the Yii framework download, and correct any errors found (MySQL is the only DBMS that must be supported).

* Enable PHP PDF extensions

* Clone the [Maestro project repo](https://github.com/maestrobpm/maestro) to your system. The master branch contains the most recent release.

```
> cd /usr/local/www/
> git clone git://github.com/maestrobpm/maestro.git maestro
```

* Create a maestro.conf file and restart Apache.

```
> vi /usr/local/etc/apache22/Includes/maestro.conf

Alias /maestro "/usr/local/www/maestro/"

<Directory "/usr/local/www/maestro/">
    Options none
    AllowOverride Limit

    Order Deny,Allow
    Allow from all
</Directory>

> /usr/local/etc/rc.d/apache22 restart
```

* Run the maestro/protected/data/setup.sh script. This will set required directory and file permissions, create the *maestro* database, and migrate the database to the current schema.

```
> ./setup.sh
...
> cd /usr/local/www/maestro/protected/data/
Apply the above migration? (yes|no) [no]:y
...
>
```

* Create the Maestro file share root directory.

```
> mkdir -p /home/samba/maestro
>
```

* Load the Swift Construction Company (SCC) database data into the Maestro database. This loads each iteration of the data successively, including copying files associated with parts and material to the Maestro file share. Change reports for each iteration are emailed to *root*.

*Skip this step if you want to only load the database.*

```
> cd maestro/protected/data
> ./load_demo.sh
```

* If you skipped running load_demo.sh because you want to load the most recent copy of the SCC database data only (and not any SCC files):

```
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

All development is currently done in the master branch, the Maestro project will likely move to the [Gitflow model](http://nvie.com/posts/a-successful-git-branching-model/) after the codebase matured further.

For more information, see the [Maestro wiki](https://github.com/maestrobpm/maestro/wiki).

Project Documentation
=====================
Official project documentation is published in the [Maestro wiki](https://github.com/maestrobpm/maestro/wiki/).

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



* Parts&Vendors(TM) is a trademark of Trilogy Design. http://www.trilogydesign.com
