user name = 


-----------------------------------------------------------
CREATE TABLE company (company_id NUMBER(2),
					  company_name VARCHAR2(30),
					  location 	VARCHAR2(20),
					  description VARCHAR2(200));
-----------------------------------------------------------

CREATE TABLE items (item_id NUMBER(5),
				    item_name VARCHAR2(50),
				    description VARCHAR2(200),
				    model_name VARCHAR2(30),
				    company_id NUMBER(2));
-----------------------------------------------------------

CREATE TABLE customers (customer_id	NUMBER(5),
						customer_name VARCHAR2(30),
						customer_address VARCHAR2(200),
						customer_type  VARCHAR2(20),
						phone_no VARCHAR2(12),
						cell_no  VARCHAR2(15),
						cnic	VARCHAR2(15),
						gender VARCHAR2(6),
						nationality VARCHAR2(20),
						status VARCHAR2(20),
						religion VARCHAR2(30),
						company_id NUMBER(2));

--------------------------------------------------------------------

CREATE TABLE customer_invoice (invoice_id	NUMBER(5),
							   invoice_date DATE,
							   invoice_type VARCHAR2(20),
							   invoice_description VARCHAR2(100),
							   customer_id  NUMBER(5));

--------------------------------------------------------------------

CREATE TABLE customer_invoice_detail ( cid_id NUMBER(5),
									   item_id NUMBER(5),
									   sno NUMBER(5),
									   price NUMBER(8,2),
									   invoice_id NUMBER(5));
---------------------------------------------------------------------

- - - - - - - -
- CONSTRAINTS -
- - - - - - - -

ALTER TABLE company   ADD CONSTRAINT pk_company_companyid     PRIMARY KEY (company_id);

ALTER TABLE items     ADD CONSTRAINT pk_items_itemsid         PRIMARY KEY (item_id);

ALTER TABLE customers ADD CONSTRAINT pk_customers_customer_id PRIMARY KEY (customer_id);

ALTER TABLE customer_invoice ADD CONSTRAINT pk_customerinvoice_invoiceid PRIMARY KEY (invoice_id);

ALTER TABLE customer_invoice_detail ADD CONSTRAINT pk_customerinvoicedetail_cidid PRIMARY KEY (cid_id);

ALTER TABLE items ADD CONSTRAINT fk_items_company_companyid FOREIGN KEY (company_id) REFERENCES company(company_id);

ALTER TABLE customer CONSTRAINT fk_customer_company_companyid FOREIGN KEY (company_id) REFERENCES company(company_id);

ALTER TABLE customer_invoice CONSTRAINT fk_customerinvoice_customer_customerid FOREIGN KEY (customer_id) REFERENCES customers (customer_id);

ALTER TABLE customer_invoice_detail CONSTRAINT fk_customerinvoicedetail_customerinvoice_customerinvoiceid FOREIGN KEY (invoice_id) REFERENCES customer_invoice (invoice_id);

ALTER TABLE customer_invoice_detail CONSTRAINT fk_customerinvoicedetail_items_itemid FOREIGN KEY (item_id) REFERENCES items (item_id);

