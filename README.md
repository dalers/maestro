Maestro(TM) is a web application for design and manufacturing teams to manage business processes involving parts, suppliers and material. Maestro can load part and supplier data from Parts&Vendors(TM)(1), either in a one-time migration or as a continuing part of your workflow (although the data transfer is one-way only).

The purpose of the [Maestro project](https://www.github.com/maestrobpm/maestro) is to create, as a community, the leading platform for integrating SME business processes. Maestro is in active development, and may not be suitable for production use at this time. For more information, see the [Maestro project wiki](https://github.com/maestrobpm/maestro/wiki) and experiment with your own use cases.

Maestro is licensed according to the business-friendly [BSD 2-Clause License](http://opensource.org/licenses/BSD-2-Clause), a copy of which [is provided with Maestro (the LICENSE file)](https://github.com/maestrobpm/maestro/blob/master/LICENSE). By submitting work to the Maestro project, you acknowledge that a) you have the legal right to do so, and b) you are licensing the work according to the BSD 2-Clause License.

Maestro source is copyright by its authors, as recorded in the repository commit log. The Maestro project does not use a Contributor Licence Agreement (CLA) or a Copyright Assignment Agreement (CAA). 

The Maestro name and image are trademarks of Dale Scott, provided for use according to the [Maestro Trademark and Logo Policy](https://github.com/maestrobpm/maestro/wiki/Trademark-and-logo-policy).

Getting Started
===============
Maestro is a PHP/MySQL application. You must have a standard AMP stack or equivalent on your system in order to configure and use Maestro. Maestro uses the Yii framework (v1), and requires PHP 5.1 or greater. The following procedure is for installing Maestro on a FreeBSD unix system, referred to as the Maestro Reference Server.

Several parts of the process are scripted for convenience, but you are strongly urged to read the scripts first to understand their actions and help resolve any issues that may arise. The scripts support ONLY a vanilla FreeBSD system.
 
Before starting, install and configure software required for hosting Maestro.

* "AMP" stack - for hosting PHP web applications like Maestro (e.g. Apache 2.2.x, MySQL 5.5.x+, PHP 5.5+). The usual PHP extensions will be required, including PDF. *I usually install phpMyAdmin on a server which pulls in all the PHP extensions needed, but you'll see if anything critical is missing when you test for Yii requirements below.*
* mdbtools - used to extract data from Parts&Vendors, which uses an MS Jet database. *You don't need mdbtools if you're not using Parts&Vendors.*
* rsync - used to synchronize the Maestro file vault with a remote file share containing "current" files. *load_demo.sh (used below) uses rsync to restore the SCC file vault, following the same process as if the files were on a remote server.*
* sSMTP - delivers mail from Maestro to a mail hub (SMTP server) for delivery. *Edit maestro/protected/data/send_current_changereport.sh to use a different MTA (e.g. sendmail).*
* Samba - used by Maestro to access the "current" files on a remote MS Windows file share (also see rsync), and also by Parts&Vendors on an MS Windows workstation to access the Maestro file vault. *You do not need Samba if you only want a web-based demo, and will not be accessing files in the Maestro file vault from Parts&Vendors.*

*pkg-install can be used to install Apache, MySQL, rsync, sSMTP, and Samba. PHP5 must be installed from the ports tree so it can be configured to build an Apache module. As of recently, mdbtools was only available as source in the ports tree.

After installing, configuring and testing server operation, you can proceed with installing Maestro.

1. Download the [latest Yii v1 release](http://www.yiiframework.com) to your system (e.g. yii-1.1.14.f0fee9.tar.gz).

* Extract the contents to your system and make it readable by Apache.

```
# cd /usr/local/www
# tar -xzf yii-1.1.14.f0fee9.tar.gz
# chown -R www:www yii-1.1.14.f0fe99
```

2. Confirm your system meets Yii's basic requirements using the "requirements" app included in the Yii framework download, and correct any errors identified (note that MySQL is the only DBMS that must show support). Create a symlink to the Yii requirements application symlink in the Apache to the Yii framework download, and access the requirements application with your browser (e.g. http://localhost/yii-1.1.14-requirements with the symlink as shown below). Alternatively, create a "yii-1.1.14-requirements.conf" file in /usr/local/etc/apache22/Includes and restart apache (more on this approach below with the Maestro application).

```
# ln -s /usr/local/www/yii-1.1.14.f0fee9/requirements/ /usr/local/www/apache22/data/yii-1.1.14-requirements
```

3. Clone the [Maestro project repo](https://github.com/maestrobpm/maestro) to your system. The master branch contains the most recent release.

```
> cd /usr/local/www/
> git clone git://github.com/maestrobpm/maestro.git maestro
```

4. Create a maestro.conf file and restart Apache.

* *This is NOT the most secure way to run Maestro or a Yii application, but it's better than putting everything under the Apache webroot. If you understand why, feel free to do it your way. ;-)*

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

5. Edit the MySQL root password in maestro/protected/data/setup.sh for your environment and execute setup.sh. This sets required directory and file permissions, creates the "maestro" database, and migrates the database to the current schema.

* *In general, when a file must be edited for your local environment, create and edit a copy of the file. This will make it easier to keep changes for your environment only separate from the bug fixes and new features you will be sending the Maestro project a pull request for ;-)*

```
> ./setup.sh
...
> cd /usr/local/www/maestro/protected/data/
Apply the above migration? (yes|no) [no]:y
...
>
```

6. Create the Maestro file vault root directory.

```
> mkdir -p /home/samba/maestro
>
```

7. Load the Swift Construction Company (SCC) data into Maestro. The load_demo.sh script loads each iteration of "current" data successively, and emails the local "root" user a change report for each iteration.

* *Skip this step if you want to only load the database, and are not concerned with files in the Maestro file vault.*

* *An iteration is when there is a significant change in the "current" data that Maestro is monitoring for control. This can be data in Parts&Vendors, the data master spreadsheets, and files in a remote file share being monitored by Maestro.*

```
> cd maestro/protected/data
> ./load_demo.sh
```

8. Skip to the next step if you you ran ./load_demo.sh in the last step. If not, and assuming you want to load the most recent copy of the SCC database data only and not any SCC files, load the Maestro database directly with the most recent SCC data:

```
> mysql -uroot -p --local-infile=1 --show-warnings --verbose < ./load_demo-1.2.0.sql
```

9. You shold now be able to access Maestro and login (e.g. [localhost/maestro](http://localhost/maestro)).

For information on using Maestro, you are encouraged to review the Maestro [Guided Tour](http://github.com/maestrobpm/maestro/wiki/Guided-tour).

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



(1) Parts&Vendors(TM) is a trademark of Trilogy Design. http://www.trilogydesign.com
