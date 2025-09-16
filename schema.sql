CREATE TABLE "Customer_Info" (
	"customer_id" INTEGER NOT NULL UNIQUE,
	"First_name" VARCHAR(255) NOT NULL,
	"Last_name" VARCHAR(255) NOT NULL,
	"Email" VARCHAR(255),
	"Phone" VARCHAR(255),
	"Loyalty_Points" INTEGER,
	"Created_on" TIMESTAMP,
	PRIMARY KEY("customer_id")
);

CREATE TABLE "Orders" (
	"order_id" INTEGER NOT NULL UNIQUE,
	"customer_id" INTEGER NOT NULL,
	"status" VARCHAR(255),
	"order_time" TIMESTAMP,
	"total_price" DECIMAL NOT NULL,
	PRIMARY KEY("order_id")
);

CREATE TABLE "Order_Items" (
	"order_item_id" INTEGER NOT NULL UNIQUE,
	"order_id" INTEGER NOT NULL,
	"item_id" INTEGER NOT NULL,
	"quantity" INTEGER NOT NULL,
	"final_price" DECIMAL NOT NULL,
	PRIMARY KEY("order_item_id")
);

CREATE TABLE "Menu_Items" (
	"item_id" INTEGER NOT NULL UNIQUE,
	"name" VARCHAR(255) NOT NULL,
	"type" VARCHAR(255),
	"base_price" DECIMAL NOT NULL,
	"in_stock" BOOLEAN NOT NULL,
	"loyalty_points" INTEGER NOT NULL,
	PRIMARY KEY("item_id")
);

CREATE TABLE "Inventory" (
	"item_id" INTEGER NOT NULL UNIQUE,
	"quantity" INTEGER NOT NULL,
	PRIMARY KEY("item_id")
);

CREATE TABLE "Customizations" (
	"customize_id" INTEGER NOT NULL UNIQUE,
	"name" VARCHAR(255),
	"price" DECIMAL,
	PRIMARY KEY("customize_id")
);

CREATE TABLE "Order_item_Customization" (
	"order_item_id" INTEGER NOT NULL UNIQUE,
	"customization_id" INTEGER NOT NULL UNIQUE,
	PRIMARY KEY("order_item_id", "customization_id")
);
ALTER TABLE "Orders"
ADD FOREIGN KEY("order_id") REFERENCES "Customer_Info"("customer_id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Orders"
ADD FOREIGN KEY("customer_id") REFERENCES "Customer_Info"("customer_id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Order_Items"
ADD FOREIGN KEY("order_id") REFERENCES "Orders"("order_id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Order_Items"
ADD FOREIGN KEY("item_id") REFERENCES "Menu_Items"("item_id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Inventory"
ADD FOREIGN KEY("item_id") REFERENCES "Menu_Items"("item_id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Order_item_Customization"
ADD FOREIGN KEY("order_item_id") REFERENCES "Order_Items"("order_item_id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Order_item_Customization"
ADD FOREIGN KEY("customization_id") REFERENCES "Customizations"("customize_id")
ON UPDATE NO ACTION ON DELETE NO ACTION;