USE [Skillet Database]
GO

----------------------------------
--------- CREATE TABLES ----------
----------------------------------

CREATE TABLE Accounting
(accounting_ID INTEGER IDENTITY(1,1) primary key
,from_date date not null --unique yes, def yes (getDate)
,to_date date not null --unique yes, def yes (getDate)
,charge_description nvarchar(100) not null
,charge_amount nvarchar(100) not null
,location_ID INT not null --def yes (identity)
)
GO

CREATE TABLE Locations
(location_ID INTEGER IDENTITY(1,1) primary key
,location_name nvarchar(100) not null
,location_code nvarchar(100) null
)
GO

CREATE TABLE Orders
(order_ID INTEGER IDENTITY(1,1) primary key
,location_ID int not null --def yes (identity)
,export_order_ID int not null --unique yes
,checks_num_ID int not null --def yes (identity)
,opened_ID int not null --def yes (identity)
,table_ID int not null --def yes (identity)
,service_ID	int not null --def yes (identity)
,discount_ID int not null --def yes (identity)
,paid_ID int not null --def yes (identity)
,closed_ID int not null --def yes (identity)
,paid_to_closed_ID int not null --def yes (identity)
,bill_ID int not null --def yes (identity)
,server_ID int not null --def yes (identity)
,order_source nvarchar (100) not null
,num_guests	int not null
)
go

CREATE TABLE Delivery_Order
(delivery_order_ID INTEGER IDENTITY(1,1) primary key
,location_ID int FOREIGN KEY REFERENCES Locations (location_ID) not null --def yes (identity)
,order_ID int FOREIGN KEY REFERENCES Orders (order_ID) not null --def yes (identity)
,delivery_company nvarchar(100) null
,delivery_code nvarchar(100) null
,delivery_first_name nvarchar(100) null
,delivery_last_name nvarchar(100) null
)
go

CREATE TABLE Customer
(customer_ID INTEGER IDENTITY(1,1) primary key
,export_customer_ID int null
,customer_first_name nvarchar(100) null
,customer_last_name nvarchar(100) null
,customer_email nvarchar(100) null --check yes
,customer_phone nvarchar(100) null --check yes
,customer_family nvarchar(100) null
)
go

CREATE TABLE Opened
(opened_ID INTEGER IDENTITY(1,1) primary key
,opened_date date null --def yes (getDate)
,opened_time time null
,location_ID int not null --def yes (identity)
)
go

CREATE TABLE Service_tbl
(service_ID INTEGER IDENTITY(1,1) primary key
,services_name nvarchar(100) not null
,dining_option nvarchar(100) not null
)
go

CREATE TABLE Bill
(bill_ID INTEGER IDENTITY(1,1) primary key
,discount_ID int not null --def yes (identity)
,bill_amount smallmoney not null
,tax smallmoney not null
,tip smallmoney not null
,tender smallmoney not null
,gratuity smallmoney not null
,bill_total smallmoney not null
,volDed BIT not null
)
go

CREATE TABLE Paid
(paid_ID INTEGER IDENTITY(1,1) primary key
,paid_time time not null
,paid_date date not null --def yes(getDate)
,location_ID int not null --def yes (identity)
)
go

CREATE TABLE Closed
(closed_ID INTEGER IDENTITY(1,1) primary key
,closed_time time not null
,closed_date date not null --def yes(getDate)
,location_ID int not null --def yes (identity)
)
go

CREATE TABLE Paid_to_closed
(paid_to_closed_ID INTEGER IDENTITY(1,1) primary key
,paid_closed_duration time not null
,closed_date date null
)
go


--'check' is a reserved identifier
CREATE TABLE Checks
(check_ID INTEGER IDENTITY(1,1) primary key
,opened_ID int not null --def yes (identity)
,server_ID int not null --def yes (identity)
,table_ID int not null --def yes (identity)
,discount_ID int not null --def yes (identity)
,export_check_ID int
,bill_ID int not null --def yes (identity)
,item_description nvarchar(100)
)
go

CREATE TABLE Check_num
(check_num_ID INTEGER IDENTITY(1,1) primary key
,location_ID int not null --def yes (identity)
,check_num int not null
,order_ID int not null --def yes (identity)
,link nvarchar(100) null
,check_ID int not null --def yes (identity)
)
go

-- CHANGED FROM decimal/smallmoney to decimal
CREATE TABLE Discount
(discount_ID INTEGER IDENTITY(1,1) primary key,
discount_amount decimal not null,
discount_reason nvarchar(100) null
)
go

--'table' and 'tables' is a reserved identifier
CREATE TABLE Tables_tbl
(table_ID INTEGER IDENTITY(1,1) primary key
,table_code	nvarchar(100) null
,table_size	int not null
,location_ID int not null --def yes (identity)
,dining_area nvarchar(100) null
)
go

CREATE TABLE Refund
(refund_ID INTEGER IDENTITY(1,1) primary key
,refund_date date null --def yes (getDate)
,refund_amount smallmoney null
)
go

CREATE TABLE Void
(void_ID INTEGER IDENTITY(1,1) primary key
,void_user nvarchar(100) null
,void_approver nvarchar(100) null
,void_date date null --def yes (getDate)
)
go

-- CHANGED FROM decimal/smallmoney to smallmoney
CREATE TABLE Payments
(payments_ID INTEGER IDENTITY(1,1) primary key
,location_ID int not null --def yes (identity)
,export_check_ID int not null
,delivery_order_ID int not null --def yes (identity)
,server_ID int not null --def yes (identity)
,table_ID int not null --def yes (identity)
,service_ID int not null --def yes (identity)
,house_account_num nvarchar(100) null
,bill_ID int not null --def yes (identity)
,customer_ID int not null --def yes (identity)
,amount_tendered smallmoney not null
,refund_ID int not null --def yes (identity)
,void_ID int not null --def yes (identity)
,status_payment nvarchar(100) not null
,type_payment nvarchar(100) not null
,card_ID int not null --def yes (identity)
,cash_drawer nvarchar(100) null
,other_type nvarchar(100) null
,customer_phone nvarchar(100) null --check yes
,customer_email nvarchar(100) null --check yes
,v_mc_d_fees smallmoney null
,receipt nvarchar(100) null
,source_payment nvarchar(100) null
,swiped_card_amount smallmoney not null
,keyed_card_amount smallmoney not null
)
go

CREATE TABLE Cards
(card_ID INTEGER IDENTITY(1,1) primary key
,card_type nvarchar(100) not null
,last_four_card_digits int not null
,payment_ID int not null --def yes (identity)
)
go

CREATE TABLE Cash_Adjustments
(cash_ad_ID INTEGER IDENTITY(1,1) primary key
,location_ID int not null --def yes (identity)
,entry_ID int not null --def yes (identity)
,created_time time not null
,created_date date --def yes (getDate)
,actions nvarchar(100) not null
,cash_drawer nvarchar(100) not null
,payout_reason nvarchar(100) null
,no_sale_reason	nvarchar(100) null
,comment nvarchar(100) not null
,employee_one_first_name nvarchar(100) not null
,employee_one_last_name	nvarchar(100) not null
,employee_two_first_name nvarchar(100) not null
,employee_two_last_name	nvarchar(100) not null
)
go

CREATE TABLE Product
(product_ID INTEGER IDENTITY(1,1) primary key,
export_master_ID INT not null,
export_item_ID INT not null,
export_parent_ID INT not null,
menu_name nvarchar(100) not null,
menu_group nvarchar(100) null,
menu_subgroup nvarchar(100) null,
menu_item nvarchar(100) null,
avg_price decimal not null,
itm_qty_voids INT not null,
percent_itm_qty_voids decimal not null,
gross_amt_voids decimal not null,
itm_qty INT not null,
gross_amt decimal not null,
void_qty INT not null,
void_amt decimal not null,
discount_amt decimal not null,
net_amt decimal not null,
num_orders INT not null,
percent_ttl_num_orders decimal not null,
percent_qty_group decimal not null,
percent_qty_menu decimal not null,
percent_qty_all decimal not null,
percent_net_amt_group decimal not null,
percent_net_amt_menu decimal not null,
percent_net_amt_all decimal not null
)
GO


---- Not executed

CREATE TABLE Kitchen_timings
(kitchen_timings_ID INTEGER IDENTITY(1,1) primary key,
kitchen_export_ID INT not null,
server_ID INT not null, --def Yes(Identity) FK: Server_ID
check_num_ID INT not null, --def Yes(Identity) FK: check_num_ID
table_ID INT null, -- def Yes(Identity) FK: table_ID
check_opened_date DATE not null, --def (getDate) 
check_opened_time TIME not null, -- def
stationed nvarchar(100) null,
expediter_level INT null,
fired_time TIME not null,
fired_date DATE not null, -- Def Yes(getDate)
fulfilled_time TIME not null,
fulfilled_date DATE not null, -- def Yes(getDate)
fulfillment_time nvarchar(100) not null,
fulfilled_by nvarchar(100) not null
)
GO

CREATE TABLE Server_tbl --server is key word in SSMS
(server_ID INTEGER IDENTITY(1,1) primary key,
server_firstname nvarchar(100) not null,
server_lastname nvarchar(100) not null,
employee_ID INT not null -- def Yes(Identity)
)
GO

CREATE TABLE Employee
(employee_ID INTEGER IDENTITY(1,1) primary key,
employee_first_name nvarchar(100) not null,
employee_last_name nvarchar(100) not null,
location_ID INT not null, -- FK
export_employee_ID INT not null,
job_ID INT not null -- FK
)
GO

CREATE TABLE Job
(job_ID INTEGER IDENTITY(1,1) primary key,
job_guid INT not null,
job_code nvarchar(100) not null,
job_title nvarchar(100) null,
)
GO

CREATE TABLE Modifiers
(modifier_ID INTEGER IDENTITY(1,1) primary key,
menu_ID INT not null,
menu_group_ID INT not null,
menu_subgroup_ID INT not null,
menu_item_ID INT not null,
location_ID INT not null,
order_ID INT not null,
check_ID INT not null,
server_ID INT not null,
table_ID INT not null,
service_ID INT not null,
export_modifier_ID INT null,
export_master_ID INT null,
item_selection_ID INT not null,
modifier_sku nvarchar(100) null,
modifier_plu nvarchar(100) null,
modifier_description nvarchar(100) not null,
parent_menu_selection_item_ID INT not null,
parent_menu_selection nvarchar(100) not null,
sales_category nvarchar(100) null,
gross_price INT not null,
discount_ID INT not null,
net_price INT not null,
void_ID INT not null,
delivery_order_ID INT not null,
order_date DATE not null,
order_time TIME not null,
sent_date DATE not null,
sent_time TIME not null
)
GO


--- NOT EXECUTED 2----

CREATE TABLE Time_entries
(time_entries_ID INTEGER IDENTITY(1,1) primary key,
export_time_entries_ID INT not null,
guid nvarchar(100) not null,
employee_ID INT not null,
job_ID INT not null,
in_date DATE not null,
in_time TIME not null,
out_date DATE not null,
out_time TIME not null,
auto_clock_out nvarchar(100) not null,
total_hours DECIMAL not null,
modifier_plu DECIMAL not null,
unpaid_break_time DECIMAL not null,
paid_break_time DECIMAL not null,
payable_hours DECIMAL not null,
cash_tip_declared DECIMAL not null,
non_cash_tips DECIMAL null,
total_gratuity DECIMAL not null,
total_tips DECIMAL not null,
tips_withheld DECIMAL null,
wage DECIMAL null,
regular_hours DECIMAL null,
overtime_hours DECIMAL not null,
regular_pay DECIMAL null,
overtime_pay DECIMAL null,
total_pay DECIMAL null
)
GO

CREATE TABLE Menu
(menu_ID INTEGER IDENTITY(1,1) primary key,
name nvarchar(100) null,
menu_guid nvarchar(100) null,
description nvarchar(100) null,
groups nvarchar(100) null,
menu_group_ID INT not null --FK
)
GO

CREATE TABLE Menu_group
(menu_group_ID INTEGER IDENTITY(1,1) primary key,
export_menu_json_group_ID INT null,
ID_string nvarchar(100) null,
menu_group_guid nvarchar(100) null,
name nvarchar(100) null,
description nvarchar(100) null,
image_link nvarchar(100) null,
items nvarchar(100) null,
menu_item_ID INT not null --FK
)
GO

CREATE TABLE Menu_item
(menu_item_ID INTEGER IDENTITY(1,1) primary key,
menu_item_guid nvarchar(100) null,
menu_item_description nvarchar(100) null,
menu_item_plu nvarchar(100) null,
menu_item_sku nvarchar(100) null,
price nvarchar(100) null,
prices nvarchar(100) null,
option_groups nvarchar(100) null,
id_string nvarchar(100) null,
calories nvarchar(100) null,
image_link nvarchar(100) null,
unit_of_measure nvarchar(100) null,
orderable_online nvarchar(100) null,
visibility nvarchar(100) null,
)
GO

CREATE TABLE Item_selection
(item_selection_ID INTEGER IDENTITY(1,1) primary key,
modifier_ID INT not null, --FK
export_item_selection_ID INT not null,
sku nvarchar(100) not null,
slu nvarchar(100) not null,
menu_item_ID INT not null, --FK
menu_group_ID INT not null, --FK
menu_ID INT not null, --FK
)
GO

CREATE TABLE Tax
(tax_ID INTEGER IDENTITY(1,1) primary key,
deferred BIT not null,
exempt BIT not null,
inclusion_option nvarchar(100) not null,
dining_option_tax nvarchar(100) not null
)
GO

CREATE TABLE Menu_subgroup
(Menu_subgroup_ID INTEGER IDENTITY(1,1) primary key,
name nvarchar(100) null
)
GO

CREATE TABLE Date_time
(date_time_ID INTEGER IDENTITY(1,1) primary key,
Date DATE not null,
Time TIME not null
)
GO