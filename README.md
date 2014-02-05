Maestro(TM) is a web-based application for design, manufacturing and sales teams to manage and share information related to parts, projects, material (simple, serialized, or lot controlled), issues and people. Maestro consolidates "current" information from spreadsheets, shared directories and single-purpose applications in an environment of *Transparency with Trust*. A complete data set for a well-defined going concern, the fictional Swift Construction Company (SCC), is included with Maestro. Maestro is an open source project, using the permissive business-friendly [BSD 2-Clause License](http://opensource.org/licenses/BSD-2-Clause).

Maestro can access part and supplier data from Parts&Vendors(TM), for one-time data migration or in regular use for entering "current" data to be managed by Maestro.

The purpose of the [Maestro project](https://www.github.com/maestrobpm/maestro) is to create, as a community, the leading platform for integrating SME business processes. Maestro is in active development, and may not be suitable for production use at this time. For more information, see the [Maestro project wiki](https://github.com/maestrobpm/maestro/wiki) and experiment with your own use cases.

Getting Started
===============
Maestro is a PHP/MySQL application, based on the Yii framework (v1). The following procedure will install Maestro on a FreeBSD unix system, which is the Maestro *Reference Server*.

Several parts of the install process are scripted, you are strongly urged to read the scripts first to understand their actions and help resolve any issues that may arise. The scripts support ONLY a vanilla FreeBSD system, but are easily modified for other unix-type systems.
 
First, install and configure the server software required by Maestro.

* "AMP" stack (Apache/MySQL/PHP) - the hosting environment for Maestro (e.g. apache22-2.2.24, mysql-server-5.5.30, php5-5.4.12). Typical PHP extensions required are: pcre, dom, pdo, pdo mysql, mcrypt, gd, ctype, fileinfo, and pdf. *You'll use the Yii "requirements" application shortly, which will identify anything critical missing.*
* [mdbtools](https://github.com/brianb/mdbtools) - used to extract data from a Parts&Vendors database, including restoring SCC data.
* [rsync](http://rsync.samba.org/) - used to synchronize the Maestro file vault with "current" files on a remote file share and also used restore the SCC file vault (using a simulated remote file share).*
* [sSMTP](http://packages.debian.org/stable/mail/ssmtp) - a simple MTA used to transfer mail from Maestro to a mail hub (SMTP server) for delivery. *You can use a different MTA by editing maestro/protected/data/send_current_changereport.sh.*
* [Samba](http://www.samba.org) - used to access the "current" files on a remote MS Windows file share, Samba also enables Parts&Vendors users to access files in the Maestro file vault. *Not required for web-only operation.*

*You can use pkg-install to install Apache, MySQL, mdbtools, rsync, sSMTP, and Samba. PHP must currently be installed from the ports tree to configure building an Apache module.*

After installing, configuring and testing the server software, you can proceed with installing Maestro.

1) Download the [latest Yii v1 release](http://www.yiiframework.com) to your system (e.g. yii-1.1.14.f0fee9.tar.gz).

* Extract the contents to your system and make it readable by Apache.

```
# cd /usr/local/www
# tar -xzf yii-1.1.14.f0fee9.tar.gz
# chown -R www:www yii-1.1.14.f0fe99
```

2) Confirm your system meets Yii's basic requirements using the "Yii Requirement Checker" application included in the Yii framework download, and correct any errors identified. Create a symlink to the requirements application in the Apache webroot, and access the requirements application with your browser (e.g. http://localhost/yii-1.1.14-requirements).

* *Only the MySQL PDO extension is required.*
* *Instead of creating a symlink in the Apache webroot, you can create a "yii-1.1.14-requirements.conf" file in /usr/local/etc/apache22/Includes and restart apache (more on this approach below installing the Maestro application).*

```
# ln -s /usr/local/www/yii-1.1.14.f0fee9/requirements/ /usr/local/www/apache22/data/yii-1.1.14-requirements
```

3) Clone the [Maestro project repo](https://github.com/maestrobpm/maestro) to your system. The master branch contains the most recent release.

```
> cd /usr/local/www/
> git clone git://github.com/maestrobpm/maestro.git maestro
```

* *If you are going to be developing Maestro, first fork the project repo to your own GitHub account, then clone your fork. I then also add an "upstream" remote to my local clone for convenience using the GitHub workflow (i.e. pull from upstream, pull from origin, commit locally, push to origin, and finally send a pull request from your fork).*

4) Create a maestro.conf file and restart Apache.

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

* *This is NOT the most secure way to run Maestro or a Yii application, but it's simple and a place to start.*

5) Edit the MySQL root password in maestro/protected/data/setup.sh for your environment and execute setup.sh. This sets required directory and file permissions, creates the "maestro" database, and migrates the database to the current schema.

* *When a file must be edited for your local environment, in general you should create and edit a copy of the file. This will make it easier to keep changes needed for your specific environment separate from bug fixes and new features (that you will be sending the Maestro project a pull request for ;-)).*

```
> ./setup.sh
...
> cd /usr/local/www/maestro/protected/data/
Apply the above migration? (yes|no) [no]:y
...
>
```

6) Create the Maestro file vault root directory.

```
> mkdir -p /home/samba/maestro
```

If you want Parts&Vendors to be have access to the Maestro file vault, edit /usr/local/etc/smb.conf and the Maestro file vault root directory as an smb share.

```
[maestro]
    comment = Maestro Share
    path = /usr/home/samba/maestro
    public = yes
    read only = no
```

* **THIS CONFIGURATION IS NOT SECURE AND NOT ACCEPTABLE FOR PRODUCTION USE.** All network users have read-write permission in the Maestro file vault, and can add, edit or delete files directly.

7) Load the Swift Construction Company (SCC) data into Maestro. load_demo.sh will successively load each iteration of "current" data, and email the "root" user a change report for each iteration.

* *Skip this step if you want to only load the database, and are not concerned with files in the Maestro file vault.*

* *An iteration is when there is a significant change in the "current" data that Maestro is monitoring for control. This can be data in Parts&Vendors, in master data spreadsheets, or files in a remote file share monitored by Maestro.*

```
> cd maestro/protected/data
> ./load_demo.sh
```

8) Skip to the next step if you you ran ./load_demo.sh in the last step. If not (assuming you want to load the most recent copy of the SCC database data only and not any SCC files), load the Maestro database directly with the most recent SCC data.

```
> mysql -uroot -p --local-infile=1 --show-warnings --verbose < ./load_demo-1.2.0.sql
```

9) You should now be able to access Maestro and login (e.g. [localhost/maestro](http://localhost/maestro)).

For information on using Maestro, you are encouraged to review the Maestro [Guided Tour](http://github.com/maestrobpm/maestro/wiki/Guided-tour).

Code Repository and Issue Tracking
==================================
* [Maestro project repo](https://github.com/maestrobpm/maestro)
* [Maestro issue tracker](https://github.com/maestrobpm/maestro/issues) (also includes milestones)

Communication Channels
======================
At this time, the official communication channel is the [issue tracker](https://github.com/maestrobpm/maestro/issues). Other options (e.g. mailing list, Google Group...) are being considered and will be announced should they become available.

Developer Guidelines
====================
The basic development procedure is:
* Create a GitHub account and use GitHub to fork the Maestro project repo
* Clone your fork locally
* Create a local topic branch off the master branch
* Develop and test your work locally
* Push your topic branch to your GitHub clone
* Issue a pull request with your changes to the Maestro project

All development is currently done in the master branch, the Maestro project will likely move to the [Gitflow model](http://nvie.com/posts/a-successful-git-branching-model/) after release 1.0.

For more information, see the [Maestro wiki](https://github.com/maestrobpm/maestro/wiki).

Project Documentation
=====================
Official project documentation is published in the [Maestro wiki](https://github.com/maestrobpm/maestro/wiki/).

Legal
=====
Maestro source is copyright by its authors, as recorded in the repository commit log. The Maestro project does not use a Contributor Licence Agreement (CLA) or a Copyright Assignment Agreement (CAA). By submitting work to the Maestro project, you acknowledge that a) you have the legal right to do so, and b) you are licensing the work according to the BSD 2-Clause License.

The Maestro name and image are trademarks of Dale Scott, for use according to the [Maestro Trademark and Logo Policy](https://github.com/maestrobpm/maestro/wiki/Trademark-and-logo-policy).

Support
=======
Should you need help, try the following.

* Update your code to the latest commit in the project repo on GitHub.
* Search the [Maestro wiki](https://github.com/maestrobpm/maestro/wiki/).
* Search the [Maestro issue tracker](https://github.com/maestrobpm/maestro/issues).
* Post an issue to [Maestro issue tracker](https://github.com/maestrobpm/maestro/issues).

If you post an issue, try to include as much of the following information as possible.

* What are you trying to achieve?
* What are the symptoms of your problem? Why do you think this  *is* a problem?
* What Maestro version are you using? *Until Maestro has formal releases, give the date you cloned from the GitHub project repo.*
* What server are you using? *E.g. "FreeBSD 9.1, Apache 2.2.22, PHP 5.3.10, and MySQL 5.5.20", "XAMPP Version: 1.8.1".*
* Include as an example, the **simplest** sequence of operations that demonstrates the symptoms, or if you're a developer, the **simplest** code segment.

---

Maestro is a trademark of [Dale Scott](http://www.dalescott.net). Parts&Vendors is a trademark of [Trilogy Design](http://www.trilogydesign.com).
