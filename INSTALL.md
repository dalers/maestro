# Maestro Install

## Create New System

Create a new Centos 7 system, install maestro and software 
pre-requisites, and finally install ERPNext. 

### Install Centos 7

Install Centos v7 from the Centos v7 "Everything-DVD"
    
Select the "Infrastructure Server" install profile with the following 
add-ons: 

* E-mail server
* File and Storage Server (CIFS...)
* Directory Server

Enable networking mode and enter a hostname (e.g. 
whizzer.swiftconstructioncompany.net) 

### Install dos2unix

Eventually anyone working in both Windows and Unix environments will
need to convert a file of one end-of-line format to the other. 

    # yum install dos2unix

### Install mdbtools

Utilities from the MDB Tools project are used to export product data 
from the SCC Parts&Vendors database. The data will be loaded into 
ERPNext. 

Install mdbtools pre-requisites.

    # yum install glib2-devel
    # yum install txt2man
    # yum install gnome-doc-utils

Install mdbtools.

    # cd /root/work
    # git clone https://github.com/brianb/mdbtools.git mdbtools
    # cd mdbtools
    # autoreconf -i -f
    # ./configure
    # make
    # make install

The mdbtools programs are installed to /usr/local/bin/ and each have a 
man page (for short help, use --help with a command). 

* mdb-array
* mdb-export
* mdb-header
* mdb-hexdump
* mdb-parsecsv
* mdb-prop
* mdb-schema
* mdb-sql
* mdb-tables
* mdb-ver

### Install ERPNext

Follow the ERPNext project "*[Easy 
Way](https://github.com/frappe/bench/blob/master/README.md)*" to install 
ERPNext v4 on Centos 7. 

#### Configure firewalld

    # firewall-cmd --zone=public --add-service=http  --permanent
    # firewall-cmd --zone=public --add-service=https --permanent
    # firewall-cmd --zone=public --add-service=mysql --permanent
    # firewall-cmd --reload

*firewalld can also be reloaded by "systemctl reload firewalld".*

#### Configure MariaDB for remote access

Configure MariaDB to allow remote access if desired (only required for remote access directly to database).

    # mysql -uroot -p
    mysql > SELECT User, Host FROM mysql.user WHERE Host <> 'localhost';
    mysql > GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'see-frappe_passwords.txt' WITH GRANT OPTION;

#### Verify ERPNext is Live

Connect to the system from a web browser. You should see an ERPNext 
login screen in your browser. You do not need to login at this time (but
if you did need to, the password is in /root/frappe_passwords.txt)

### Install Maestro

Create maestro directory and clone maestro project repository.

    # mkdir /home/maestro ; cd /home/maestro
    # cd /home
    # git clone http://github.com/dalers/maestro maestro-repo

Create SCC Maestro data directory.

    # cd /home/maestro/maestro-repo/scc/bin
    # ./setup_file_share.sh

Create SCC system users.

    # cd /home/maestro/scc/bin
    # ./setup_adduser_centos.sh

Restore SCC file iterations

    # cd /home/maestro/scc/bin
    # ./run_iterations.sh

Configure cron job for daily reporting of new and modified PLM data.

    # vi /etc/crontab

    [root@hotstuff bin]# cat /etc/crontab
    SHELL=/bin/bash
    PATH=/sbin:/bin:/usr/sbin:/usr/bin
    MAILTO=root
    
    # For details see man 4 crontabs
    
    # Example of job definition:
    # .---------------- minute (0 - 59)
    # |  .------------- hour (0 - 23)
    # |  |  .---------- day of month (1 - 31)
    # |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
    # |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
    # |  |  |  |  |
    # *  *  *  *  * user-name  command to be executed
    #
    # epd2
    #1      2       *       *       *       root    /home/maestro/maestro-repo/scc/bin/rsync_current_files_bhi.sh
    20      2       *       *       *       root    /home/maestro/maestro-repo/scc/bin/export_current_to_csv.sh
    30      2       *       *       *       root    /home/maestro/maestro-repo/scc/bin/send_current_change_report_bhi.sh

*Currently only reporting of new and modified data is done automatically, but eventually new and modified data will also be imported automatically into ERPNext.*

## Load Maestro SCC Data into ERPNext

Maestro data can be loaded into ERPNext in several ways:

1. entering data manually by hand, importing bulk data from spreadsheets when possible
2. restoring from a Maestro release or existing backup

### Load Data Manually
#### New Install Wizard

Login as Administrator using the password in /root/frappe_passwords.txt. 
The New Install Wizard will run automatically. 

* Language: english
* System Manager
    * First Name: Administrator
    * Last Name: User
    * Email Id: root@whizzer.swiftconstructioncompany.net
    * Password: appleton
- Country, Timezone and Currency
    * Country: Canada
    * Default Currency: CAD
    * Time Zone: America/Edmonton
- Organization
    * Company Name: Swift Construction Co.
    * Company Abbreviation: SCC
    * Financial Year Start Date: 01-01-2015
    * Financial Year End Date: 12-31-2015
    * What does it do: Excellence in Innovation
- Customers
    * (none)
- Vendors
    * (none)
- Product
    * (none)

#### Import Users

* Import users from a csv-format file.

#### Configure Users

A user is assigned one or more security Roles, based on the access 
needed to information and processes. 

Default Roles in new ERPNext v4 system:

* Accounts Manager
* Accounts User
* Analytics
* Auditor
* Blogger
* Customer
* Employee
* Expense Approver
* HR Manager
* HR User
* Leave Approver
* Maintenance Manager
* Maintenance User
* Manufacturing Manager
* Manufacturing User
* Material Manager
* Material Master Manager
* Material User
* Projects Manager
* Projects User
* Purchase Manager
* Purchase Master Manager
* Purchase User
* Quality Manager
* Report Manager
* Sales Manager
* Sales Master Manager
* Sales User
* Supplier
* Support Manager
* Support Team
* System Manager
* Website Manager

1) Tom Swift

* Personal Info
	* First Name
	* Last Name
* Set Password
* Display Settings
* Short Bio
* Roles
	* All, except for Employee
* Email Settings
	* Email Signature
* Security Settings
	* User Type: System User
* Third Party Authentication

2) James Period

* Personal Info
	* First Name
	* Last Name
* Set Password
* Display Settings
* Short Bio
* Roles
	* All, except for Employee
* Email Settings
	* Email Signature
* Security Settings
	* User Type: System User
* Third Party Authentication

3) Miquel DeLazes

* Personal Info
	* First Name
	* Last Name
* Set Password
* Display Settings
* Short Bio
* Roles
	* All, except for Employee
* Email Settings
	* Email Signature
* Security Settings
	* User Type: System User
* Third Party Authentication

4) Ned Newton

* Personal Info
	* First Name
	* Last Name
* Set Password
* Display Settings
* Short Bio
* Roles
	* All, except for Employee
* Email Settings
	* Email Signature
* Security Settings
	* User Type: System User
* Third Party Authentication

5) Rad Sampson

* Personal Info
	* First Name
	* Last Name
* Set Password
* Display Settings
* Short Bio
* Roles
	* All, except for Employee
* Email Settings
	* Email Signature
* Security Settings
	* User Type: System User
* Third Party Authentication

#### Create Item Attributes

Create required new Item attributes:

TODO - must be updated.

```
PNUser1       User1                          Char
PNUser2       User2                          Char
PNUser3       User3                          Char
PNUser4       User4                          Char
PNUser5       User5                          Char
PNUser6       User6                          Char
PNUser7       User7                          Char
PNUser8       User8                          Char
PNUser9       User9                          Char
PNUser10      User10                         Char
PNID          PNID (int)                     Integer
PNUNID        PNUNID (int)                   Integer
PNType        Type (CAT,PL,DWG,PS,AW,DOC)    Char
PNRevision    Rev (1...)                     Char
PNDetail      Detail                         Char
PNStatus      Status (U,R,O)                 Char
PNReqBy       By                             Char
PNDate        Date (dd-mm-yyyy)              Char
```

#### Create Units of Measure

TODO - must be updated.

One of the units in an "UOM Category" is assigned Factor and Rate both 
equal to 1, and the other units in the UOM Category are expressed in 
terms of that unit. For example, a meter (m) is a unit of length, and 
has factor and rate of 1. The other units of length (mile, kilometre, 
centimetre and millimetre) are expressed in terms of meters. 

```
Name          Symbol      UOM Cat  Factor   Rate            Rounding Precision
--------------------------------------------------------------------------
spool66FT     spl66FT     Length   20.1168  0.049709695378  0.01
spool100FT    spl100FT    Length   30.48    0.032808398950  0.01
spool19300FT  spl19300FT  Length   5882.64  0.000169991704  0.01
```

#### Load Items

1) Login as Administrator

2) Menu: Stock > Item > List View > Import

scc-products.csv is created using concatenated name and detail as name:

* export PN table from a P&V database using mdbtools (pv_pn.csv)
* copy export from P&V PN table (e.g. scc/plm-scc-csv-5/pv_pn.csv)
* add column PNTitleDetail =CONCATENATE(J2,IF(K2="","",CONCATENATE(" : ",K2)))
* copy/paste PNTitleDetail column as text to replace formula
* sort by PNTitleDetail
* sort by PNID (or PNPartNumber?)
* delete all columns except those included in attribute matrix
* edit column titles according to attribute matrix

**Attribute Matrix**

```
P&V PN Field         -> ERPNExt Attribute
-----------------------------------------------------------			
PNID                 -> product-attribute PNID
PNUNID               -> product-attribute PNUNID
PNPartNumber         -> Code
PNType               -> product-attribute PNType
PNRevision           -> product-attribute PNRevision
PNTitle              -> Name
PNDetail             -> product-attribute PNDetail
PNStatus             -> product-attribute PNStatus
PNReqBy              -> product-attribute PNReqBy
PNNotes              -> Detail
PNUser1...PNUser10   -> product-attribute PNUser1..PNUser10
PNDate               -> product-attribute PNDate 
```
Keys
- PNID, primary part key (partslist table references using fk)
- PNUNID (fk to table UN)
- PNTYPE (fk to table TYPE)

Notes
* PNSTATUS contains status value (i.e. "U", "R", or "O"), but could 
(should?) be fk to STATUSID in table STATUS (that is, if table STATUS 
existed). 

#### Load BOMs

1) Menu: Manufacturing > Product > xxx > Bill of Materials > Create

2) Create BoMs as per scc/plm/csv-5/pv_pl.csv

```
10000003 ASSY,MKTG,AIRCRAFT WIRELESS
|--- 90000012 EARPH,MONO,HI-Z,3.5MM
|--- 50000001 DOC,USER,AIRCRAFT WIRELESS
|--- 80000005 BOX,SHIPPING,5X4X2,CARDBOARD,WHITE
\--- 10000001 ASSY,AIRCRAFT WIRELESS
     |--- 10000002 ENCL,AIRCRAFT WIRELESS
     |    \--- 80000001 BOX,IP54,4.74X3.13X2.17",ALUM,BLK,SCREWS
     |--- 20000003 PCA,AIRCRAFT WIRELESS
     |    |--- 20000001 IND,830UH,AIRCRAFT WIRELES
     |    |    |--- 90000001 WIRE,MAGNET,38AWG,POLY
     |    |    |--- 90000002 MAG,FERRITE ROD,1/4IN X 4IN,MATL=61
     |    |    \--- 90000003 TAPE,ELECTRICAL,3/4",BLUE,VINYL
     |    |--- 20000002 PCB,AIRCRAFT WIRELESS
     |    |--- 90000004 CONN,PHONE,F,MONO,PCB,3.5MM
     |    |--- 90000005 CAPV,150-230PF,TOP ADJUST,PCB
     |    |--- 90000006 DIO,SIG,GERM,0A95,AXIAL,D0-7,GLASS
     |    |--- 90000007 CAP,ELEC,10UF,16V,20%,RADIAL,ROHS
     |    |--- 90000008 CAP,CER,33PF,100V,10%,RADIAL,ROHS
     |    |--- 90000009 CAP,CER,3300PF,100V,10%,RADIAL,ROHS
     |    |--- 90000010 RES,AXIAL,2.0M,0.4W,1%,MF,ROHS
     |    \--- 90000011 RES,AXIAL,5.6M,0.4W,1%,MF,ROHS
     |--- 80000003 SCREW,MACHINE,PHIL,4-40X1/4,SS
     |--- 80000004 WASHER,FLAT,4-40
     |--- 80000006 STANDOFF,HEX,4-40,0.5"L,ALUM
     |--- 80000007 WASHER,LOCK,#4,INTERNAL TOOTH
     |--- 90000014 CONN,BINDING POST BANANA,INSUL,GRN
     |--- 90000015 CONN,BINDING POST BANANA,INSUL,YEL
     |--- 90000016 CONN,RING,16-22AWG,#4,RED
     |--- 90000017 WIRE,STRANDED,16AWG,GREEN,POLY
     \--- 90000018 WIRE,STRANDED,16AWG,YELLOW,POLY

60000001 ASSY,FIELD SPARES,AIRCRAFT WIRELESS
|--- 90000012 EARPH,MONO,HI-Z,3.5MM Maplin LB25C
|--- 20000003 PCA,AIRCRAFT WIRELESS Trilogy-Net SCC:20000003
\--- 50000001 DOC,USER,AIRCRAFT WIRELESS
```

#### Load Vendors

Load vendors.

#### Load Customers

Load customers.

#### Load Projects

Load projects.

### Load Maestro SCC Data from Backup

Maestro data can be restored to an existing ERPNext install (restoring 
from backup data to site1.local). 

* drop site1.local database (created during ERPNext install)
* load Maestro database (first re-creates database)
* restore Maestro files and set ownership (frappe:frappe)
 
