Maestro(TM) is a web-based application for design, manufacturing and sales teams to manage and share information related to parts, projects, material (simple, serialized, or lot controlled), issues and people. Maestro places "current" information under control in an environment of *Transparency with Trust*. Maestro can also be used to replace a Parts&Vendors(TM) system.

Maesto includes a complete data set for the fictional Swift Construction Company (SCC). 

The purpose of the [Maestro project](https://github.com/dalers/maestro) is to create, as a community, the leading platform for integrating SME business processes. Maestro is in active development. For more information, see the [Maestro project wiki](https://github.com/dalers/maestro/wiki). Maestro is an open source project, using the permissive business-friendly [BSD 2-Clause License](http://opensource.org/licenses/BSD-2-Clause).

Getting Started
===============
Maestro is a PHP web-based application based on the Yii framework (v1), and uses a MySQL database. This procedure assumes Maestro is being installed on a FreeBSD system.

Install and configure the web server stack and other system requirements.

* "AMP" stack (Apache/MySQL/PHP) - the hosting environment for Maestro (e.g. apache22-2.2.24, mysql-server-5.5.30, php5-5.4.12). Typical PHP extensions required are: pcre, dom, pdo, pdo mysql, mcrypt, gd, ctype, fileinfo, and pdf. *You'll use the Yii "requirements" application shortly, which will identify anything critical missing.*
* [mdbtools](https://github.com/brianb/mdbtools) - used to extract data from a Parts&Vendors database, including restoring SCC data.
* [rsync](http://rsync.samba.org/) - used to synchronize the Maestro file vault with "current" files on a remote file share and also used restore the SCC file vault (using a simulated remote file share).*
* [sSMTP](http://packages.debian.org/stable/mail/ssmtp) - a simple MTA used to transfer mail from Maestro to a mail hub (SMTP server) for delivery. *You can use a different MTA by editing maestro/protected/data/send_current_changereport.sh.*
* [Samba](http://www.samba.org) - publishes an MS Windows network share for storing "current" files, or to access "current" files on a remote MS Windows file share.

Install Maestro.

1) Download the [latest Yii v1.x release](http://www.yiiframework.com) to your system.

* Extract the contents to your system and make it readable by Apache.

```
# cd /usr/local/www
# tar -xzf yii-1.1.14.f0fee9.tar.gz
# chown -R www:www yii-1.1.14.f0fe99
```

2) Confirm Yii system requirements are met using the "Yii Requirement Checker" application included in the Yii framework download.

*Only the MySQL PDO extension is used by Maestro.*

Create a link in the /usr/local/www/ to the yii install directory (Maestro assumes the yii install directory is called "yii", and is in the same parent directory as Maestro).

```
> cd /usr/local/www/
> ln -s yii-1.1.14.f0fe99 yii
```

3) Clone the [Maestro project repo](https://github.com/dalers/maestro-yii) to your system.

```
> cd /usr/local/www/
> git clone git://github.com/dalers/maestro-yii maestro
```

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

*This is not necessarily secure, but it's a place to start.*

5) Edit the MySQL root password in maestro/protected/data/setup.sh for your environment and execute setup.sh. This sets required directory and file permissions, creates the "maestro" database, and migrates the database to the current schema.

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
> mkdir -p /home/maestro/scc
```

If you want Parts&Vendors to be have access to the Maestro file vault, edit /usr/local/etc/smb.conf and the Maestro file vault root directory as an smb share.

```
[maestro]
    comment = Maestro Share
    path = /home/maestro/scc
    public = yes
    read only = no
```

7) Load the Swift Construction Company (SCC) data into Maestro. The load_demo.sh script loads a series of current data "iterations", and emails a change report for each iteration.

```
> cd maestro/protected/data
> ./load_demo.sh
```

8) Skip to the next step if you you ran ./load_demo.sh in the last step. If not (assuming you want to load the most recent copy of the SCC database data only and not any SCC files), load the Maestro database directly with the most recent SCC data.

```
> mysql -uroot -pappleton --local-infile=1 --show-warnings --verbose < ./load_demo-1.2.0.sql
```

9) You should now be able to access Maestro and login (e.g. [localhost/maestro](http://localhost/maestro)).

For information on using Maestro review the [Maestro Guided Tour](http://github.com/dalers/maestro/wiki/Guided-tour).

Code Repository and Issue Tracking
==================================
* [Maestro project repo](https://github.com/dalers/maestro-yii)
* [Maestro issue tracker](https://github.com/dalers/maestro-yii/issues) (includes project milestones)

Communication Channels
======================
At this time, the official communication channel is the [issue tracker](https://github.com/dalers/maestro-yii/issues).

Developer Guidelines
====================
The basic development procedure is:
* Create a GitHub account and use GitHub to fork the Maestro project repo
* Clone your fork locally
* Create a local topic branch off the master branch
* Develop and test your work locally
* Push your topic branch to your GitHub clone
* Issue a pull request with your changes to the Maestro project

All development is currently done in the master branch.

For more information, see the [Maestro wiki](https://github.com/dalers/maestro/wiki).

Project Documentation
=====================
Official project documentation is published in the [Maestro wiki](https://github.com/dalers/maestro/wiki/).

Legal
=====
Maestro source is copyright by its authors, as recorded in the repository commit log. The Maestro project does not use a Contributor Licence Agreement (CLA) or a Copyright Assignment Agreement (CAA). By submitting work to the Maestro project, you acknowledge that a) you have the legal right to do so, and b) you are licensing the work according to the BSD 2-Clause License.

The Maestro name and image are trademarks of Dale Scott, for use according to the [Maestro Trademark and Logo Policy](https://github.com/dalers/maestro/wiki/Trademark-and-logo-policy).

Support
=======
Should you need help, try the following.

* Update your code to the latest commit in the project repo on GitHub.
* Search the [Maestro wiki](https://github.com/dalers/maestro/wiki/).
* Search the [Maestro-Yii issue tracker](https://github.com/dalers/maestro-yii/issues)
* Post an issue to [Maestro issue tracker](https://github.com/dalers/maestro-yii/issues).

If you post an issue, try to include as much of the following information as possible.

* What are you trying to achieve?
* What are the symptoms of your problem? Why do you think this  *is* a problem?
* What Maestro version are you using? *Until Maestro has formal releases, give the date you cloned from the GitHub project repo.*
* What server are you using? *E.g. "FreeBSD 9.1, Apache 2.2.22, PHP 5.3.10, and MySQL 5.5.20", "XAMPP Version: 1.8.1".*
* Include as an example, the **simplest** sequence of operations that demonstrates the symptoms, or if you're a developer, the **simplest** code segment.

---

Maestro is a trademark of [Dale Scott](http://www.dalescott.net). Parts&Vendors(TM) is a trademark of [Trilogy Design](http://www.trilogydesign.com).
