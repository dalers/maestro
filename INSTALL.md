Maestro is a PHP web-based application based on the Yii framework (v1), 
and uses a MySQL database. This procedure assumes Maestro is being 
installed on a FreeBSD system. 


## System Requirements

* "AMP" stack (Apache/MySQL/PHP) - the hosting environment for Maestro 
 (e.g. apache22-2.2.24, mysql-server-5.5.30, php5-5.4.12). Typical PHP 
 extensions required are: pcre, dom, pdo, pdo mysql, mcrypt, gd, ctype, 
 fileinfo, and pdf. *You'll use the Yii "requirements" application 
 shortly, which will identify anything critical missing.* 
* [mdbtools](https://github.com/brianb/mdbtools) - for extracting data 
 from Parts&Vendors(TM) (used previously by the SCC for PLM). 
* [rsync](http://rsync.samba.org/) - for synchronizing "current" files 
 stored on a remote Windows-compatible file share. 
* [Samba](http://www.samba.org) - for providing Windows-compatible 
 access to "current" files located on the maestro server. 
* Mail Server (e.g. Postfix)
* Webmail Client (e.g. SquirrelMail)
* User Authentication (e.g. OpenLDAP with phpLdapAdmin)

## Install Maestro

1) Download the [latest Yii v1.x release](http://www.yiiframework.com) 
 to your system. 

* Extract the contents to your system and make it readable by Apache.

```
# cd /usr/local/www
# tar -xzf yii-1.1.14.f0fee9.tar.gz
# chown -R www:www yii-1.1.14.f0fe99
```

2) Confirm Yii system requirements are met using the "Yii Requirement 
Checker" application included in the Yii framework download. 

*Maestro requires only the MySQL PDO extension for its database connection.*

Create a link in the /usr/local/www/ to the yii install directory 
 (Maestro assumes the yii install directory is called "yii", and is in 
 the same parent directory as Maestro). 

```
> cd /usr/local/www/
> ln -s yii-1.1.14.f0fe99 yii
```

3) Clone the [Maestro project 
 repo](https://github.com/dalers/maestro-yii) to your system. 

```
> cd /usr/local/www/
> git clone git://github.com/dalers/maestro maestro
```

4) Create a maestro.conf file and restart Apache.

```
> vi /usr/local/etc/apache24/Includes/maestro.conf

Alias /maestro "/usr/local/www/maestro"

<Directory "/usr/local/www/maestro">
    Require all granted
</Directory>


> service apache24 restart
```

*This is not necessarily secure, but it's a place to start.*

5) Execute /usr/local/www/maestro/protected/data/bin/setup.sh to create 
standard directories and set permissions, etc. Review the script and 
edit if desired for your environment. 


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

If you will be editing master spreadsheets from a Windows computer, or 
if you will be using Parts&Vendors, you will need to provide access to
the files on the Maestro server by configuring a CIFS (SMB) share. 

Edit /usr/local/etc/smb.conf and add the path to the Maestro file vault.

```
[maestro]
    comment = Maestro Share
    path = /home/maestro/scc
    public = yes
    read only = no
```

7) Load the Swift Construction Company (SCC) data into Maestro. The 
 run_iterations.sh script successively loads the PLM "iterations" and 
 emails a change report for each iteration.
 
If you just want to load the demo data, skip to the next step.

```
> cd maestro/protected/data/bin
> ./run_iteration_all.sh
```

8) If you just want to load the most recent copy of the SCC database, and
are not concerned with part documents, you can simply load the demo data
SQL file.

```
> mysql -uroot -pappleton --local-infile=1 --show-warnings --verbose < /usr/local/www/maestro/protected/data/sql/demo.sql
```

9) You should now be able to access Maestro and login (e.g. [localhost/maestro](http://localhost/maestro)).

For information on using Maestro, please review the [Maestro Guided Tour](http://github.com/dalers/maestro/wiki/Guided-tour).
