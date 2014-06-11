## Tryton Project

- [Tryton Project Website](http://www.tryton.org/)
- [Tryton News](http://news.tryton.org/)
- [Documentation (http://doc.tryton.org/)](http://doc.tryton.org/)
- [Mailing Lists, IRC, Wiki, Presentations and Papers](http://www.tryton.org/community.html)
- [Wiki (Google Code)](http://code.google.com/p/tryton/wiki)
- [Downloads](http://www.tryton.org/download.html)
- [Bug Tracker (https://bugs.tryton.org/)](https://bugs.tryton.org/)
- [Source Control (http://hg.tryton.org)](http://hg.tryton.org/)
	- [Modules (http://hg.tryton.org/modules)](http://hg.tryton.org/modules)

### Google Groups Mailing List
(English-language only are listed)
- [Tryton (general)](https://groups.google.com/forum/#!forum/tryton)
- [Tryton-Dev (core coding and architecture design)](https://groups.google.com/forum/#!forum/tryton-dev)

### Demo
- demo for GTK client – demo.tryton.org:8000
- [demo for “sao” web client](https://demo.tryton.org:8000/) (userid/password: admin/admin)

### Definitions
- Tryton – project name
- trytond – server daemon
- tryton – GTK client
- Nereid - framework for developing a web user interfaces to Tryton, based on flask.
- neso – standalone client+server (uses SQLite DBMS). Intended for use in demonstrations, and to give developers and testers a simple vehicle for evaluating new releases.
- proteus – Python library to access Tryton server, most popular use appears to be for testing.
	- [Proteus Overview](http://downloads.tryton.org/TUB2013/proteus.pdf)
- sao - web client (attempts to provide equivalent functionality as tryton client) 

## External Resources

- Openlabs Tryton documentation
	- [Tryton Community Documentation (ReadTheDocs)](http://tryton-documentation.readthedocs.org/en/latest/index.html)
		- [PDF Version](https://media.readthedocs.org/pdf/tryton-documentation/latest/tryton-documentation.pdf)
	- [Tryton Documentation project (GitHub)](https://github.com/tryton/tryton-documentation/blob/master/developer_guide/getting_started.rst)
- [Spanish Tryton manual (http://doc.tryton-erp.es)](http://doc.tryton-erp.es)
	- [English translation](http://translate.google.com/translate?sl=auto&tl=en&u=http%3A//doc.tryton-erp.es/)
- [OpenERP to Tryton (assumes familiarity with OpenERP)(NaN-tic)](http://www.openerp2tryton.com/users.html)
- [Tryton 2.2 administration manual (Google Docs)](https://docs.google.com/document/d/1wPjdd965wy0_WlQCu8nCw1zl9GJ9xa2jQHQflpiBx98/mobilebasic?authkey=CLK6q9gK#h.etd8pr3oaqqv)
- [3-Part blog series on Tryton (Version2Beta)](http://version2beta.com/articles/evaluating-tryton-as-an-ecommerce-backend_web-framework/)
- [Tryton slideshow (NaN-tic)](http://www.slideshare.net/NaN-tic/tryton-16270050)

### Wikipedia
- [Tryton - Wikipedia article](http://en.wikipedia.org/wiki/Tryton)
- [Tryton vs OpenERP - Wikipedia article](http://en.wikipedia.org/wiki/Comparison_of_Tryton_and_Open_ERP)

### YouTube
- TODO

### Floss Manuals
- http://booki.flossmanuals.net/tryton-erp/_info/
- http://booki.flossmanuals.net/tryton-erp/_draft/_v/1.0/installing-tryton/

### Tumblr
- openlabs-engineering
- dev-openerp

### Related
- [Experience OpenERP deployments in French companies (case study)](http://translate.google.com/translate?depth=1&hl=en&rurl=translate.google.com&sl=fr&tl=en&u=http://people.via.ecp.fr/~alexis/openerp/) (Google English translation)

## Getting Started ##

- [Setup and Install (Community Wiki)](http://code.google.com/p/tryton/wiki/SetupAndStart)
- [Hello World (Tryton Project Wiki - Google Code)](http://code.google.com/p/tryton/wiki/HelloWorld)
	- [Recent Tryton "Hello World" discussion](https://groups.google.com/forum/#!topic/tryton/21oJqWKbFUI) on tryton group
- [Tryton Development Workflow Series (Openlabs blog posts) ](http://engineering.openlabs.co.in/post/72769275514/part-1-tryton-development-workflow-series-repository)
- [HelloworldModule (http://wiki.tryton-erp.es/)](http://wiki.tryton-erp.es/HelloworldModule)

### CSV import/export
- [Code patch recommended by Spanish Tryton Manual](http://codereview.tryton-erp.es/85/patch/192/2342)
	- See [Import product by CSV in Spanish Tryton Manual](http://translate.googleusercontent.com/translate_c?depth=1&rurl=translate.google.com&sl=auto&tl=en&u=http://www.tryton-erp.es/posts/importacion-de-productos-mediante-csv.html&usg=ALkJrhjCvQZ5VqEj5mayYaTJA-rtA_CMtg) 

### FreeBSD

- trytond installed (with pip) to /usr/local/lib/python2.7/site-packages/trytond/

### Coding Guidelines
- [Python Packaging Documentation](https://python-packaging-user-guide.readthedocs.org/en/latest/tutorial.html)

### tryton.conf
- jsondata_path (path of json-rpc data) – see tryton28 port?
- database connection
```
#db_host = False
#db_port = False
#db_user = False
#db_password = False
#db_minconn = 1
#db_maxconn = 64
```
- pg_path (postgresql path for the executable)
- pidfile (path of the file for the pid)
- logfile (path of the file for the logs)
- data_path (path to store attachments and sqlite database)
- unoconv (unoconv connection)

### Installing a Module
Either:

```
# pip install module
```
 or 

```
cp helloworld trytond/modules/
```

Reload modules list (“all” for all modules)

```
python trytond -c /etc/tryton -u a_module -d databasename
```

### Troubleshooting
- [Install on Gentoo](http://wiki.gentoo.org/wiki/Tryton)
- [Cannot connect to tryton via internet (StackOverflow)](http://stackoverflow.com/questions/22064595/cannot-connect-to-tryton-postgresql-via-internet)
- [Installing on FreeBSD](http://booki.flossmanuals.net/tryton-erp/linux-and-freebsd-installation/)
- [Debian Install](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=592908)

## Related Projects

### FreeBSD
- Latest release in FreeBSD ports/packages is Tryton 2.8 (current Tryton relese 3.2)
- [http://code.google.com/p/tryton/wiki/InstallationFreeBSD (see comments re outdated)](http://code.google.com/p/tryton/wiki/InstallationFreeBSD)
 - https://groups.google.com/forum/#!msg/tryton/fX8lRUFuH18/ss3ghEGTmhwJ (proposed update to wiki, assumes 2.8 port)
- [http://booki.flossmanuals.net/tryton-erp/linux-and-freebsd-installation/](http://booki.flossmanuals.net/tryton-erp/linux-and-freebsd-installation/) (Tryton ~1.4)
- [Python on FreeBSD (Japanese slideshare)](http://www.slideshare.net/pycontw/python-on-freebsd)

### [Nereid](http://nereid.openlabs.co.in/en/develop/index.html)
Nereid is a framework for developing a web user interface to Tryton, expected to be particularly useful for providing Tryton access to external stakeholders. Nereid is based on flask, a Python web app framework (also see [OpenERP to Tryton)](http://www.openerp2tryton.com/users.html).

- [Nereid Documentation (Openlabs)](http://nereid.openlabs.co.in/en/develop/index.html)
- [Nereid Documentation (readthedocs)](http://nereid.readthedocs.org/en/develop/)
- [Nereid Demo Store (overview)](http://openlabs.github.io/nereid-demo-store/).
	- [Demo Site](http://nereid-webshop-demo.openlabs.us/)
	- Product data taken from [icecat, the open catalogue](http://www.icecat.biz/)

### Nereid Project
Nereid Project is an open-source collaborative development platform created by [Openlabs](http://www.openlabs.co.in/). It is used at Openlabs to manage software projects & tasks, but can be used for managing any kind of project. The aim is to connect everything together on a single interface, avoiding unnecessary time consumption, and track project’s progress, task’s status, shared files, and time spent on individual tasks.

Sharoon Thomas (Openlabs): "We have extended project management module of Tryton to do this for us and we have a web app built around it. We are a software development shop and the issues are obviously tasks, bugs etc. However, we also know users who use it for other purposes like the ones you mentioned. The design is completely extensible and you can adapt it to do the additional integrations with sales etc.".

- [Nereid Project Documentation (with screenshots)](http://tryton-nereid-project.readthedocs.org/en/latest/)

### OpenERP
- Enapps - forked OpenERP core with enhanced web interface (including OpenERP 6.1 extended support):
	- http://www.enapps.co.uk/new-web-clientserver-revision-marking-a-new-level-in-business-productivity/
	- http://www.enapps.co.uk/new-web-clientserver-revision-marking-a-new-level-in-business-productivity/

### [Roundup Issue Tracker](http://www.roundup-tracker.org/)
- [Recommended by Cedric Krier May 29 for integration with Tryton as Issue Tracker](https://groups.google.com/forum/#!topic/tryton/ek5-_LV-RT0)

### sao
- sao is a Javascript web client, attempts to be equivalent to the native tryton client
- appears functional – see [tryton-dev goglegroups thread 2014-03-07](http://comments.gmane.org/gmane.comp.python.tryton.devel/4915).
- [NPO Accounting project for Tryton on Gitorious](https://gitorious.org/conservancy/npo-acct-wiki/source/7c3d12364858ee0189f3904f02e56546b0c704e0:ExistingProjects/Tryton.mdwn)
	- reference to community modules on bitbucket
	- reference to “sao” web client with demo on tryton.org ([demo](https://demo.tryton.org:8000/))

## Tryton Foundation

The Tryton Foundation:
- aims to develop and support conferences, meetings and community activities,
- holds and administers the tryton.org infrastructure
- organizes the community of supporters,
- manages and promotes the Tryton trademark.

The Foundation is composed of a Board of Directors, responsible for managing day to day duties of the foundation and nomination (acceptance?) of new members. 

Officially created 2012-11-20 by:
- KRIER, Cedric ([B2CK](http://www.b2ck.com))
- CHENAL, Bertrand Jean-Louis Dominique ([B2CK](http://www.b2ck.com))
- EVRARD, Nicolas Eric Andrew Robert Ghislain ([B2CK](http://www.b2ck.com))

Board of Directors (as of 2014-06-02)
- Albert Cervera i Areny, Spain ([NaN-tic](http://www.nan-tic.com/en/))
- Bertrand Chenal, Belgium (1st president) ([B2CK](http://www.b2ck.com))
- Cédric Krier, Belgium ([B2CK](http://www.b2ck.com))
- Nicolas Évrard, Belgium ([B2CK](http://www.b2ck.com))
- Udo Spallek, Germany (Preisler & Spallek, [Virtual-Things](http://www.virtual-things.biz))
- Sebastián Marró, Argentina 
- Sharoon Thomas, India ([Openlabs](http://www.openlabs.co.in))

"Supporters" are people and organizations recognized by the Board of Directors for their activity in the Tryton community. Supporters represent the community in general to the Board of Directors. 

- Albert Cervera i Areny ([B2CK](http://www.b2ck.com))
- Bio Eco Forests
- Cédric Krier ([B2CK](http://www.b2ck.com))
- Coopengo
- gcoop - Cooperativa de Software Libre
- Jonathan Levy
- Leuchter Open Source Solutions AG
- Luis Falcón
- Mathias Behrle, Germany ([MBSolutions](http://m9s.biz))
- NaN Projectes de Programari Lliure, S.L. ([NaN·tic](http://www.nan-tic.com/en/))
- Nicolas Évrard ([B2CK](http://www.b2ck.com))
- [Openlabs Technologies & Consulting (P) Limited](http://www.openlabs.co.in)
- Ralf Peschke
- SISalp
- Sebastián Marró
- [Sharoon Thomas (Openlabs)](http://www.openlabs.co.in)
- [Thymbra](http://www.thymbra.com/)
- Udo Spallek (Preisler & Spallek, [Virtual-Things](http://www.virtual-things.biz))
- Varun Kumar
- Zikzakmedia, S.L.

## Detailed Partner Information

### [B2CK](http://www.b2ck.com)
- [News (http://www.b2ck.com/news/index.html)](http://www.b2ck.com/news/index.html)
- Created multi-notebook patch
	- [Screenshot for multi-notebook patch](http://www.b2ck.com/~ced/tryton-multi-notebook.png)

### [NaN-tic](http://www.nan-tic.com/en/)
- Founded 2008, based in Barcelona, Spain. Specializes in ERP, was OpenERP partner 2009-2010 but now prefers Tryton. Business agreement with OpenLabs.
- [Module repository on BitBucket](https://bitbucket.org/nantic/)
- Albert Cervera Areny: We created several small modules extending projects and tasks for our own needs. We're not using Nereid Project yet, but I think we should try it soon..
	- [Nantic project modules on Bitbucket](https://bitbucket.org/nantic/profile/repositories?search=project)

### [Openlabs](http://www.openlabs.co.in)
- [GitHub Tryton Mirror](https://github.com/tryton)
	- [Announcement of Openlabs Github Mirror on Tryton-Dev group](https://groups.google.com/forum/#!topic/tryton-dev/0UMgTirPdZw)
- [GitHub Tryton Documentation project](https://github.com/tryton/tryton-documentation/blob/master/developer_guide/getting_started.rst)
- Lists Calgary contact on website
- Tutorials
 - [Tryton development workflow at Openlabs](http://engineering.openlabs.co.in/post/72769621921/tryton-development-workflow-at-openlabs)
 - [Pt 1 - Tryton development workflow series - Repository](http://engineering.openlabs.co.in/post/72769275514/part-1-tryton-development-workflow-series-repository)
 - [Pt 2 - Tryton development workflow series - Project](http://engineering.openlabs.co.in/post/72769297075/part-2-tryton-development-workflow-series-project)
 - [Pt 3 - Tryton development workflow series - Code Review](http://engineering.openlabs.co.in/post/72769329161/part-3-tryton-development-workflow-series-code)
 - [Pt 4 - Tryton development workflow series - Pull Requests & Continuous Integration](http://engineering.openlabs.co.in/post/72769367053/part-4-tryton-development-workflow-series-pull)
 - [Pt 5 - Tryton development workflow series - Deploying & Monitoring](http://engineering.openlabs.co.in/post/72769399345/part-5-tryton-development-workflow-series-deploying)
 - [CSV Reports for Tryton](http://engineering.openlabs.co.in/post/28108366021/csv-reports-for-tryton)

### [Thymbra](http://blog.thymbra.com)
- Specializes in ERP and Medical Informatics in Europe and Latin America.
- [Thymbra Blog(http://blog.thymbra.com)](http://blog.thymbra.com)
- Creator of [Occhiolino](http://lims.gnu.org/partners.html) - The GNU LIMS (Laboratory Information Management System) 


