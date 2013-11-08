-- clear tables
-- delete all tables from maestro for clean migration
--
-- > mysql -uroot -p --show-warnings --verbose --force < ./clear_tables.sql
--

USE maestro;

DROP TABLE `tbl_migration`;

DROP TABLE `tbl_stock_serial`;

DROP TABLE `tbl_issue`;

DROP TABLE `tbl_project`;

DROP TABLE `tbl_pv_al`;
DROP TABLE `tbl_pv_cnv`;
DROP TABLE `tbl_pv_cost`;
DROP TABLE `tbl_pv_cu`;
DROP TABLE `tbl_pv_cur`;
DROP TABLE `tbl_pv_fil`;
DROP TABLE `tbl_pv_hist`;
DROP TABLE `tbl_pv_hpref`;
DROP TABLE `tbl_pv_job`;
DROP TABLE `tbl_pv_lin`;
DROP TABLE `tbl_pv_lnk`;
DROP TABLE `tbl_pv_mf`;
DROP TABLE `tbl_pv_mfr`;
DROP TABLE `tbl_pv_mfrpn`;
DROP TABLE `tbl_pv_org`;
DROP TABLE `tbl_pv_pl`;
DROP TABLE `tbl_pv_pll`;
DROP TABLE `tbl_pv_pn`;
DROP TABLE `tbl_pv_po`;
DROP TABLE `tbl_pv_pod`;
DROP TABLE `tbl_pv_pom`;
DROP TABLE `tbl_pv_rpx`;
DROP TABLE `tbl_pv_ship`;
DROP TABLE `tbl_pv_su`;
DROP TABLE `tbl_pv_task`;
DROP TABLE `tbl_pv_type`;
DROP TABLE `tbl_pv_un`;

DROP TABLE `tbl_stock_location`;

DROP TABLE `tbl_person`;
