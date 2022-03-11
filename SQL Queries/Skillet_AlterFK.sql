USE [Skillet Database]
GO

-- ACCOUNTING
ALTER TABLE Accounting                                 
ADD CONSTRAINT FK_Accounting_location_ID
FOREIGN KEY (location_ID)
REFERENCES Locations (location_ID)
go

-- DELIVERY_ORDER
ALTER TABLE Delivery_Order
ADD CONSTRAINT FK_Delivery_Order_location_ID
FOREIGN KEY (location_ID)
REFERENCES Locations (location_ID)
go
ALTER TABLE Delivery_Order
ADD CONSTRAINT FK_Delivery_Order_order_ID
FOREIGN KEY (order_ID)
REFERENCES Orders (order_ID)
go

-- OPENED
ALTER TABLE Opened
ADD CONSTRAINT FK_Opened_location_ID
FOREIGN KEY (location_ID)
REFERENCES Locations (location_ID)
go

-- BILL
ALTER TABLE Bill
ADD CONSTRAINT FK_Opened_discount_ID
FOREIGN KEY (discount_ID)
REFERENCES Discount (discount_ID)
go

-- PAID
ALTER TABLE Paid
ADD CONSTRAINT FK_Paid_location_ID
FOREIGN KEY (location_ID)
REFERENCES Locations (location_ID)
go

-- CLOSED
ALTER TABLE Closed
ADD CONSTRAINT FK_Closed_location_ID
FOREIGN KEY (location_ID)
REFERENCES Locations (location_ID)
go

--ORDERS
ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_location_ID
FOREIGN KEY (location_ID)
REFERENCES Locations (location_ID)
go

ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_check_ID
FOREIGN KEY (checks_num_ID)
REFERENCES Checks (check_ID)
go

ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_opened_ID
FOREIGN KEY (opened_ID)
REFERENCES Opened (opened_ID)
go

ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_table_ID
FOREIGN KEY (table_ID)
REFERENCES Tables_tbl (table_ID)
go

ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_service_ID
FOREIGN KEY (service_ID)
REFERENCES Service_tbl (service_ID)
go
ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_discount_ID
FOREIGN KEY (discount_ID)
REFERENCES Discount (discount_ID)
go
ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_paid_ID
FOREIGN KEY (paid_ID)
REFERENCES Paid (paid_ID)
go
ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_closed_ID
FOREIGN KEY (closed_ID)
REFERENCES Closed (closed_ID)
go
ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_paid_to_closed_ID
FOREIGN KEY (paid_to_closed_ID)
REFERENCES Paid_to_closed (paid_to_closed_ID)
go
ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_bill_ID
FOREIGN KEY (bill_ID)
REFERENCES Bill (bill_ID)
go
ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_server_ID
FOREIGN KEY (server_ID)
REFERENCES Server_tbl (server_ID)
go

-- CHECKS
ALTER TABLE Checks
ADD CONSTRAINT FK_Checks_opened_ID
FOREIGN KEY (opened_ID)
REFERENCES Opened (opened_ID)
go
ALTER TABLE Checks
ADD CONSTRAINT FK_Checks_server_ID
FOREIGN KEY (server_ID)
REFERENCES Server_tbl (server_ID)
go
ALTER TABLE Checks
ADD CONSTRAINT FK_Checks_table_ID
FOREIGN KEY (table_ID)
REFERENCES Tables_tbl (table_ID)
go
ALTER TABLE Checks
ADD CONSTRAINT FK_Checks_discount_ID
FOREIGN KEY (discount_ID)
REFERENCES Discount (discount_ID)
go
ALTER TABLE Checks
ADD CONSTRAINT FK_Checks_bill_ID
FOREIGN KEY (bill_ID)
REFERENCES Bill (bill_ID)
go


ALTER TABLE Check_num
ADD CONSTRAINT FK_Check_num_location_ID
FOREIGN KEY (location_ID)
REFERENCES Locations (location_ID)
go

ALTER TABLE Check_num
ADD CONSTRAINT FK_Check_num_check_ID
FOREIGN KEY (check_ID)
REFERENCES Checks (check_ID)
go

-- TABLES
ALTER TABLE Tables_tbl
ADD CONSTRAINT FK_Tables_tbl_location_ID
FOREIGN KEY (location_ID)
REFERENCES Locations (location_ID)
go

-- PAYMETS
ALTER TABLE Payments
ADD CONSTRAINT FK_Payments_location_ID
FOREIGN KEY (location_ID)
REFERENCES Locations (location_ID)
go
ALTER TABLE Payments
ADD CONSTRAINT FK_Payments_delivery_order_ID
FOREIGN KEY (delivery_order_ID)
REFERENCES Delivery_Order (delivery_order_ID)
go
ALTER TABLE Payments
ADD CONSTRAINT FK_Payments_server_ID
FOREIGN KEY (server_ID)
REFERENCES Server_tbl (server_ID)
go
ALTER TABLE Payments
ADD CONSTRAINT FK_Payments_table_ID
FOREIGN KEY (table_ID)
REFERENCES Tables_tbl (table_ID)
go
ALTER TABLE Payments
ADD CONSTRAINT FK_Payments_service_ID
FOREIGN KEY (service_ID)
REFERENCES Service_tbl (service_ID)
go
ALTER TABLE Payments
ADD CONSTRAINT FK_Payments_bill_ID
FOREIGN KEY (bill_ID)
REFERENCES Bill (bill_ID)
go
ALTER TABLE Payments
ADD CONSTRAINT FK_Payments_customer_ID
FOREIGN KEY (customer_ID)
REFERENCES Customer (customer_ID)
go
ALTER TABLE Payments
ADD CONSTRAINT FK_Payments_refund_ID
FOREIGN KEY (refund_ID)
REFERENCES Refund (refund_ID)
go
ALTER TABLE Payments
ADD CONSTRAINT FK_Payments_void_ID
FOREIGN KEY (void_ID)
REFERENCES Void (void_ID)
go

ALTER TABLE Payments                        
ADD CONSTRAINT FK_Payments_card_ID
FOREIGN KEY (card_ID)
REFERENCES Cards (card_ID)
go

-- CARDS
ALTER TABLE Cards                                   
ADD CONSTRAINT FK_Cards_payment_ID
FOREIGN KEY (payment_ID)                        
REFERENCES Payment (payment_ID)
go

--CASH_ADJUSTMENTS
ALTER TABLE Cash_Adjustments
ADD CONSTRAINT FK_Cash_Adjustments_location_ID
FOREIGN KEY (location_ID)
REFERENCES Locations (location_ID)
go

ALTER TABLE Cash_Adjustments
ADD CONSTRAINT FK_Cash_Adjustments_entry_ID                --------------- FLAGGED
FOREIGN KEY (entry_ID)
REFERENCES Entries (entry_ID)
-- table doesn't exist
go

-- HAVE NOT EXECUTED


-- KITCHEN TIMINGS
ALTER TABLE Kitchen_timings
ADD CONSTRAINT FK_Kitchen_timings_server_ID
FOREIGN KEY (server_ID)
REFERENCES Server_tbl (Server_ID)
GO

ALTER TABLE Kitchen_timings
ADD CONSTRAINT FK_Kitchen_timings_check_num_ID
FOREIGN KEY (check_num_ID)
REFERENCES Check_num (check_num_ID)
GO

ALTER TABLE Kitchen_timings
ADD CONSTRAINT FK_Kitchen_timings_table_ID
FOREIGN KEY (table_ID)
REFERENCES Tables_tbl (table_ID)
GO

-- SERVER
ALTER TABLE Server_tbl
ADD CONSTRAINT FK_Server_employee_ID
FOREIGN KEY (employee_ID)
REFERENCES Employee (employee_ID)
GO

-- Employee
ALTER TABLE Employee
ADD CONSTRAINT FK_Employee_location_ID
FOREIGN KEY (location_ID)
REFERENCES Locations (location_ID)
GO

ALTER TABLE Employee
ADD CONSTRAINT FK_Employee_job_ID
FOREIGN KEY (job_ID)
REFERENCES Job (job_ID)
GO

-- Modifiers
-- YET TO DO all menu IDS
ALTER TABLE Modifiers
ADD CONSTRAINT FK_Modifiers_location_ID
FOREIGN KEY (location_ID)
REFERENCES Locations (location_ID)
GO

ALTER TABLE Modifiers
ADD CONSTRAINT FK_Modifiers_orders_ID
FOREIGN KEY (order_ID)
REFERENCES Orders (order_ID)
GO

ALTER TABLE Modifiers
ADD CONSTRAINT FK_Modifiers_check_ID
FOREIGN KEY (check_ID)
REFERENCES Checks (check_ID)
GO

ALTER TABLE Modifiers
ADD CONSTRAINT FK_Modifiers_server_ID
FOREIGN KEY (server_ID)
REFERENCES Server_tbl (server_ID)
GO

ALTER TABLE Modifiers
ADD CONSTRAINT FK_Modifiers_table_ID
FOREIGN KEY (table_ID)
REFERENCES Tables_tbl (table_ID)
GO

ALTER TABLE Modifiers
ADD CONSTRAINT FK_Modifiers_service_ID
FOREIGN KEY (service_ID)
REFERENCES Service_tbl(service_ID)
GO

ALTER TABLE Modifiers
ADD CONSTRAINT FK_Modifiers_discount_ID
FOREIGN KEY  (discount_ID)
REFERENCES Discount (discount_ID)
GO

ALTER TABLE Modifiers
ADD CONSTRAINT FK_Modifiers_void_ID
FOREIGN KEY (void_ID)
REFERENCES Void (void_ID)
GO

ALTER TABLE Modifiers
ADD CONSTRAINT FK_Modifiers_deliveryOrder_ID
FOREIGN KEY (delivery_order_ID)
REFERENCES Delivery_order (delivery_order_ID)
GO

-- Time Entries

ALTER TABLE Time_entries
ADD CONSTRAINT FK_Time_entries_employee_ID
FOREIGN KEY (employee_ID)
REFERENCES Employee (employee_ID)
GO

ALTER TABLE Time_entries
ADD CONSTRAINT FK_Time_entries_job_ID
FOREIGN KEY (job_ID)
REFERENCES Job (job_ID)
GO

-- Menu
ALTER TABLE Menu
ADD CONSTRAINT FK_Menu_menu_group_ID
FOREIGN KEY (menu_group_ID)
REFERENCES Menu_group (menu_group_ID)
GO

-- Menu Group
ALTER TABLE Menu_group
ADD CONSTRAINT FK_Menu_group_menu_item_ID
FOREIGN KEY (menu_item_ID)
REFERENCES Menu_item (menu_item_ID)
GO

-- item selection
ALTER TABLE Item_selection
ADD CONSTRAINT FK_Item_selection_modifiers_ID
FOREIGN KEY (modifier_ID)
REFERENCES Modifiers (modifier_ID)
GO

ALTER TABLE Item_selection
ADD CONSTRAINT FK_Item_selection_menu_item_ID
FOREIGN KEY (menu_item_ID)
REFERENCES Menu_item (menu_item_ID)
GO

ALTER TABLE Item_selection
ADD CONSTRAINT FK_Item_selection_menu_group_ID
FOREIGN KEY (menu_group_ID)
REFERENCES Menu_group (menu_group_ID)
GO

ALTER TABLE Item_selection
ADD CONSTRAINT FK_Item_selection_menu_ID
FOREIGN KEY (menu_ID)
REFERENCES Menu (menu_ID)
GO