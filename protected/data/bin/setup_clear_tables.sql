-- delete ALL data from database
-- (leave Yii migration table as-is)
--
-- > mysql -uroot -p --show-warnings --verbose --force < ./clear_tables.sql
--
-- MUST match current migration schema
--

SET FOREIGN_KEY_CHECKS=0;

TRUNCATE TABLE `tbl_activity`;
TRUNCATE TABLE `tbl_currency`;
TRUNCATE TABLE `tbl_customer`;
TRUNCATE TABLE `tbl_file`;
TRUNCATE TABLE `tbl_issue`;
TRUNCATE TABLE `tbl_manufacturer`;
TRUNCATE TABLE `tbl_order`;
TRUNCATE TABLE `tbl_order_item`;
TRUNCATE TABLE `tbl_order_item_stock_assignment`;
TRUNCATE TABLE `tbl_part`;
TRUNCATE TABLE `tbl_part_cost`;
TRUNCATE TABLE `tbl_part_list`;
TRUNCATE TABLE `tbl_part_type`;
TRUNCATE TABLE `tbl_person`;
TRUNCATE TABLE `tbl_project`;
TRUNCATE TABLE `tbl_project_person_assignment`;
TRUNCATE TABLE `tbl_stock`;
TRUNCATE TABLE `tbl_stock_location`;
TRUNCATE TABLE `tbl_supplier`;
TRUNCATE TABLE `tbl_supplier_manufacturer_assignment`;
TRUNCATE TABLE `tbl_unit`;

-- parts&vendors
TRUNCATE TABLE `tbl_pv_al`;
TRUNCATE TABLE `tbl_pv_cnv`;
-- TRUNCATE TABLE `tbl_pv_cost`;
-- TRUNCATE TABLE `tbl_pv_cu`;
-- TRUNCATE TABLE `tbl_pv_cur`;
-- TRUNCATE TABLE `tbl_pv_fil`;
TRUNCATE TABLE `tbl_pv_hist`;
TRUNCATE TABLE `tbl_pv_hpref`;
TRUNCATE TABLE `tbl_pv_job`;
-- TRUNCATE TABLE `tbl_pv_lin`;
TRUNCATE TABLE `tbl_pv_lnk`;
TRUNCATE TABLE `tbl_pv_mf`;
-- TRUNCATE TABLE `tbl_pv_mfr`;
-- TRUNCATE TABLE `tbl_pv_mfrpn`;
TRUNCATE TABLE `tbl_pv_org`;
-- TRUNCATE TABLE `tbl_pv_pl`;
TRUNCATE TABLE `tbl_pv_pll`;
-- TRUNCATE TABLE `tbl_pv_pn`;
TRUNCATE TABLE `tbl_pv_po`;
TRUNCATE TABLE `tbl_pv_pod`;
TRUNCATE TABLE `tbl_pv_pom`;
TRUNCATE TABLE `tbl_pv_rpx`;
TRUNCATE TABLE `tbl_pv_ship`;
-- TRUNCATE TABLE `tbl_pv_su`;
TRUNCATE TABLE `tbl_pv_task`;
-- TRUNCATE TABLE `tbl_pv_type`;
-- TRUNCATE TABLE `tbl_pv_un`;

SET FOREIGN_KEY_CHECKS=1;
