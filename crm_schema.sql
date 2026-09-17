BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS Activities (
    ID INTEGER PRIMARY KEY,
    deal_id INTEGER,
    Type TEXT,
    Date TEXT,
    FOREIGN KEY (deal_id) REFERENCES Deals(ID)
);
CREATE TABLE IF NOT EXISTS Companies (
    ID INTEGER PRIMARY KEY,
    Name TEXT,
    Industry TEXT,
    Location TEXT
);
CREATE TABLE IF NOT EXISTS Contacts (
    ID INTEGER PRIMARY KEY,
    Name TEXT,
    Email TEXT,
    Company_id INTEGER,
    Title TEXT,
    FOREIGN KEY (Company_id) REFERENCES Companies(ID)
);
CREATE TABLE IF NOT EXISTS Deals (
    ID INTEGER PRIMARY KEY,
    Name TEXT,
    Contact_id INTEGER,
    Stage TEXT,
    Value INTEGER,
    FOREIGN KEY (Contact_id) REFERENCES Contacts(ID)
);
INSERT INTO "Activities" ("ID","deal_id","Type","Date") VALUES (1,1,'Call','2026-06-23');
INSERT INTO "Activities" ("ID","deal_id","Type","Date") VALUES (2,3,'Email','2026-05-24');
INSERT INTO "Activities" ("ID","deal_id","Type","Date") VALUES (3,5,'In Person Meeting','2025-12-20');
INSERT INTO "Activities" ("ID","deal_id","Type","Date") VALUES (4,1,'Email','2026-01-04');
INSERT INTO "Activities" ("ID","deal_id","Type","Date") VALUES (5,3,'In Person Meeting','2026-03-24');
INSERT INTO "Activities" ("ID","deal_id","Type","Date") VALUES (6,2,'Call','2026-05-13');
INSERT INTO "Activities" ("ID","deal_id","Type","Date") VALUES (7,6,'Virtual Meeting','2026-04-13');
INSERT INTO "Companies" ("ID","Name","Industry","Location") VALUES (1,'NVIDIA','Tech','San Francisco, CA');
INSERT INTO "Companies" ("ID","Name","Industry","Location") VALUES (2,'Google','Tech','Chicago, IL');
INSERT INTO "Companies" ("ID","Name","Industry","Location") VALUES (3,'Kraft Heinz','CPG','Chicago, IL');
INSERT INTO "Companies" ("ID","Name","Industry","Location") VALUES (4,'Anduril','Defense','San Diego, CA');
INSERT INTO "Companies" ("ID","Name","Industry","Location") VALUES (5,'Boeing','Aviation','Chicago, IL');
INSERT INTO "Companies" ("ID","Name","Industry","Location") VALUES (6,'Uber','Tech','San Francisco, CA');
INSERT INTO "Companies" ("ID","Name","Industry","Location") VALUES (7,'Apple','Tech','San Francisco, CA');
INSERT INTO "Companies" ("ID","Name","Industry","Location") VALUES (8,'Culver''s','Food','Milwuakee, WI');
INSERT INTO "Companies" ("ID","Name","Industry","Location") VALUES (9,'J.P Morgan','Banking','New York City, NY');
INSERT INTO "Companies" ("ID","Name","Industry","Location") VALUES (10,'Nordstrom','Retail','Seattle');
INSERT INTO "Contacts" ("ID","Name","Email","Company_id","Title") VALUES (1,'Chris Slant','cslant@boeing.com',5,'VP of FP&A');
INSERT INTO "Contacts" ("ID","Name","Email","Company_id","Title") VALUES (2,'Brock Hu','brockhu@google.com',2,'Design Lead (Maps)');
INSERT INTO "Contacts" ("ID","Name","Email","Company_id","Title") VALUES (3,'Slater Mars','smars1@nordstrom.com',10,'NA Director of Procurement');
INSERT INTO "Contacts" ("ID","Name","Email","Company_id","Title") VALUES (4,'Andrew Xi','ax11@uber.com',6,'Senior SWE');
INSERT INTO "Contacts" ("ID","Name","Email","Company_id","Title") VALUES (5,'Blake Stone','blakestone@kh.com',3,'Director of Innovation');
INSERT INTO "Contacts" ("ID","Name","Email","Company_id","Title") VALUES (6,'Chris Loft','cloft@apple.com',7,'Product Design Head');
INSERT INTO "Contacts" ("ID","Name","Email","Company_id","Title") VALUES (7,'Miguel Hurts','miguelh130@culvers.com',8,'Regional Procurement Director');
INSERT INTO "Contacts" ("ID","Name","Email","Company_id","Title") VALUES (8,'Erin Scoles','escoles@jpmorgan.com',9,'Director of LATAM Emerging Markets');
INSERT INTO "Contacts" ("ID","Name","Email","Company_id","Title") VALUES (9,'Matt Plott','mattplott@google.com',2,'VP Supply Chain');
INSERT INTO "Contacts" ("ID","Name","Email","Company_id","Title") VALUES (10,'Mike Parks','mparks@boeing.com',5,'SVP Operations West Region');
INSERT INTO "Contacts" ("ID","Name","Email","Company_id","Title") VALUES (11,'Nick Stig','nickstig@nvidia.com',1,'Head of Consumer Relations');
INSERT INTO "Contacts" ("ID","Name","Email","Company_id","Title") VALUES (12,'Walter Forest','wf13@uber.com',6,'CISO');
INSERT INTO "Contacts" ("ID","Name","Email","Company_id","Title") VALUES (13,'Paul Trace','paultrace@nvidia.com',1,'VP ASEA Markets');
INSERT INTO "Contacts" ("ID","Name","Email","Company_id","Title") VALUES (14,'Christina Brewer','cbrewer@boeing.com',5,'General Counsel');
INSERT INTO "Contacts" ("ID","Name","Email","Company_id","Title") VALUES (15,'Matt Lore','mlore@jpmorgan.com',9,'CAO');
INSERT INTO "Contacts" ("ID","Name","Email","Company_id","Title") VALUES (16,'Pam Lott','paml332@culvers.com',8,'COO');
INSERT INTO "Contacts" ("ID","Name","Email","Company_id","Title") VALUES (17,'Brian Lanes','bl48@uber.com',6,'Head of Marketing');
INSERT INTO "Contacts" ("ID","Name","Email","Company_id","Title") VALUES (18,'Diego Orduno','diegoorduno@kh.com',3,'CSO');
INSERT INTO "Contacts" ("ID","Name","Email","Company_id","Title") VALUES (19,'Brady Faults','bradyfaults@anduril.com',4,'VP of Government Relations');
INSERT INTO "Contacts" ("ID","Name","Email","Company_id","Title") VALUES (20,'John Wallace','jwallace@jpmorgan.com',9,'MD Chicago Office');
INSERT INTO "Contacts" ("ID","Name","Email","Company_id","Title") VALUES (21,'Kevin Brand','kbrand9@nordstrom.com',10,'SVP Real Estate');
INSERT INTO "Contacts" ("ID","Name","Email","Company_id","Title") VALUES (22,'Mary West','mwest@nvidia.com',1,'VP Strategy & Innovation');
INSERT INTO "Deals" ("ID","Name","Contact_id","Stage","Value") VALUES (1,'Infra Q3',6,'Contract Sent',230000);
INSERT INTO "Deals" ("ID","Name","Contact_id","Stage","Value") VALUES (2,'Forward Deployed Team - Boeing',5,'Contact Made',600000);
INSERT INTO "Deals" ("ID","Name","Contact_id","Stage","Value") VALUES (3,'Software Distribution',3,'Closed Lost',150000);
INSERT INTO "Deals" ("ID","Name","Contact_id","Stage","Value") VALUES (4,'Infra Q2',2,'Closed Lost',750000);
INSERT INTO "Deals" ("ID","Name","Contact_id","Stage","Value") VALUES (5,'DB Sourcing',5,'Closed Won',2100000);
INSERT INTO "Deals" ("ID","Name","Contact_id","Stage","Value") VALUES (6,'Data Sharing Q1-Q3',7,'Contract Sent',75000);
INSERT INTO "Deals" ("ID","Name","Contact_id","Stage","Value") VALUES (7,'Forward Deployed Team - JP Morgan',9,'Contact Made',150000);
INSERT INTO "Deals" ("ID","Name","Contact_id","Stage","Value") VALUES (8,'Contract Renwal 2026',10,'Closed Won',550000);
COMMIT;
