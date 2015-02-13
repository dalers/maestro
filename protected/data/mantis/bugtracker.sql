-- Adminer 4.1.0 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

USE `bugtracker`;

DROP TABLE IF EXISTS `mantis_bugnote_table`;
CREATE TABLE `mantis_bugnote_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  `reporter_id` int(10) unsigned NOT NULL DEFAULT '0',
  `bugnote_text_id` int(10) unsigned NOT NULL DEFAULT '0',
  `view_state` smallint(6) NOT NULL DEFAULT '10',
  `note_type` int(11) DEFAULT '0',
  `note_attr` varchar(250) DEFAULT '',
  `time_tracking` int(10) unsigned NOT NULL DEFAULT '0',
  `last_modified` int(10) unsigned NOT NULL DEFAULT '1',
  `date_submitted` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_bug` (`bug_id`),
  KEY `idx_last_mod` (`last_modified`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `mantis_bugnote_table` (`id`, `bug_id`, `reporter_id`, `bugnote_text_id`, `view_state`, `note_type`, `note_attr`, `time_tracking`, `last_modified`, `date_submitted`) VALUES
(1,	28,	25,	1,	10,	0,	'',	0,	1410970093,	1410970064),
(2,	17,	6,	2,	10,	0,	'',	0,	1410970336,	1410970336),
(3,	17,	10,	3,	10,	0,	'',	0,	1410970505,	1410970505),
(4,	28,	6,	4,	10,	0,	'',	0,	1410971180,	1410971180),
(5,	30,	25,	5,	10,	0,	'',	0,	1410973883,	1410973883),
(6,	30,	15,	6,	10,	0,	'',	0,	1410973983,	1410973983),
(7,	20,	8,	7,	10,	0,	'',	0,	1410979350,	1410979350),
(8,	19,	8,	8,	10,	0,	'',	0,	1410979580,	1410979580);

DROP TABLE IF EXISTS `mantis_bugnote_text_table`;
CREATE TABLE `mantis_bugnote_text_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `note` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `mantis_bugnote_text_table` (`id`, `note`) VALUES
(1,	'Barcoe, we need to get a new rev out pronto for the aircraft wireless, it looks like the lost USB stick was the only copy of the new files from the design house. You\'ll have to re-create the design as it should have been (maybe better?) Glad we have Maestro now to make sure this doesn\'t happen again (or at least we can recover easier and not do work over).\n\n'),
(2,	'all docs double-checked, ok for project baseline.'),
(3,	'Beta test kits all packed and on their way. aircraft wireless is official now!'),
(4,	'inductor recreated, tom double-checked my calculations against his notes and it looks like we\'ve even gained +6dB!'),
(5,	'Frank, can you make it so?'),
(6,	'I forgot to say I worked up a draft list of items based on customer demand. See attached spreadsheet.'),
(7,	'Miquel, see what you can do to get the costs down. Tom says design decisions are imposing production and rework costs, he will work with you but he can\'t drive the effort because I need him to focus on the aerial firefighter bombsight design work.'),
(8,	'John, James Period is the product release driver, so long as he\'s happy I\'m ok but call a group review (before execution) if you feel the need to confirm everyone understands all the implications.');

DROP TABLE IF EXISTS `mantis_bug_file_table`;
CREATE TABLE `mantis_bug_file_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `description` varchar(250) NOT NULL DEFAULT '',
  `diskfile` varchar(250) NOT NULL DEFAULT '',
  `filename` varchar(250) NOT NULL DEFAULT '',
  `folder` varchar(250) NOT NULL DEFAULT '',
  `filesize` int(11) NOT NULL DEFAULT '0',
  `file_type` varchar(250) NOT NULL DEFAULT '',
  `content` longblob NOT NULL,
  `date_added` int(10) unsigned NOT NULL DEFAULT '1',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bug_file_bug_id` (`bug_id`),
  KEY `idx_diskfile` (`diskfile`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `mantis_bug_file_table` (`id`, `bug_id`, `title`, `description`, `diskfile`, `filename`, `folder`, `filesize`, `file_type`, `content`, `date_added`, `user_id`) VALUES
(1,	30,	'',	'',	'ed4f8e70e8198e3985d2fbf0dae1374d',	'james period - proposed field spares kit item list.ods',	'',	11440,	'application/vnd.oasis.opendocument.spreadsheet',	'PK\0\0\0\0�1E�l9�.\0\0\0.\0\0\0\0\0\0mimetypeapplication/vnd.oasis.opendocument.spreadsheetPK\0\0�1E\0\0\0\0\0\0\0\0\0\0\0\0\'\0\0\0Configurations2/accelerator/current.xml\0PK\0\0\0\0\0\0\0\0\0\0\0PK\0\0\0\0�1E\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Configurations2/images/Bitmaps/PK\0\0\0\0�1E\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Configurations2/floater/PK\0\0\0\0�1E\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Configurations2/progressbar/PK\0\0\0\0�1E\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Configurations2/menubar/PK\0\0\0\0�1E\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0Configurations2/popupmenu/PK\0\0\0\0�1E\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0Configurations2/statusbar/PK\0\0\0\0�1E\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Configurations2/toolbar/PK\0\0\0\0�1E\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0Configurations2/toolpanel/PK\0\0\0\0�1E���\0\0�\0\0\0\0\0Thumbnails/thumbnail.png�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0�\0\0\0�do�\0\0�IDATx��=��N�۪w)`@�]���I�����	���\Z�(+�X�^|���n@�ud��/�B�����`���ۍ@��5�\0\0�D\n �Z���<9���˵����Z=�\0K\'>M�ꦻ5�&u}U���U����U�5v��k�!+�gg��N�TP�X,�Kk���&t�����;�|�|��)�;@���V�u�N��_sf�ɤs�l�g��������*�߿�ҕ���>�Lذ8F,٤3[�Sy�M�w�v[g){/����Kg�`}Y��;K�p���KX�;$̍���(�k�{=Q6�MvJ��\Z���v�nV,˶tʝX+8Mo�Q��vE�$���.�8,G�]~��5�v��~��X���-�o63va�4� ���Jo�;ڊ�Q���덏��V��P\'�Ya�ҕ����z�,{������|�ܳuv��;o��?\\���a<��?Y�ő\\Â	o	c�+[/&���`\r�~k>Z��9�N���V�sچp:d�ٌ�?k���|Y�z�٭��F+(��/C~F�t�z-y0)x�ŗ^�d�����I^Cu����X;��vv�����/��;��3W�	�]-؞�nS1��HKsl�[�)��;��W�u�eY�\\{��v[�!�Z�R�	�\r׌�[1gގ�\0TmZ��*1:�T����emn��+w�r=)��q���\rD�8���ī����%;A�6�j�I�Q{��Q�9�~	v��������}U+�x�Z���/�J���E����sy3���Nk����#��%��r��\\l�����h6�Gw����:[j��Q��ꡇ7�ɚt��i;�v��a�W���\'�8?��헭~�1�;,�c_����uK�*�/ך�^�ċ���O ���b�C<]�s�a2])(�� �j��Z��gw-�پ��-;�[���o�y���Œ������M�j��F��ƥ\'�d�Z��Y��t+ڕ���t�V�Ofm�U�|���4h��\0\r\\��|\0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0�I#�~E8��6���l+~k��a��D��F�1BA`���jyp\r�͈�\Z��H��ll�]�*�l6��;�������w:���|�v��o뚀����B�B��12#6���SZ�T����HT33f\r��~�, F�#�Z\\���\\��->�V��m�y1�Fʼ�<0m2�Dmkp�xI�c����3H�<��xk��-�~�����6Ê=#f\r���)}(��X8�}a$b8�ϴ&?|1_�a���oٳ�?�@l68��;�<�\rn���l�~����@�@�#�]*���V%֞�p������#V!����U�\n�\Z�Nvshٌ���g���\"²p$=�J.�g^-f��У��Q�p�L|�[�T��d��F�s��ƾdg�^�\"pL�Y��i�/QDc��\0 \r\0HӨ\0�|�OL�4�U�r�2��s�_0��_\r���a��(��εƛ(碜_sgM՗ϓ�����ꢸ�=2�T���^�J�p�i��Nw2�f��y��~�%o�B��� .�%��\\�p%R�X�	�j�[���CϖV�ns�*���2	�n&�X�\Z��#�2aW�E)�ҷ�.jw�Y� �k��C�D/֋�������d�:����+�5�<͕�v��B�C4\'\0�2�$�BA����Y���F�V����b�j���&�ha�Qg�͎�F���̓@ʟVd��<S�|1�e�+�#u��4�u��w����6�NNK������\\�Į��u�gv~�_7Zv�m�<��h\Z�s�\n�+�p�^��5�(Y6$����ϋ��[��$���&{���|�F���\0���lȌ�?�����GK1���8u������d2����k�K�A��X<|˅����,�\"��髱V�)��ܩ�l�J-;����}���M:F���Ȃ��2�S$~Բ/sfY���\Zi\'��3�P��\n�i-+��Vw�������%�����,�d�n]�gxu�\\�jqj��NzZ��j�T�I��,�i�NQ�t�z�IfY(��}\0.,�o\0�@\0�4�	 �X��@��Hf�<g���x�<��l���V՜�e���SL�^�Yzm�^��o�6L\r�����k�?�7kn��ش�=�Uz9Hz���rc��9\Z@r��s�½z!�zeӓF��^)���f���F+{[��4�iat!��^�!s�C�:��M�҄v�h���_=RM(H��F�s��6	5�ʤs!޲%Ot_nL�y��1��	�w��!So��}d���OO7��<4��ͫ֜J�\0ڞ��61-��3b���3�IJ�J�V�]�MmUW�R�Y�,���[vq˲���gEr�lf�M:�YnL�y����\0O:Pj�P�J�fѓF���ØQ�9%m�v�2��P���Yp��U��xUf�vQ{���\Z�Ml�f��5gs��Qzt��½*���jcj�|���=�~߁*1�z��F����h��ZsJv��fr�?Y.	\'�vi���ͷ,��z4+-��j�6�U����1���9m��A~�e�=�?œkV�RcX�y��1����J>m���D5�6��<0´}�[Ue�¦RK���i��|@)6�x+GޙWJTb�fͬ�29�R��=��V�=k���5�s`\Z�?�[���W��8\0�\0�i4 �d�|�A�_�;��s�x;w�0��Z;����le\\�KõT%���1\n�;��xy9��D����Ҭz� \nL�9#�j�|��f]���#�D޻g��f�\Zab�0�.K�T]̗f�\r�\n#,+a��ճ/���-\n�LY�(\n���\Z��i���%_-�[W��a��\\3��C#,��0�P�L`�eū\"�l���7F�\rD�ף(��1W�x�N��L�����U����������@�{#�K\rͺY�d�^b�ei�W��j��MQ`2��Q�{h$\nL��G�@3G��a]���;9��`����� �t_��1�h����B�)YX֩���\'ڦ���̭5Q`�\'Q�K\n��<[�H�N��*� �*����{\r\ZF�٫����1_G?��Xm��1��òj.�{�����-o.E{ݳ�>��i�?���~\0 \r\0HӬ\0�ʍ�^#L-?���h��b�ԔI���b�������R\Z%��=	��G�=<��q����h��s����M\n 	V;ƾ�Q/�^5¼^O�l���l�e����!Z���[UGI{��.�eEޓPq�������KO�w|4�HB�&c�Wl�謾]�/z�sFۛ��@��K�;�8fF���\Z��W`��(哒�n�<�]0��*��|4�HB�c�w�4�{�����E�0�~3��������:�/����,Rыq$�/�%�ɸl5�*=��*�(���}4�HBņ}\0����W\0�oރ_4�dtX�C���X(�,f�h	W����c�o,	\r���{=9�?Xk��~gB�;$�_\'��Gc�V��G*6<�Dn�R,��F؇ހ�oܺ ��V5b���KS���0xoB�t�50��j}��*b\Z���F�J�\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i \0@\Z\0�\0��\0\0i�ESZ��W�B\0\0\0\0IEND�B`�PK\0\0�1E\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0content.xml�Y�N#9}߯h�J��c�-�M2�h�4���t�k�����~�}���,d;�|��ԩ�%��esgF�b\"��Ʊ��$!K�]�����_z�tD�����1M4\nD�����]w*_Ŕ���*_�HiRz�6��r�����{��5]����KF�3g`�;�d^��`AT�=u���H��qJ4�`��,��u\'Z�>����1�\ZB�q��n�l�\"T�t*y�\nL95�n6����T���֦�L����!�<�j*��k�^ �gm�f���5�9�Y{�2���xa�Q�B�7&z���gx\0����f5W2���`פ\n$Kk���m!DE�8�=��:>>��w=��K�����^x@xP).�m�����̌|���j�C��X�;C�5�\Z���F,Q�$+e�i��JO�����&��B�Z�����ì�бíP��a8F`���_��������\Z\\Fy�K*lQ]�T2S	�fP�@4���w>���u���^y��C�pe��2C	(\ni�U��F��ɿ]�/Q��(1�˕�v5+hL s��L�5D�t\0;{F��Ȁk�v��3u�-,~#�Pls�~rK�i�v���*S-4;�P\"���䊲��l�~�2�d\"�y��R����x�$v2ՐH�\0eq��>׸�Y%+Xf[.E>�����(�MH�fT9��G��hD�Ȅ�&u���Yh.���Y�uʒ�\0��>r��E���μW�����b��,6�|�\'��\'�H���̃��)OE\"�,&��ZNi}�l\'^\Zcx�Q�R2�(��J#2�z�*����2�r�,��̍�`���u�Dz��*�9���H��Ձ�>�	����Sg�����,C��-���ss*�J�ኺk��i���\"S��-�\n�M��p�y%\"̕C��QJIq��\Z&eK@3��!^u�>�H/S@*\r*�\r���J{��w�h���$���;��B)��\\��0%�0w�1���Oofڒ�EQ�F��\r�������P�\Z���IV�]���c�����iN�F=l3\".�v�V�!���|s��3g�ZV��r�|�Y�f/n�o������G�������p�њji} ��Y�V�������:\Z���]]�����`��z��z�Ѹ�oK+Qi��=�?��}z��{r�O�ZR��O�ӯw�GOË�77ֶ���n��}ȧ����+J��ץ����~k����X�m�D�PK�E�X�\0\0e\Z\0\0PK\0\0�1E\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0settings.xml�Y]s�:}����;1���xB�M�M�&�Ǜ��D�z$����6��n��2}��%�]�v����\"�ـ�������\0C�W#�v����y=���K\Z�b�D�UW�Rz����\\z���I��H*=N\"��\n<���˼��^n�x��(�9k�b�u�4=IOOP����ٙ���S�K�:�T1{�\"�0�-(�ɍ\rz�n��������q(_|�3P�t��(�Mg�8sm�h�ކB�#jNݺ�kd��S�m�)Wθw���$�kX*;ȟh��u�����ˣ�/��ֵ�����C������\0a��������%��8�UX�R*�3�g��4O3Њ�s��;G/��\0�@N!Qܠ�J��g�y���A�K�rE�3��c��Q�� \rl�W�/d�B����?	�@�>#|��A;��_ìU�Κ(�H\\��]�^�R���5�ь�@�K���Q�k���[�>l\0�y���M�9�Z\09-7�~��GD �����߿���D����43p����������/�Iho�+���M�H������;A�\n�\0r�:E���0+��`x:�\Z�WQ�$R��D|��%�P�V��D�������(�s���ȤՃш��x�3\"T7�De�Wr�7X�0���Q$�[3q�V)�\'��n�lt�x��mS���<P�oy���7hAD-���i�����ï�� �?�~`�1�)���\0�Q����I	�Ix�R�0���I���(b�=&��)aAj$��B�G�mj��\n-� ��ó[W���z�_�\\�Gs�%V��K�2�]�`Ycڔ�9������7l��d�E�]S~_M���i�?]�$б�b�Yvo1w;�c�T/\\D����Dl��k$�Ls r����\r��>�)CiC���H��e��2ް�n�&7�K���Pn���wPK%מ�\0\0�\0\0PK\0\0�1E\0\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0styles.xml�X�n�6}�W2P�@���v�U�k-���\"��ȕ(�%\n$��|}����u�$M���hx�<<3�tw̙�\'BR^��`�)\"�\"]�O�~�n���7w<IhDG��ʓ��s!�jp��Dr,���(�%)�S�F�f��b&��n�moE�j���v|�v�����>�u�Xд���Gɼ�{�K�h�ő����͔*C����p��\"E�j�Bf�!5�r\'�A�\"���$\n�؜(<��ƶ)�|K�li����H��vu^Λ���ɯ}:;����Q���<3�n�\\��S�2n��Xe�E0h~=�~�+��]Kc;RE����Y�����v������+T=�Ї������<:�0�\Z�y>&\Z���u�[�Л���\Z	Rr�\Z\"��b�,�����MU=j����Q(йDpl��x{J�Zv^�2 שkp��/ݍ-�	����x1����U��1;ճ����IP���X@N����v�#^J\n\"(�Q��DIU����i�K;O��8oGX|�K.�+�yr�R��s�=�\"U�����Hp����_:)M��(�g<�#����]Merm���2&	ޱ���3ה�y�\"k�%8�̼R��B#T\r\Zf�S�p�{\"qM��\"������A��p\n6RC�w�@���w���b�L����>dv�����8�[_���j�l�3ڟ����fD��]�.�]C\'�&���9�SN����Ӕ*	��,42���p�_*>���!~V��񛒴�\'m^�����L�&K�>���rj/�b�`ݎS���|�+b\"��$#9���@cݷ�����3]�Y���m8M3�����+��ԩ�Eӳ�&X��=�7N#UD�ڧ�\'�N�*�У�:��^��(�`&[%w�:���I�n��UM�&�X;xU*w*9>/^���\'Ij�1GR���N����$Q�r�u�BN#�{k���1��w�{�y�����ts�r(�k�	OmO1�`w��U��!|���J��A����\r�n���I�H�(j|׺�J���_��۫��BӬj:_�)\\��4��� 3b����P�m���k9/�^��1�۹�͏��8�>�\0ƿ	�#�ާ��������\Z�Z��`��l���S�^�^�q4Y���f����F=ӹ�}*F\n_Esg>���_�R�7���w�o�-eO�^�X�$��.�����iV�C�~д��p��Z�;UG���@Ǘ�}S\\8��r���R}�iB)��]�ST�6�z�~ Dg��ɜ���1Vv��KE��~��y{�v`\\���篼����+� m�Yh����AסݐK�.���Sj͛�f�j+��=4~���\'��_PK2f!KM\0\0\0\0PK\0\0�1E\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0manifest.rdf͓�n�0��<�e��@/r(ʹj��5�X/�޾��VQ�����F3ߎ���aȋ���T4c)%�Hh��+:�.���:�ض+��j���*�wn*9_��-7lϳ�(x��<O�\"��8qHƴ�	�Bi��|\Z9��	fWQt렐y� =��:���\na�R��� ��@�	Lʄt��NK�3��Q9�����`�Ӄ�<`�+���ވ��^཰�\\��|�hz�czu����#�`�2�O�;y���.��⯴vDl@Σg����UG�PK��h�\0\0�\0\0PK\0\0\0\0�1E�)v~�\0\0�\0\0\0\0\0meta.xml<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<office:document-meta xmlns:office=\"urn:oasis:names:tc:opendocument:xmlns:office:1.0\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\" xmlns:meta=\"urn:oasis:names:tc:opendocument:xmlns:meta:1.0\" xmlns:ooo=\"http://openoffice.org/2004/office\" xmlns:grddl=\"http://www.w3.org/2003/g/data-view#\" office:version=\"1.2\"><office:meta><meta:initial-creator>Dale Scott</meta:initial-creator><meta:creation-date>2014-09-17T11:13:20.85</meta:creation-date><dc:date>2014-09-17T11:15:05.77</dc:date><dc:creator>Dale Scott</dc:creator><meta:editing-duration>PT1M45S</meta:editing-duration><meta:editing-cycles>1</meta:editing-cycles><meta:document-statistic meta:table-count=\"3\" meta:cell-count=\"21\" meta:object-count=\"0\"/><meta:generator>OpenOffice/4.1.1$Win32 OpenOffice.org_project/411m6$Build-9775</meta:generator></office:meta></office:document-meta>PK\0\0�1E\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0META-INF/manifest.xml���n� ��}����z�P�&�	�`�I�� 0U��#��f[;-Uoز��A�6g�=�d<6�?�\nP��`߰��{��6���)4$��*}��a�rD�U2I�r�$i�`�uv�$����M,�zQ]x��P��x�T;h����a*k���-���>%�\"�6�\0��uP�k�`b���*o;��x���Bi\rJ��9��a��L�ϱS�A�g���?O3�ƩD����v��\'*c���ȇ�y��a3W!eJ�ou�& *o?=^��^ul����1�K�C�; 5\Z_�__��PKIH,�&\0\0E\0\0PK\0\0\0\0\0�1E�l9�.\0\0\0.\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0mimetypePK\0\0\0�1E\0\0\0\0\0\0\0\0\0\0\0\'\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0Configurations2/accelerator/current.xmlPK\0\0\0\0\0�1E\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0Configurations2/images/Bitmaps/PK\0\0\0\0\0�1E\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0Configurations2/floater/PK\0\0\0\0\0�1E\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Configurations2/progressbar/PK\0\0\0\0\0�1E\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0X\0\0Configurations2/menubar/PK\0\0\0\0\0�1E\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0Configurations2/popupmenu/PK\0\0\0\0\0�1E\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0Configurations2/statusbar/PK\0\0\0\0\0�1E\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0Configurations2/toolbar/PK\0\0\0\0\0�1E\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\04\0\0Configurations2/toolpanel/PK\0\0\0\0\0�1E���\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0l\0\0Thumbnails/thumbnail.pngPK\0\0\0�1E�E�X�\0\0e\Z\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0`\0\0content.xmlPK\0\0\0�1E%מ�\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0V\0\0settings.xmlPK\0\0\0�1E2f!KM\0\0\0\0\n\0\0\0\0\0\0\0\0\0\0\0\0\0C\0\0styles.xmlPK\0\0\0�1E��h�\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�!\0\0manifest.rdfPK\0\0\0\0\0�1E�)v~�\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0#\0\0meta.xmlPK\0\0\0�1EIH,�&\0\0E\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�&\0\0META-INF/manifest.xmlPK\0\0\0\0\0\0p\0\0*(\0\0\0\0',	1410974157,	15);

DROP TABLE IF EXISTS `mantis_bug_history_table`;
CREATE TABLE `mantis_bug_history_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  `field_name` varchar(64) NOT NULL,
  `old_value` varchar(255) NOT NULL,
  `new_value` varchar(255) NOT NULL,
  `type` smallint(6) NOT NULL DEFAULT '0',
  `date_modified` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_bug_history_bug_id` (`bug_id`),
  KEY `idx_history_user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `mantis_bug_history_table` (`id`, `user_id`, `bug_id`, `field_name`, `old_value`, `new_value`, `type`, `date_modified`) VALUES
(79,	1,	17,	'date_submitted',	'1409983167',	'1356937200',	0,	1409983167),
(78,	1,	17,	'handler_id',	'0',	'6',	0,	1409983167),
(84,	1,	19,	'',	'',	'',	1,	1409983167),
(83,	1,	18,	'date_submitted',	'1409983167',	'1357023600',	0,	1409983167),
(82,	1,	18,	'handler_id',	'0',	'6',	0,	1409983167),
(81,	1,	18,	'status',	'10',	'50',	0,	1409983167),
(80,	1,	18,	'',	'',	'',	1,	1409983167),
(85,	1,	19,	'status',	'10',	'50',	0,	1409983167),
(86,	1,	19,	'handler_id',	'0',	'18',	0,	1409983167),
(87,	1,	19,	'date_submitted',	'1409983167',	'1357110000',	0,	1409983167),
(88,	1,	20,	'',	'',	'',	1,	1409983167),
(89,	1,	20,	'status',	'10',	'50',	0,	1409983167),
(90,	1,	20,	'handler_id',	'0',	'21',	0,	1409983167),
(91,	1,	20,	'date_submitted',	'1409983167',	'1357196400',	0,	1409983167),
(92,	1,	21,	'',	'',	'',	1,	1409983167),
(93,	1,	21,	'status',	'10',	'50',	0,	1409983167),
(94,	1,	21,	'handler_id',	'0',	'10',	0,	1409983167),
(95,	1,	21,	'date_submitted',	'1409983167',	'1357282800',	0,	1409983168),
(96,	1,	18,	'',	'6',	'',	12,	1409983364),
(142,	25,	28,	'status',	'10',	'50',	0,	1410970064),
(141,	25,	28,	'handler_id',	'0',	'6',	0,	1410970064),
(140,	25,	28,	'',	'0000001',	'',	2,	1410970064),
(139,	25,	29,	'',	'',	'',	1,	1410969607),
(138,	25,	28,	'',	'',	'',	1,	1410969531),
(137,	1,	17,	'project_id',	'1',	'21',	0,	1410969424),
(136,	1,	19,	'project_id',	'1',	'21',	0,	1410969424),
(135,	1,	20,	'project_id',	'1',	'21',	0,	1410969424),
(77,	1,	17,	'status',	'10',	'50',	0,	1409983167),
(76,	1,	17,	'',	'',	'',	1,	1409983167),
(153,	6,	28,	'resolution',	'10',	'20',	0,	1410971180),
(152,	6,	28,	'status',	'50',	'90',	0,	1410971180),
(151,	6,	28,	'',	'0000004',	'',	2,	1410971180),
(150,	10,	17,	'resolution',	'10',	'20',	0,	1410970505),
(149,	10,	17,	'status',	'40',	'90',	0,	1410970505),
(148,	10,	17,	'',	'0000003',	'',	2,	1410970505),
(147,	6,	17,	'status',	'50',	'40',	0,	1410970336),
(146,	6,	17,	'',	'0000002',	'',	2,	1410970336),
(143,	25,	28,	'',	'0000001',	'2',	3,	1410970093),
(144,	25,	28,	'',	'3',	'18',	18,	1410970231),
(145,	25,	18,	'',	'2',	'28',	18,	1410970231),
(134,	1,	21,	'project_id',	'1',	'21',	0,	1410969424),
(133,	1,	18,	'project_id',	'1',	'21',	0,	1410969424),
(154,	1,	17,	'priority',	'0',	'10',	0,	1410972464),
(155,	1,	17,	'summary',	'Release prototype PCA',	'Iteration 1 - Release prototype PCA',	0,	1410972464),
(156,	1,	18,	'priority',	'0',	'10',	0,	1410972483),
(157,	1,	18,	'summary',	'Make PCB corrections',	'Iteration 2 - Make PCB corrections',	0,	1410972483),
(158,	1,	19,	'handler_id',	'18',	'0',	0,	1410972523),
(159,	1,	19,	'priority',	'0',	'10',	0,	1410972523),
(160,	1,	19,	'summary',	'Release marketing assembly',	'Iteration 3 - Release marketing assembly',	0,	1410972523),
(161,	1,	20,	'handler_id',	'21',	'0',	0,	1410972540),
(162,	1,	20,	'priority',	'0',	'10',	0,	1410972540),
(163,	1,	20,	'summary',	'Reduce cost and improve quality',	'Iteration 4 - Reduce cost and improve quality',	0,	1410972540),
(164,	1,	21,	'priority',	'0',	'10',	0,	1410972556),
(165,	1,	21,	'summary',	'Release field service kit',	'Iteration 5 - Release field service kit',	0,	1410972556),
(166,	1,	29,	'',	'3',	'20',	18,	1410972671),
(167,	1,	20,	'',	'2',	'29',	18,	1410972671),
(168,	25,	29,	'handler_id',	'0',	'6',	0,	1410973215),
(169,	25,	29,	'status',	'10',	'50',	0,	1410973215),
(170,	15,	30,	'',	'',	'',	1,	1410973825),
(171,	15,	30,	'status',	'10',	'50',	0,	1410973825),
(172,	15,	30,	'handler_id',	'0',	'25',	0,	1410973825),
(173,	25,	30,	'handler_id',	'25',	'10',	0,	1410973864),
(174,	25,	30,	'',	'0000005',	'',	2,	1410973883),
(175,	15,	30,	'',	'0000006',	'',	2,	1410973983),
(176,	15,	30,	'',	'james period - proposed field spares kit item list.ods',	'',	9,	1410974157),
(177,	10,	30,	'',	'3',	'21',	18,	1410974338),
(178,	10,	21,	'',	'2',	'30',	18,	1410974338),
(179,	8,	20,	'handler_id',	'0',	'21',	0,	1410979081),
(180,	8,	20,	'',	'0000007',	'',	2,	1410979350),
(181,	8,	19,	'handler_id',	'0',	'10',	0,	1410979408),
(182,	8,	19,	'',	'0000008',	'',	2,	1410979580);

DROP TABLE IF EXISTS `mantis_bug_monitor_table`;
CREATE TABLE `mantis_bug_monitor_table` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`bug_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `mantis_bug_monitor_table` (`user_id`, `bug_id`) VALUES
(6,	18);

DROP TABLE IF EXISTS `mantis_bug_relationship_table`;
CREATE TABLE `mantis_bug_relationship_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  `destination_bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  `relationship_type` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_relationship_source` (`source_bug_id`),
  KEY `idx_relationship_destination` (`destination_bug_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `mantis_bug_relationship_table` (`id`, `source_bug_id`, `destination_bug_id`, `relationship_type`) VALUES
(1,	18,	28,	2),
(2,	20,	29,	2),
(3,	21,	30,	2);

DROP TABLE IF EXISTS `mantis_bug_revision_table`;
CREATE TABLE `mantis_bug_revision_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bug_id` int(10) unsigned NOT NULL,
  `bugnote_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `value` longtext NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_bug_rev_type` (`type`),
  KEY `idx_bug_rev_id_time` (`bug_id`,`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `mantis_bug_revision_table` (`id`, `bug_id`, `bugnote_id`, `user_id`, `type`, `value`, `timestamp`) VALUES
(1,	28,	1,	25,	4,	'Barcoe, we need to get a new rev out pronto for the aircraft wireless, it looks like the lost USB stick was the only copy of the new files from the design house. You\'ll have to re-create the design as it should have been (maybe better?) Glad you\'re we have Maestro now to make sure this doesn\'t happen again (or at least we can recover easier and not do work over).',	1410970064),
(2,	28,	1,	25,	4,	'Barcoe, we need to get a new rev out pronto for the aircraft wireless, it looks like the lost USB stick was the only copy of the new files from the design house. You\'ll have to re-create the design as it should have been (maybe better?) Glad we have Maestro now to make sure this doesn\'t happen again (or at least we can recover easier and not do work over).\n\n',	1410970093);

DROP TABLE IF EXISTS `mantis_bug_table`;
CREATE TABLE `mantis_bug_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `reporter_id` int(10) unsigned NOT NULL DEFAULT '0',
  `handler_id` int(10) unsigned NOT NULL DEFAULT '0',
  `duplicate_id` int(10) unsigned NOT NULL DEFAULT '0',
  `priority` smallint(6) NOT NULL DEFAULT '30',
  `severity` smallint(6) NOT NULL DEFAULT '50',
  `reproducibility` smallint(6) NOT NULL DEFAULT '10',
  `status` smallint(6) NOT NULL DEFAULT '10',
  `resolution` smallint(6) NOT NULL DEFAULT '10',
  `projection` smallint(6) NOT NULL DEFAULT '10',
  `eta` smallint(6) NOT NULL DEFAULT '10',
  `bug_text_id` int(10) unsigned NOT NULL DEFAULT '0',
  `os` varchar(32) NOT NULL DEFAULT '',
  `os_build` varchar(32) NOT NULL DEFAULT '',
  `platform` varchar(32) NOT NULL DEFAULT '',
  `version` varchar(64) NOT NULL DEFAULT '',
  `fixed_in_version` varchar(64) NOT NULL DEFAULT '',
  `build` varchar(32) NOT NULL DEFAULT '',
  `profile_id` int(10) unsigned NOT NULL DEFAULT '0',
  `view_state` smallint(6) NOT NULL DEFAULT '10',
  `summary` varchar(128) NOT NULL DEFAULT '',
  `sponsorship_total` int(11) NOT NULL DEFAULT '0',
  `sticky` tinyint(4) NOT NULL DEFAULT '0',
  `target_version` varchar(64) NOT NULL DEFAULT '',
  `category_id` int(10) unsigned NOT NULL DEFAULT '1',
  `date_submitted` int(10) unsigned NOT NULL DEFAULT '1',
  `due_date` int(10) unsigned NOT NULL DEFAULT '1',
  `last_updated` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_bug_sponsorship_total` (`sponsorship_total`),
  KEY `idx_bug_fixed_in_version` (`fixed_in_version`),
  KEY `idx_bug_status` (`status`),
  KEY `idx_project` (`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `mantis_bug_table` (`id`, `project_id`, `reporter_id`, `handler_id`, `duplicate_id`, `priority`, `severity`, `reproducibility`, `status`, `resolution`, `projection`, `eta`, `bug_text_id`, `os`, `os_build`, `platform`, `version`, `fixed_in_version`, `build`, `profile_id`, `view_state`, `summary`, `sponsorship_total`, `sticky`, `target_version`, `category_id`, `date_submitted`, `due_date`, `last_updated`) VALUES
(17,	21,	10,	6,	0,	10,	50,	70,	90,	20,	10,	10,	17,	'',	'',	'',	'',	'',	'',	0,	10,	'Iteration 1 - Release prototype PCA',	0,	0,	'',	1,	1356937200,	1357023600,	1410972464),
(18,	21,	10,	6,	0,	10,	50,	70,	50,	10,	10,	10,	18,	'',	'',	'',	'',	'',	'',	0,	10,	'Iteration 2 - Make PCB corrections',	0,	0,	'',	1,	1357023600,	1357110000,	1410972483),
(19,	21,	10,	10,	0,	10,	50,	70,	50,	10,	10,	10,	19,	'',	'',	'',	'',	'',	'',	0,	10,	'Iteration 3 - Release marketing assembly',	0,	0,	'',	1,	1357110000,	1357196400,	1410979580),
(20,	21,	10,	21,	0,	10,	50,	70,	50,	10,	10,	10,	20,	'',	'',	'',	'',	'',	'',	0,	10,	'Iteration 4 - Reduce cost and improve quality',	0,	0,	'',	1,	1357196400,	1357282800,	1410979350),
(21,	21,	10,	10,	0,	10,	50,	70,	50,	10,	10,	10,	21,	'',	'',	'',	'',	'',	'',	0,	10,	'Iteration 5 - Release field service kit',	0,	0,	'',	1,	1357282800,	1357369200,	1410974338),
(30,	21,	15,	10,	0,	30,	50,	10,	50,	10,	10,	10,	30,	'N/A',	'N/A',	'N/A',	'',	'',	'',	1,	10,	'Customers asking for field spares kit.',	0,	0,	'',	1,	1410973825,	1,	1410974338),
(28,	21,	25,	6,	0,	40,	80,	10,	90,	20,	10,	10,	28,	'N/A',	'N/A',	'N/A',	'',	'',	'',	1,	10,	'Incorrect PCB layout',	0,	0,	'',	1,	1410969531,	1,	1410971180),
(29,	21,	25,	6,	0,	30,	50,	10,	50,	10,	10,	10,	29,	'N/A',	'N/A',	'N/A',	'',	'',	'',	1,	10,	'Difficult assembly procedure',	0,	0,	'',	1,	1410969607,	1,	1410973215);

DROP TABLE IF EXISTS `mantis_bug_tag_table`;
CREATE TABLE `mantis_bug_tag_table` (
  `bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  `tag_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `date_attached` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`bug_id`,`tag_id`),
  KEY `idx_bug_tag_tag_id` (`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_bug_text_table`;
CREATE TABLE `mantis_bug_text_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` longtext NOT NULL,
  `steps_to_reproduce` longtext NOT NULL,
  `additional_information` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `mantis_bug_text_table` (`id`, `description`, `steps_to_reproduce`, `additional_information`) VALUES
(17,	'Release PN 20000004 Rev 00 with child parts and sub-assemblies for building a small number of prototype units. Assembly to include functional PCA, earphone, wire for stubby antenna and preliminary user manual (NO enclosure). Manufacturing process documentation to include product part breakdown structure diagram, work instruction for packing beta test units and a work instruction for fabricating PN 20000001 (custom inductor).',	'',	''),
(18,	'Revise schematic to correct connectivity of PCB-type inductor; revise PCB design to correct the inductor layout and mechanical dimensions (and generate new CAM files). Create PCB master drawing. Create PCA assembly drawing and work instruction. Update work instruction for custom inductor PN 20000001 to meet revised format requirements (rev level will not change as fit/form/function remains the same).',	'',	''),
(19,	'Re-structure product to meet product release requirements, including creation of new top-level marketing assembly part number. Product to include enclosure with hardware, user manual and earphone to be moved to marketing assembly, stubby antenna removed, user manual to be updated.',	'',	''),
(20,	'Invert PCB in enclosure to aid assembly and test (requiring modifications to enclosure base and lid, including artwork). Update PCA assembly diagram and work instruction, update enclosure-level assembly diagram and work instruction.',	'',	''),
(21,	'Create kit of parts found typically useful for field service.',	'',	''),
(28,	'Connectivity of PCB-type inductor in layout is incorrect. Fix.',	'',	''),
(29,	'Difficult to assemble and test PCA due to copper-side-up orientation. Orienting PCA component-side up allows for full access to components for debugging after assembly.',	'',	''),
(30,	'Tom, I\'m hearing customers are happy about the quality improvements in the Aircraft Wireless, but they have some very harsh conditions and still get failures, basically they understand by overstressing the product. To get back into operation the fastest, they\'d buy a spare parts kit from us, just to have spares parts on the shelf. Can you look into this?',	'',	'');

DROP TABLE IF EXISTS `mantis_category_table`;
CREATE TABLE `mantis_category_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL DEFAULT '',
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_category_project_name` (`project_id`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES
(1,	0,	0,	'General',	0);

DROP TABLE IF EXISTS `mantis_config_table`;
CREATE TABLE `mantis_config_table` (
  `config_id` varchar(64) NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `access_reqd` int(11) DEFAULT '0',
  `type` int(11) DEFAULT '90',
  `value` longtext NOT NULL,
  PRIMARY KEY (`config_id`,`project_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `mantis_config_table` (`config_id`, `project_id`, `user_id`, `access_reqd`, `type`, `value`) VALUES
('database_version',	0,	0,	90,	1,	'183'),
('plugin_MantisGraph_schema',	0,	0,	90,	1,	'-1'),
('plugin_MantisGraph_jpgraph_path',	0,	0,	90,	2,	''),
('plugin_MantisGraph_eczlibrary',	0,	0,	90,	1,	'1'),
('plugin_Csv_import_schema',	0,	0,	90,	1,	'-1');

DROP TABLE IF EXISTS `mantis_custom_field_project_table`;
CREATE TABLE `mantis_custom_field_project_table` (
  `field_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sequence` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`field_id`,`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_custom_field_string_table`;
CREATE TABLE `mantis_custom_field_string_table` (
  `field_id` int(11) NOT NULL DEFAULT '0',
  `bug_id` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`field_id`,`bug_id`),
  KEY `idx_custom_field_bug` (`bug_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_custom_field_table`;
CREATE TABLE `mantis_custom_field_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `type` smallint(6) NOT NULL DEFAULT '0',
  `possible_values` text NOT NULL,
  `default_value` varchar(255) NOT NULL DEFAULT '',
  `valid_regexp` varchar(255) NOT NULL DEFAULT '',
  `access_level_r` smallint(6) NOT NULL DEFAULT '0',
  `access_level_rw` smallint(6) NOT NULL DEFAULT '0',
  `length_min` int(11) NOT NULL DEFAULT '0',
  `length_max` int(11) NOT NULL DEFAULT '0',
  `require_report` tinyint(4) NOT NULL DEFAULT '0',
  `require_update` tinyint(4) NOT NULL DEFAULT '0',
  `display_report` tinyint(4) NOT NULL DEFAULT '0',
  `display_update` tinyint(4) NOT NULL DEFAULT '1',
  `require_resolved` tinyint(4) NOT NULL DEFAULT '0',
  `display_resolved` tinyint(4) NOT NULL DEFAULT '0',
  `display_closed` tinyint(4) NOT NULL DEFAULT '0',
  `require_closed` tinyint(4) NOT NULL DEFAULT '0',
  `filter_by` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_custom_field_name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_email_table`;
CREATE TABLE `mantis_email_table` (
  `email_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(64) NOT NULL DEFAULT '',
  `subject` varchar(250) NOT NULL DEFAULT '',
  `metadata` longtext NOT NULL,
  `body` longtext NOT NULL,
  `submitted` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`email_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_filters_table`;
CREATE TABLE `mantis_filters_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  `is_public` tinyint(4) DEFAULT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `filter_string` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `mantis_filters_table` (`id`, `user_id`, `project_id`, `is_public`, `name`, `filter_string`) VALUES
(1,	1,	-1,	0,	'',	'v8#a:43:{s:16:\"_source_query_id\";s:0:\"\";s:8:\"_version\";s:2:\"v8\";s:10:\"_view_type\";s:6:\"simple\";s:13:\"show_category\";a:1:{i:0;s:1:\"0\";}s:13:\"show_severity\";a:1:{i:0;i:0;}s:11:\"show_status\";a:1:{i:0;i:0;}s:8:\"per_page\";i:50;s:17:\"highlight_changed\";i:6;s:11:\"reporter_id\";a:1:{i:0;i:0;}s:10:\"handler_id\";a:1:{i:0;i:0;}s:10:\"project_id\";a:1:{i:0;i:-3;}s:4:\"sort\";s:12:\"last_updated\";s:3:\"dir\";s:4:\"DESC\";s:11:\"start_month\";i:9;s:9:\"start_day\";i:1;s:10:\"start_year\";i:2014;s:9:\"end_month\";i:9;s:7:\"end_day\";i:17;s:8:\"end_year\";i:2014;s:6:\"search\";s:0:\"\";s:11:\"hide_status\";a:1:{i:0;i:-2;}s:16:\"and_not_assigned\";b:0;s:15:\"show_resolution\";a:1:{i:0;i:0;}s:10:\"show_build\";a:1:{i:0;s:1:\"0\";}s:12:\"show_version\";a:1:{i:0;s:1:\"0\";}s:17:\"do_filter_by_date\";b:0;s:16:\"fixed_in_version\";a:1:{i:0;s:1:\"0\";}s:14:\"target_version\";a:1:{i:0;s:1:\"0\";}s:13:\"show_priority\";a:1:{i:0;i:0;}s:12:\"user_monitor\";a:1:{i:0;i:0;}s:10:\"view_state\";i:0;s:13:\"custom_fields\";a:0:{}s:13:\"sticky_issues\";s:2:\"on\";s:17:\"relationship_type\";i:-1;s:16:\"relationship_bug\";i:0;s:12:\"show_profile\";a:1:{i:0;i:0;}s:8:\"platform\";a:1:{i:0;s:1:\"0\";}s:2:\"os\";a:1:{i:0;s:1:\"0\";}s:8:\"os_build\";a:1:{i:0;s:1:\"0\";}s:10:\"tag_string\";s:0:\"\";s:10:\"tag_select\";i:0;s:12:\"note_user_id\";a:1:{i:0;i:0;}s:10:\"match_type\";i:0;}'),
(2,	1,	0,	0,	'',	'v8#a:43:{s:16:\"_source_query_id\";i:2;s:8:\"_version\";s:2:\"v8\";s:10:\"_view_type\";s:6:\"simple\";s:13:\"show_category\";a:1:{i:0;s:1:\"0\";}s:13:\"show_severity\";a:1:{i:0;i:0;}s:11:\"show_status\";a:1:{i:0;i:0;}s:8:\"per_page\";i:50;s:17:\"highlight_changed\";i:6;s:11:\"reporter_id\";a:1:{i:0;i:0;}s:10:\"handler_id\";a:1:{i:0;i:0;}s:10:\"project_id\";a:1:{i:0;i:-3;}s:4:\"sort\";s:12:\"last_updated\";s:3:\"dir\";s:4:\"DESC\";s:11:\"start_month\";i:9;s:9:\"start_day\";i:1;s:10:\"start_year\";i:2014;s:9:\"end_month\";i:9;s:7:\"end_day\";i:17;s:8:\"end_year\";i:2014;s:6:\"search\";s:0:\"\";s:11:\"hide_status\";a:1:{i:0;i:-2;}s:16:\"and_not_assigned\";b:0;s:15:\"show_resolution\";a:1:{i:0;i:0;}s:10:\"show_build\";a:1:{i:0;s:1:\"0\";}s:12:\"show_version\";a:1:{i:0;s:1:\"0\";}s:17:\"do_filter_by_date\";b:0;s:16:\"fixed_in_version\";a:1:{i:0;s:1:\"0\";}s:14:\"target_version\";a:1:{i:0;s:1:\"0\";}s:13:\"show_priority\";a:1:{i:0;i:0;}s:12:\"user_monitor\";a:1:{i:0;i:0;}s:10:\"view_state\";i:0;s:13:\"custom_fields\";a:0:{}s:13:\"sticky_issues\";s:3:\"off\";s:17:\"relationship_type\";i:-1;s:16:\"relationship_bug\";i:0;s:12:\"show_profile\";a:1:{i:0;i:0;}s:8:\"platform\";a:1:{i:0;i:0;}s:2:\"os\";a:1:{i:0;i:0;}s:8:\"os_build\";a:1:{i:0;i:0;}s:10:\"tag_string\";s:0:\"\";s:10:\"tag_select\";i:0;s:12:\"note_user_id\";a:1:{i:0;i:0;}s:10:\"match_type\";i:0;}'),
(3,	1,	-2,	0,	'',	'v8#a:43:{s:8:\"_version\";s:2:\"v8\";s:10:\"_view_type\";s:6:\"simple\";s:8:\"per_page\";i:50;s:17:\"highlight_changed\";i:6;s:13:\"sticky_issues\";b:1;s:4:\"sort\";s:12:\"last_updated\";s:3:\"dir\";s:4:\"DESC\";s:8:\"platform\";a:1:{i:0;i:0;}s:2:\"os\";a:1:{i:0;i:0;}s:8:\"os_build\";a:1:{i:0;i:0;}s:10:\"project_id\";a:1:{i:0;i:-3;}s:11:\"start_month\";s:2:\"09\";s:9:\"start_day\";i:1;s:10:\"start_year\";s:4:\"2014\";s:9:\"end_month\";s:2:\"09\";s:7:\"end_day\";s:2:\"06\";s:8:\"end_year\";s:4:\"2014\";s:6:\"search\";s:0:\"\";s:16:\"and_not_assigned\";b:0;s:17:\"do_filter_by_date\";b:0;s:10:\"view_state\";i:0;s:17:\"relationship_type\";i:-1;s:16:\"relationship_bug\";i:0;s:14:\"target_version\";a:1:{i:0;s:1:\"0\";}s:10:\"tag_string\";s:0:\"\";s:10:\"tag_select\";s:0:\"\";s:10:\"match_type\";i:0;s:13:\"show_category\";a:1:{i:0;s:1:\"0\";}s:13:\"show_severity\";a:1:{i:0;i:0;}s:11:\"show_status\";a:1:{i:0;i:0;}s:11:\"reporter_id\";a:1:{i:0;i:0;}s:10:\"handler_id\";a:1:{i:0;i:0;}s:12:\"note_user_id\";a:1:{i:0;i:0;}s:15:\"show_resolution\";a:1:{i:0;i:0;}s:13:\"show_priority\";a:1:{i:0;i:0;}s:10:\"show_build\";a:1:{i:0;s:1:\"0\";}s:12:\"show_version\";a:1:{i:0;s:1:\"0\";}s:11:\"hide_status\";a:1:{i:0;i:90;}s:16:\"fixed_in_version\";a:1:{i:0;s:1:\"0\";}s:12:\"user_monitor\";a:1:{i:0;i:0;}s:12:\"show_profile\";a:1:{i:0;i:0;}s:16:\"_source_query_id\";s:0:\"\";s:13:\"custom_fields\";a:0:{}}'),
(4,	1,	-21,	0,	'',	'v8#a:43:{s:16:\"_source_query_id\";s:0:\"\";s:8:\"_version\";s:2:\"v8\";s:10:\"_view_type\";s:6:\"simple\";s:13:\"show_category\";a:1:{i:0;s:1:\"0\";}s:13:\"show_severity\";a:1:{i:0;i:0;}s:11:\"show_status\";a:1:{i:0;i:0;}s:8:\"per_page\";i:50;s:17:\"highlight_changed\";i:6;s:11:\"reporter_id\";a:1:{i:0;i:0;}s:10:\"handler_id\";a:1:{i:0;i:0;}s:10:\"project_id\";a:1:{i:0;i:-3;}s:4:\"sort\";s:12:\"last_updated\";s:3:\"dir\";s:4:\"DESC\";s:11:\"start_month\";i:9;s:9:\"start_day\";i:1;s:10:\"start_year\";i:2014;s:9:\"end_month\";i:9;s:7:\"end_day\";i:17;s:8:\"end_year\";i:2014;s:6:\"search\";s:0:\"\";s:11:\"hide_status\";a:1:{i:0;i:-2;}s:16:\"and_not_assigned\";b:0;s:15:\"show_resolution\";a:1:{i:0;i:0;}s:10:\"show_build\";a:1:{i:0;s:1:\"0\";}s:12:\"show_version\";a:1:{i:0;s:1:\"0\";}s:17:\"do_filter_by_date\";b:0;s:16:\"fixed_in_version\";a:1:{i:0;s:1:\"0\";}s:14:\"target_version\";a:1:{i:0;s:1:\"0\";}s:13:\"show_priority\";a:1:{i:0;i:0;}s:12:\"user_monitor\";a:1:{i:0;i:0;}s:10:\"view_state\";i:0;s:13:\"custom_fields\";a:0:{}s:13:\"sticky_issues\";s:3:\"off\";s:17:\"relationship_type\";i:-1;s:16:\"relationship_bug\";i:0;s:12:\"show_profile\";a:1:{i:0;i:0;}s:8:\"platform\";a:1:{i:0;i:0;}s:2:\"os\";a:1:{i:0;i:0;}s:8:\"os_build\";a:1:{i:0;i:0;}s:10:\"tag_string\";s:0:\"\";s:10:\"tag_select\";i:0;s:12:\"note_user_id\";a:1:{i:0;i:0;}s:10:\"match_type\";i:0;}'),
(5,	10,	0,	0,	'',	'v8#a:43:{s:16:\"_source_query_id\";i:5;s:8:\"_version\";s:2:\"v8\";s:10:\"_view_type\";s:6:\"simple\";s:13:\"show_category\";a:1:{i:0;s:1:\"0\";}s:13:\"show_severity\";a:1:{i:0;i:0;}s:11:\"show_status\";a:1:{i:0;i:0;}s:8:\"per_page\";i:50;s:17:\"highlight_changed\";i:6;s:11:\"reporter_id\";a:1:{i:0;i:0;}s:10:\"handler_id\";a:1:{i:0;i:0;}s:10:\"project_id\";a:1:{i:0;i:-3;}s:4:\"sort\";s:12:\"last_updated\";s:3:\"dir\";s:4:\"DESC\";s:11:\"start_month\";i:9;s:9:\"start_day\";i:1;s:10:\"start_year\";i:2014;s:9:\"end_month\";i:9;s:7:\"end_day\";i:17;s:8:\"end_year\";i:2014;s:6:\"search\";s:0:\"\";s:11:\"hide_status\";a:1:{i:0;i:-2;}s:16:\"and_not_assigned\";b:0;s:15:\"show_resolution\";a:1:{i:0;i:0;}s:10:\"show_build\";a:1:{i:0;s:1:\"0\";}s:12:\"show_version\";a:1:{i:0;s:1:\"0\";}s:17:\"do_filter_by_date\";b:0;s:16:\"fixed_in_version\";a:1:{i:0;s:1:\"0\";}s:14:\"target_version\";a:1:{i:0;s:1:\"0\";}s:13:\"show_priority\";a:1:{i:0;i:0;}s:12:\"user_monitor\";a:1:{i:0;i:0;}s:10:\"view_state\";i:0;s:13:\"custom_fields\";a:0:{}s:13:\"sticky_issues\";s:2:\"on\";s:17:\"relationship_type\";i:-1;s:16:\"relationship_bug\";i:0;s:12:\"show_profile\";a:1:{i:0;i:0;}s:8:\"platform\";a:1:{i:0;s:1:\"0\";}s:2:\"os\";a:1:{i:0;s:1:\"0\";}s:8:\"os_build\";a:1:{i:0;s:1:\"0\";}s:10:\"tag_string\";s:0:\"\";s:10:\"tag_select\";i:0;s:12:\"note_user_id\";a:1:{i:0;i:0;}s:10:\"match_type\";i:0;}'),
(6,	25,	0,	0,	'',	'v8#a:43:{s:16:\"_source_query_id\";s:0:\"\";s:8:\"_version\";s:2:\"v8\";s:10:\"_view_type\";s:6:\"simple\";s:13:\"show_category\";a:1:{i:0;s:1:\"0\";}s:13:\"show_severity\";a:1:{i:0;i:0;}s:11:\"show_status\";a:1:{i:0;i:0;}s:8:\"per_page\";i:50;s:17:\"highlight_changed\";i:6;s:11:\"reporter_id\";a:1:{i:0;i:0;}s:10:\"handler_id\";a:1:{i:0;i:0;}s:10:\"project_id\";a:1:{i:0;i:-3;}s:4:\"sort\";s:12:\"last_updated\";s:3:\"dir\";s:4:\"DESC\";s:11:\"start_month\";i:9;s:9:\"start_day\";i:1;s:10:\"start_year\";i:2014;s:9:\"end_month\";i:9;s:7:\"end_day\";i:17;s:8:\"end_year\";i:2014;s:6:\"search\";s:0:\"\";s:11:\"hide_status\";a:1:{i:0;i:-2;}s:16:\"and_not_assigned\";b:0;s:15:\"show_resolution\";a:1:{i:0;i:0;}s:10:\"show_build\";a:1:{i:0;s:1:\"0\";}s:12:\"show_version\";a:1:{i:0;s:1:\"0\";}s:17:\"do_filter_by_date\";b:0;s:16:\"fixed_in_version\";a:1:{i:0;s:1:\"0\";}s:14:\"target_version\";a:1:{i:0;s:1:\"0\";}s:13:\"show_priority\";a:1:{i:0;i:0;}s:12:\"user_monitor\";a:1:{i:0;i:0;}s:10:\"view_state\";i:0;s:13:\"custom_fields\";a:0:{}s:13:\"sticky_issues\";s:2:\"on\";s:17:\"relationship_type\";i:-1;s:16:\"relationship_bug\";i:0;s:12:\"show_profile\";a:1:{i:0;i:0;}s:8:\"platform\";a:1:{i:0;s:1:\"0\";}s:2:\"os\";a:1:{i:0;s:1:\"0\";}s:8:\"os_build\";a:1:{i:0;s:1:\"0\";}s:10:\"tag_string\";s:0:\"\";s:10:\"tag_select\";i:0;s:12:\"note_user_id\";a:1:{i:0;i:0;}s:10:\"match_type\";i:0;}'),
(7,	3,	0,	0,	'',	'v8#a:43:{s:16:\"_source_query_id\";s:0:\"\";s:8:\"_version\";s:2:\"v8\";s:10:\"_view_type\";s:6:\"simple\";s:13:\"show_category\";a:1:{i:0;s:1:\"0\";}s:13:\"show_severity\";a:1:{i:0;i:0;}s:11:\"show_status\";a:1:{i:0;i:0;}s:8:\"per_page\";i:50;s:17:\"highlight_changed\";i:6;s:11:\"reporter_id\";a:1:{i:0;i:0;}s:10:\"handler_id\";a:1:{i:0;i:0;}s:10:\"project_id\";a:1:{i:0;i:-3;}s:4:\"sort\";s:12:\"last_updated\";s:3:\"dir\";s:4:\"DESC\";s:11:\"start_month\";i:9;s:9:\"start_day\";i:1;s:10:\"start_year\";i:2014;s:9:\"end_month\";i:9;s:7:\"end_day\";i:17;s:8:\"end_year\";i:2014;s:6:\"search\";s:0:\"\";s:11:\"hide_status\";a:1:{i:0;i:-2;}s:16:\"and_not_assigned\";b:0;s:15:\"show_resolution\";a:1:{i:0;i:0;}s:10:\"show_build\";a:1:{i:0;s:1:\"0\";}s:12:\"show_version\";a:1:{i:0;s:1:\"0\";}s:17:\"do_filter_by_date\";b:0;s:16:\"fixed_in_version\";a:1:{i:0;s:1:\"0\";}s:14:\"target_version\";a:1:{i:0;s:1:\"0\";}s:13:\"show_priority\";a:1:{i:0;i:0;}s:12:\"user_monitor\";a:1:{i:0;i:0;}s:10:\"view_state\";i:0;s:13:\"custom_fields\";a:0:{}s:13:\"sticky_issues\";s:2:\"on\";s:17:\"relationship_type\";i:-1;s:16:\"relationship_bug\";i:0;s:12:\"show_profile\";a:1:{i:0;i:0;}s:8:\"platform\";a:1:{i:0;s:1:\"0\";}s:2:\"os\";a:1:{i:0;s:1:\"0\";}s:8:\"os_build\";a:1:{i:0;s:1:\"0\";}s:10:\"tag_string\";s:0:\"\";s:10:\"tag_select\";i:0;s:12:\"note_user_id\";a:1:{i:0;i:0;}s:10:\"match_type\";i:0;}');

DROP TABLE IF EXISTS `mantis_news_table`;
CREATE TABLE `mantis_news_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `poster_id` int(10) unsigned NOT NULL DEFAULT '0',
  `view_state` smallint(6) NOT NULL DEFAULT '10',
  `announcement` tinyint(4) NOT NULL DEFAULT '0',
  `headline` varchar(64) NOT NULL DEFAULT '',
  `body` longtext NOT NULL,
  `last_modified` int(10) unsigned NOT NULL DEFAULT '1',
  `date_posted` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_plugin_table`;
CREATE TABLE `mantis_plugin_table` (
  `basename` varchar(40) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '0',
  `protected` tinyint(4) NOT NULL DEFAULT '0',
  `priority` int(10) unsigned NOT NULL DEFAULT '3',
  PRIMARY KEY (`basename`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `mantis_plugin_table` (`basename`, `enabled`, `protected`, `priority`) VALUES
('MantisCoreFormatting',	1,	0,	3),
('MantisGraph',	1,	0,	3),
('Csv_import',	1,	0,	3);

DROP TABLE IF EXISTS `mantis_project_file_table`;
CREATE TABLE `mantis_project_file_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `description` varchar(250) NOT NULL DEFAULT '',
  `diskfile` varchar(250) NOT NULL DEFAULT '',
  `filename` varchar(250) NOT NULL DEFAULT '',
  `folder` varchar(250) NOT NULL DEFAULT '',
  `filesize` int(11) NOT NULL DEFAULT '0',
  `file_type` varchar(250) NOT NULL DEFAULT '',
  `content` longblob NOT NULL,
  `date_added` int(10) unsigned NOT NULL DEFAULT '1',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_project_hierarchy_table`;
CREATE TABLE `mantis_project_hierarchy_table` (
  `child_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned NOT NULL,
  `inherit_parent` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `idx_project_hierarchy_child_id` (`child_id`),
  KEY `idx_project_hierarchy_parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_project_table`;
CREATE TABLE `mantis_project_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  `status` smallint(6) NOT NULL DEFAULT '10',
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `view_state` smallint(6) NOT NULL DEFAULT '10',
  `access_min` smallint(6) NOT NULL DEFAULT '10',
  `file_path` varchar(250) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `category_id` int(10) unsigned NOT NULL DEFAULT '1',
  `inherit_global` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_project_name` (`name`),
  KEY `idx_project_view` (`view_state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `mantis_project_table` (`id`, `name`, `status`, `enabled`, `view_state`, `access_min`, `file_path`, `description`, `category_id`, `inherit_global`) VALUES
(1,	'Default',	10,	1,	10,	10,	'',	'Automatically created and un-categorized projects.',	1,	1),
(21,	'Aircraft Wireless 09-001',	10,	1,	10,	10,	'',	'Aircraft wireless project',	1,	1);

DROP TABLE IF EXISTS `mantis_project_user_list_table`;
CREATE TABLE `mantis_project_user_list_table` (
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `access_level` smallint(6) NOT NULL DEFAULT '10',
  PRIMARY KEY (`project_id`,`user_id`),
  KEY `idx_project_user` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_project_version_table`;
CREATE TABLE `mantis_project_version_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `version` varchar(64) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `released` tinyint(4) NOT NULL DEFAULT '1',
  `obsolete` tinyint(4) NOT NULL DEFAULT '0',
  `date_order` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_project_version` (`project_id`,`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_sponsorship_table`;
CREATE TABLE `mantis_sponsorship_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bug_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `amount` int(11) NOT NULL DEFAULT '0',
  `logo` varchar(128) NOT NULL DEFAULT '',
  `url` varchar(128) NOT NULL DEFAULT '',
  `paid` tinyint(4) NOT NULL DEFAULT '0',
  `date_submitted` int(10) unsigned NOT NULL DEFAULT '1',
  `last_updated` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_sponsorship_bug_id` (`bug_id`),
  KEY `idx_sponsorship_user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_tag_table`;
CREATE TABLE `mantis_tag_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `date_created` int(10) unsigned NOT NULL DEFAULT '1',
  `date_updated` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`name`),
  KEY `idx_tag_name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_tokens_table`;
CREATE TABLE `mantis_tokens_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `value` longtext NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '1',
  `expiry` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_typeowner` (`type`,`owner`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `mantis_tokens_table` (`id`, `owner`, `type`, `value`, `timestamp`, `expiry`) VALUES
(86,	1,	3,	'29,20,21,19,18',	1410969433,	1411059220),
(91,	6,	3,	'28,17',	1410970276,	1411057581),
(59,	29,	5,	'a:1:{s:6:\"filter\";b:1;}',	1409936068,	1441472834),
(88,	25,	3,	'30,29,20,17,28',	1410969531,	1411060595),
(94,	10,	3,	'20,30,21,29,18',	1410970425,	1411065348),
(101,	15,	3,	'30',	1410973825,	1411060560),
(113,	8,	3,	'19,20',	1410978973,	1411065980);

DROP TABLE IF EXISTS `mantis_user_pref_table`;
CREATE TABLE `mantis_user_pref_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `default_profile` int(10) unsigned NOT NULL DEFAULT '0',
  `default_project` int(10) unsigned NOT NULL DEFAULT '0',
  `refresh_delay` int(11) NOT NULL DEFAULT '0',
  `redirect_delay` int(11) NOT NULL DEFAULT '0',
  `bugnote_order` varchar(4) NOT NULL DEFAULT 'ASC',
  `email_on_new` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_assigned` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_feedback` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_resolved` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_closed` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_reopened` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_bugnote` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_status` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_priority` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_priority_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_status_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_bugnote_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_reopened_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_closed_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_resolved_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_feedback_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_assigned_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_new_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_bugnote_limit` smallint(6) NOT NULL DEFAULT '0',
  `language` varchar(32) NOT NULL DEFAULT 'english',
  `timezone` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `mantis_user_pref_table` (`id`, `user_id`, `project_id`, `default_profile`, `default_project`, `refresh_delay`, `redirect_delay`, `bugnote_order`, `email_on_new`, `email_on_assigned`, `email_on_feedback`, `email_on_resolved`, `email_on_closed`, `email_on_reopened`, `email_on_bugnote`, `email_on_status`, `email_on_priority`, `email_on_priority_min_severity`, `email_on_status_min_severity`, `email_on_bugnote_min_severity`, `email_on_reopened_min_severity`, `email_on_closed_min_severity`, `email_on_resolved_min_severity`, `email_on_feedback_min_severity`, `email_on_assigned_min_severity`, `email_on_new_min_severity`, `email_bugnote_limit`, `language`, `timezone`) VALUES
(1,	29,	0,	0,	1,	30,	2,	'ASC',	1,	1,	1,	1,	1,	1,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	'english',	'America/Edmonton'),
(2,	1,	0,	0,	1,	30,	2,	'ASC',	1,	1,	1,	1,	1,	1,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	'english',	'America/Edmonton');

DROP TABLE IF EXISTS `mantis_user_print_pref_table`;
CREATE TABLE `mantis_user_print_pref_table` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `print_pref` varchar(64) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_user_profile_table`;
CREATE TABLE `mantis_user_profile_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `platform` varchar(32) NOT NULL DEFAULT '',
  `os` varchar(32) NOT NULL DEFAULT '',
  `os_build` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `mantis_user_profile_table` (`id`, `user_id`, `platform`, `os`, `os_build`, `description`) VALUES
(1,	0,	'N/A',	'N/A',	'N/A',	'');

DROP TABLE IF EXISTS `mantis_user_table`;
CREATE TABLE `mantis_user_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '',
  `realname` varchar(64) NOT NULL DEFAULT '',
  `email` varchar(64) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `protected` tinyint(4) NOT NULL DEFAULT '0',
  `access_level` smallint(6) NOT NULL DEFAULT '10',
  `login_count` int(11) NOT NULL DEFAULT '0',
  `lost_password_request_count` smallint(6) NOT NULL DEFAULT '0',
  `failed_login_count` smallint(6) NOT NULL DEFAULT '0',
  `cookie_string` varchar(64) NOT NULL DEFAULT '',
  `last_visit` int(10) unsigned NOT NULL DEFAULT '1',
  `date_created` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_cookie_string` (`cookie_string`),
  UNIQUE KEY `idx_user_username` (`username`),
  KEY `idx_enable` (`enabled`),
  KEY `idx_access` (`access_level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `mantis_user_table` (`id`, `username`, `realname`, `email`, `password`, `enabled`, `protected`, `access_level`, `login_count`, `lost_password_request_count`, `failed_login_count`, `cookie_string`, `last_visit`, `date_created`) VALUES
(1,	'administrator',	'Administrator User',	'',	'5c1f1ee8133c8c02e8e005461ac924fa',	1,	0,	90,	53,	0,	0,	'd83be508932f3af9a5f7400d8cf5a52600427675a83192a46583df0757bbccbf',	1410979065,	1407536734),
(3,	'anonymous',	'Anonymous',	'nomail@nomail.local',	'2e275723301c8c6788cd2bd4e6250ff7',	1,	0,	25,	7,	0,	0,	'b1a95da78bf8126070bf3a136504e60df9fa5adcf20e78305e5737daaa3ae270',	1408130004,	1408130004),
(9,	'barmstrong',	'Bub Armstrong',	'barmstrong@whizzer.local',	'appleton',	1,	0,	25,	0,	0,	0,	'cb90fce7eef4418d3c9c8d333b52f8820015451ae79a893862d15bbfef6d30d5',	1408202886,	1408202886),
(6,	'bjenks',	'Barcoe Jenks',	'bjenks@whizzer.local',	'5c1f1ee8133c8c02e8e005461ac924fa',	1,	0,	55,	5,	0,	0,	'cf3f864191ff19b28b848e9d769a2d7314e3d80b447dc2fb3c171a1229b2499b',	1410971181,	1408136885),
(8,	'bswift',	'Barton Swift',	'bswift@whizzer.local',	'5c1f1ee8133c8c02e8e005461ac924fa',	1,	0,	70,	5,	0,	0,	'0aa4df7418b3d07d4ccea5061d3043cc531119a32b7f582b891c5e745aa2e994',	1410979580,	1408163236),
(10,	'fmason',	'Frank Mason',	'fmason@whizzer.local',	'5c1f1ee8133c8c02e8e005461ac924fa',	1,	0,	55,	4,	0,	0,	'9f9116d777c7125e6f17fcd383b5a95c66175e81078114656625985061ffaa88',	1410978948,	1408202973),
(11,	'gjackson',	'Garret Jackson',	'gjackson@whizzer.local',	'appleton',	1,	0,	25,	0,	0,	0,	'959981212f3a1528d4d7a1b3b761a85b092ad8b268578f2828e4190ddfd3b2a4',	1408203003,	1408203003),
(12,	'hbaldwin',	'Hank Baldwin',	'hbaldwin@whizzer.local',	'appleton',	1,	0,	25,	0,	0,	0,	'd6e5c06ea8a786d2c70998828680adf9c79435511994ebf55b3943aa76f6728b',	1408203031,	1408203031),
(13,	'hrandall',	'Helen Randall',	'hrandall@whizzer.local',	'appleton',	1,	0,	25,	0,	0,	0,	'bc40d141512f44bad32609b942cadf4bb2b1160d5647bb3f0d4f170d98d10e0f',	1408203058,	1408203058),
(14,	'jwood',	'Jacob Wood',	'jwood@whizzer.local',	'appleton',	1,	0,	25,	0,	0,	0,	'fddb72c6606895d37599a9c6d9c4952f8e0a3184c18f3d9a894698de751c745f',	1408203085,	1408203085),
(15,	'jperiod',	'James Period',	'jperiod@whizzer.local',	'5c1f1ee8133c8c02e8e005461ac924fa',	1,	0,	70,	3,	0,	0,	'3b8f4f8c7a86ddb18a88759172438559ab40970707eaf014e52826b82a6d1c21',	1410974160,	1408203110),
(16,	'jhaddon',	'Jennie Haddon',	'jhaddon@whizzer.local',	'appleton',	1,	0,	25,	0,	0,	0,	'1ee7dd42b6df19f527b60a27ba61740412dda1b80498df70523721384c0ddf38',	1408203136,	1408203136),
(17,	'jmorse',	'Jennie Morse',	'jmorse@whizzer.local',	'appleton',	1,	0,	25,	0,	0,	0,	'4f795ac06ad9478cdee52be062e60f78e4e938ead07456f49e0b86cda31c99f9',	1408203173,	1408203173),
(18,	'jsharp',	'John Sharp',	'jsharp@whizzer.local',	'appleton',	1,	0,	25,	0,	0,	0,	'8c3a0d3badad2d6975d3c1557e761694d5e8179ffc9e3fccb3ae6b0838f34096',	1408203198,	1408203198),
(19,	'mnestor',	'Mary Nestor',	'mnestor@whizzer.local',	'appleton',	1,	0,	25,	0,	0,	0,	'ed20d660b5134440aec5f9c0b8addac5d06108a2c8a61ac501cc962db8a22119',	1408203229,	1408203229),
(20,	'mblair',	'Minnie Blair',	'mblair@whizzer.local',	'appleton',	1,	0,	25,	0,	0,	0,	'978192ad21ebb9e86ce4383c697aff778e1d2fe816ef86fbf7cdd8e35353d3ac',	1408203272,	1408203272),
(21,	'mdelazes',	'Miquel DeLazes',	'mdelazes@whizzer.local',	'5c1f1ee8133c8c02e8e005461ac924fa',	1,	0,	70,	1,	0,	0,	'85b85ebb78312be85148ac4e5e2179be7fd5a5b8c7ce226841c2694181ed91cb',	1410979043,	1408203303),
(22,	'nnewton',	'Ned Newton',	'nnewton@whizzer.local',	'appleton',	1,	0,	25,	0,	0,	0,	'162b60ae81dc61dd1d52d90025ae454b2f5678f2cde1e64a80fb9fbfbef8bff1',	1408203334,	1408203334),
(23,	'rsampson',	'Rad Sampson',	'rsampson@whizzer.local',	'appleton',	1,	0,	25,	0,	0,	0,	'8d94cc0ad5b541a223a7651264d441cd7a4d5494b727a87e7448b9e5082f1b93',	1408203367,	1408203367),
(24,	'smalloy',	'Sarah Malloy',	'smalloy@whizzer.local',	'appleton',	1,	0,	25,	0,	0,	0,	'5c636649a3b7f54ce23859ba5b0925c77ee7c3f6f2a0b46ce70d17bde4d52f01',	1408203397,	1408203397),
(25,	'tswift',	'Tom Swift',	'tswift@whizzer.local',	'5c1f1ee8133c8c02e8e005461ac924fa',	1,	0,	90,	8,	0,	0,	'284126c9a39f977727b62c6202c834e9af5df3597bbe27fc05b8ca635d4aa024',	1410974195,	1408203424),
(26,	'wdamon',	'Wakefield Damon',	'wdamon@whizzer.local',	'appleton',	1,	0,	25,	0,	0,	0,	'ce65404e4119a90a43391940ed77f7519c6c764166e6cdbb5987b5278653283a',	1408203465,	1408203465),
(27,	'wcrawford',	'William Crawford',	'wcrawford@whizzer.local',	'5c1f1ee8133c8c02e8e005461ac924fa',	1,	0,	25,	1,	0,	0,	'0d4aecfb15765e8e2cdf56a8de986dae9206f48efc7b178a3b82e9a9059d2d29',	1408203541,	1408203504),
(29,	'admin',	'Administrator User',	'',	'5c1f1ee8133c8c02e8e005461ac924fa',	1,	0,	90,	24,	0,	2,	'a3f2191cf54627b883d5a03284f6c7134a42768773a16ee85babc545d319e0cf',	1409982113,	1408741044);

-- 2014-09-17 18:59:38
