Maestro
=======
***Maestro*** is ***The ERP for Engineers***, a web-based ERP system that provides ***Trust and Transparency*** to design, manufacturing and support teams.

*Maesto is <b>NOT</b> suitable for production use at this time.*

Maestro manages information related to projects, parts, stock, issues and people. Maestro draws inspiration from  *Parts&Vendors*<sup>*TM*</sup>, a Windows desktop PLM software application produced by Trilogy Design (no longer in business), adding enterprise features that include single-entry accounting and true multi-user operation (Parts&Vendors used a Microsoft Jet-2 database, aka Access, which became problematic with a large number of users and/or saving the database on a network).

Maestro includes data for the fictional ***Swift Construction Company*** (SCC), including projects, parts, stock (unserialized, serialized and lot controlled), issues and users. A demo is hosted on [dalescott.net](http://www.dalescott.net). 

Maestro is developed as an open source project using the business-friendly permissive [BSD 2-Clause License](http://opensource.org/licenses/BSD-2-Clause). The goal of the Maestro project is to provide a superior integrated business management solution for managing parts, projects, material, issues and people.

Getting Started
---------------
Refer to the following documents:

* [INSTALL.md](https://github.com/dalers/maestro/blob/master/INSTALL.md) - installation procedure (FreeBSD)
* [SCC.md](https://github.com/dalers/maestro/blob/master/SCC.md) - describes structure of SCC master data
* [WORKFLOWS.md](https://github.com/dalers/maestro/blob/master/WORKFLOWS.md) - describes SCC workflows

Issue Tracking
--------------
Issues (and project milestones) are tracked in the [Maestro Project Issue Tracker](https://github.com/dalers/maestro/issues).

Communication Channels
----------------------
The official (and preferred) communication channel is the [Maestro Project Issue Tracker](https://github.com/dalers/maestro/issues).

Project Documentation
----------------------
Project documentation is maintained in the [Maestro Project Wiki](https://github.com/dalers/maestro/wiki/).

Developer Guidelines
--------------------
The basic development procedure is:

* Create a GitHub account and use GitHub to fork the Maestro project repo
* Clone your fork locally
* Create a local topic branch off the master branch
* Develop and test your work locally
* Push your topic branch to your GitHub clone
* Issue a pull request with your changes to the Maestro project

All development is currently in the master branch.

For more information, see the [Maestro project wiki](https://github.com/dalers/maestro/wiki) (e.g. [Maestro Development](https://github.com/dalers/maestro/wiki/Maestro-Development)). You can also explore inherent conventions using [PHP_CodeSniffer](http://squizlabs.github.io/PHP_CodeSniffer/analysis/yiisoft/yii/).

Legal
-----
Maestro source is copyright by its authors, as recorded in the maestro repository commit log. The Maestro project does not use a Contributor License Agreement (CLA) or a Copyright Assignment Agreement (CAA). By submitting work to the project, you agree to license your contribution according to the [BSD 2-Clause License](http://opensource.org/licenses/BSD-2-Clause).

*Maestro*<sup>TM</sup>, *ERP for Engineers*<sup>TM</sup>, and *Transparency with Trust*<sup>TM</sup> are used under license according to the [Maestro Trademark and Logo Policy](http://www.dalescott.net/maestro-trademark-and-logo-policy/).

*Parts&Vendors*<sup>TM</sup> is a trademark of [Trilogy Design](http://www.trilogydesign.com/)

Support
-------
Shoul you desire assistance, please try the following in order:

* Review the [Maestro project Wiki](https://github.com/dalers/maestro/wiki/).
* Investigate expected behaviour using the [Maestro demo system](http://maestro.dalescott.net)
* Search the [Maestro issue tracker](https://github.com/dalers/maestro/issues)
* Update your repository.
* Submit an issue to the [Maestro issue tracker](https://github.com/dalers/maestro/issues)

If posting a new issue to the issue tracker, please try to include answers to the following questions:

* What are you trying to achieve?
* What are the symptoms? Why do you think this **is** a problem?
* What version of Maestro you are using? (are you using a release version?, current master branch head?)
* Include as an example, the **simplest** sequence of operations that demonstrates the undesired or unanticipated behaviour.
