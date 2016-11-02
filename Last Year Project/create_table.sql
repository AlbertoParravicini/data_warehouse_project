CREATE TABLE [dimDate] (
    [DateID] int NOT NULL PRIMARY KEY,
    [Date] date,
    [Weekday] varchar(20),
    [day] int,
    [month] int,
    [monthname] varchar(20),
    [year] int,
    [semester] int,
    [quarter] int
);

CREATE TABLE [dimTime] (
    [seconds] int NOT NULL PRIMARY KEY,
    [hour] int,
    [part_of_day] varchar(2)
);

CREATE TABLE [dimGeography] (
    [city_id] int NOT NULL PRIMARY KEY,
    [city] varchar(100),
    [state_id] int,
    [state] varchar(100),
    [country_id] int,
    [country_name] varchar(100)
);

CREATE TABLE [dimCustomer] (
    [CID] int IDENTITY(1,1) PRIMARY KEY,
    [oltp_cust_id] int,
    [birth_date_ID] int FOREIGN KEY REFERENCES dimDate(DateID),
    [first_name] varchar(100),
    [last_name] varchar(100),
    [gender] varchar(10),
    [current_city] int FOREIGN KEY REFERENCES dimGeography(city_id),
    [marital_status] varchar(11),
    [no_of_children] int,
    [phone] varchar(50),
    [email] varchar(300),
    [start] datetime,
    [end] datetime
);

CREATE TABLE [dimBranch] (
    [branch_id] int NOT NULL PRIMARY KEY,
    [branch_code] varchar(50),
    [branch_city] int FOREIGN KEY REFERENCES dimGeography(city_id)
);

CREATE TABLE [dimAccount] (
    [AID] int IDENTITY(1,1) PRIMARY KEY,
    [OLTP_acc_id] int,
    [account_type] varchar(50),
    [branch_id] int FOREIGN KEY REFERENCES dimBranch(branch_id),
    [is_external] bit,
    [CID_owner] int FOREIGN KEY REFERENCES dimCustomer(CID),
    [time_ID] int FOREIGN KEY REFERENCES dimTime(seconds),
    [acc_date_ID] int FOREIGN KEY REFERENCES dimDate(DateID),
    [start] datetime,
    [end] datetime
);

CREATE TABLE [factTransaction](
	[AID] [int] NOT NULL FOREIGN KEY REFERENCES dimAccount(AID),
	[other_account_AID] [int] NOT NULL FOREIGN KEY REFERENCES dimAccount(AID),
	[transaction_type] [nvarchar](2) NOT NULL,
	[TimeID] [int] NOT NULL FOREIGN KEY REFERENCES dimTime(seconds),
	[DateID] [int] NOT NULL FOREIGN KEY REFERENCES dimDate(DateID),
	[balance] [float],
	[signed_amount] [float],
	[unsigned_amount] [float],
	PRIMARY KEY(AID,other_account_AID,transaction_type,TimeID,DateID)
);