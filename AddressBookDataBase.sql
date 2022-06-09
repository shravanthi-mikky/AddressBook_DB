create Database AddressBookService;
use AddressBookService;

--------uc2-Create Address Book Table----------

create table AddressBook (
ID int Primary Key Identity (1,1),
FirstName Varchar(100),
LastName Varchar(100),
Address Varchar(100),
City Varchar(100),
State Varchar(100),
Zip int,
PhoneNumber Varchar(100),
Email_ID Varchar(100)
);

----------uc3-Insert new Contacts to Address Book----------------

Insert into AddressBook Values ('Shravanthi','Pabboji','ABC Colony','Old Alwal','Telangana',500010,'9000000001','shravanthi@gmail.com');
Insert into AddressBook Values ('Vishnu','Pabboji','ABC Colony','Old Alwal','Telangana',500010,'9000000002','Vishnu@gmail.com');
Insert into AddressBook Values ('Bhagya','Mallapuram','ABC Colony','Temple Alwal','Telangana',500010,'9000000003','Bhagya@gmail.com');
Insert into AddressBook Values ('Santosh','Mallapuram','ABC Colony','Temple Alwal','Telangana',500010,'9000000004','Santoo@gmail.com');
Insert into AddressBook Values ('Vihaan','Mallapuram','ABC Colony','Temple Alwal','Telangana',500010,'9000000005','Tippu@gmail.com');
Select * from AddressBook;

---------UC4 - Edit existing contact using name----------

update AddressBook set Address='XYZ Colony' where FirstName='Bhagya';
update AddressBook set Address='XYZ Colony' where FirstName='Santosh';
update AddressBook set Address='XYZ Colony' where FirstName='Vihaan';

---------UC5 - Delete Contact using name-----------
Insert into AddressBook Values ('abc','xyz','ABC Colony','Temple Alwal','Telangana',500010,'9000000005','abc@gmail.com');

Delete From AddressBook where FirstName = 'abc';

--------UC6 - Retrieve person or contact belonging to particular state or city-------------

Select * from AddressBook where City ='Temple Alwal' or State ='Telangana';
Select * from AddressBook where City ='Temple Alwal';
Select * from AddressBook where City ='Old Alwal';

-------UC7 - size of AddressBook using city or state----------

select count(City) from AddressBook;
select count(State) from AddressBook;

-------UC8 - Sort Contacts by name in alphabetical order-----

Select * from AddressBook order by FirstName ASC;
Select * from AddressBook order by FirstName DESC;
Select * from AddressBook where City = 'Old Alwal' order by LastName ASC;
Select * from AddressBook where City = 'Temple Alwal' order by LastName ASC;

-------UC9 - Add ContactType------------
Alter table AddressBook add ContactType varchar(100);
update AddressBook set ContactType='Friend' where LastName='Mallapuram';
update AddressBook set ContactType='Family' where LastName='Pabboji';
Select * from AddressBook;
 
--------UC10-get count by ContactType---------------------
select Count(ContactType) from AddressBook;

-------UC11 - add same person to frnd and family---------

Insert into AddressBook Values ('Sai','Pabboji','ABC Colony','Old Alwal','Telangana',500010,'9000000002','Sai@gmail.com','Family'),
('Sai','Pabboji','ABC Colony','Old Alwal','Telangana',500010,'9000000002','Sai@gmail.com','Friend');
Select * from AddressBook;

------UC12 - Creating table using Normalization and ER Diagram -------------

Create table Address_Book1(AddressBookId Int Identity(1,1) Primary Key,
						  AddressBookName varchar(100));
Create table PersonDetail1(   PersonId Int Identity(1,1) Primary Key,
							 AddressBookId Int Foreign Key References Address_Book1(AddressBookId),
							 FirstName varchar(50),
							 LastName varchar(50),
							 Address varchar(100),
							 City varchar(50),
							 State varchar(50),
							 Zip int,
							 PhoneNumber bigint,
							 Email_ID varchar(50)    );

CREATE table PersonTypes1(	 PersonTypeId Int Identity(1,1) Primary Key,
							 PersonType varchar(50), );

CREATE table PersonsDetail_Type1(PersonId Int Foreign Key References PersonDetail1(PersonId),
								PersonTypeId Int Foreign Key References PersonTypes1(PersonTypeId)  );

CREATE table Employee_Department1(PersonId Int Foreign Key References PersonDetail1(PersonId),
								EmployeeID Int  ,
								DepartmentID int,);
				
select *from Address_Book1;
select *from PersonDetail1;
select *from PersonTypes1;
select *from PersonsDetail_Type1;
select *from Employee_Department1;

INSERT INTO Address_Book1(AddressBookName) Values('Home'),('school'),('college'),(' office');
select *from Address_Book1;

---------Inserting values into persontype--------------
INSERT INTO PersonTypes1(PersonType) VALUES('Family'),('schoolFriend'),('Friend'),('Colleague');
select *from PersonTypes1;

-----------Insert values in person detail table-------------
Insert INTO PersonDetail1 VALUES(1,'Bhagya','Pabboji','ABC Colony','Old Alwal','Telangana',456378,9000000001,'bhagya@gmail.com'),
								(2,'Shravanthi','Pabboji','ABC Colony','Old Alwal','Telangana',543216,9000000002,'shravanthi@gmail.com'),
								(3,'Vishnu','Nali','XYZ Colony','Kanuru','Andhra pradesh',654321,9000000003,'vishnu@gamil.com'),
								(4,'Sai','abc','PQR Colony','secunderabad','Telanagana',765432,9000000004,'Sai@gmail.com');
select *from PersonDetail1;
-----------Insert values in person detail type-------------
INSERT INTO PersonsDetail_Type1(PersonId,PersonTypeId) VALUES(1,1),(2,3),(3,4),(4,2);
select *from PersonsDetail_Type1;

-----------Insert values in Employee_Department1 table-------------
INSERT INTO Employee_Department1 VALUES(1,123,818),(2,456,19112),(3,789,4512),(4,244,161815)

select *from Employee_Department1;

-----------UC6-Retrieve Person belonging to city Or State-------------- -----------
SELECT addressbook.AddressBookId,addressbook.AddressBookName,persondetail.PersonId,persondetail.FirstName,persondetail.LastName,persondetail.Address,persondetail.City,persondetail.State,persondetail.Zip,
persondetail.PhoneNumber,persondetail.Email_ID,persontype.PersonType,persontype.PersonTypeId FROM
Address_Book1 AS addressbook 
INNER JOIN PersonDetail1 AS persondetail ON addressbook.AddressBookId = persondetail.AddressBookId AND (persondetail.City='kanuru' OR persondetail.State='Andhra Pradesh')
INNER JOIN PersonsDetail_Type1 as persontypedetail On persontypedetail.PersonId = persondetail.PersonId
INNER JOIN PersonTypes1 AS persontype ON persontype.PersonTypeId = persontypedetail.PersonTypeId;

----------UC7-understand Size of AddressBook by city and state---------
Select Count(*) As Count,State from PersonDetail1 Group By State;
Select Count(*) As Count,City from PersonDetail1 Group By City;

select count(City) from PersonDetail1;
select count(State) from PersonDetail1;

----------------UC8-Retrieve entries sorted alphabetically by person name---------------
SELECT addressbook.AddressBookId,addressbook.AddressBookName,persondetail.PersonId,persondetail.FirstName,persondetail.LastName,persondetail.Address,persondetail.City,persondetail.State,persondetail.Zip,
persondetail.PhoneNumber,persondetail.Email_Id,pt.PersonType,pt.PersonTypeId FROM
Address_Book1 AS addressbook 
INNER JOIN PersonDetail1 AS persondetail ON addressbook.AddressBookId = persondetail.AddressBookId 
INNER JOIN PersonsDetail_Type1 as ptm On ptm.PersonId = persondetail.PersonId
INNER JOIN PersonTypes1 AS pt ON pt.PersonTypeId = ptm.PersonTypeId Order By FirstName;

---------------UC_9_Retreive Number Of Persons Records Based On Person Types---------------
Select Count(a.PersonTypeId) As PersonCount,b.PersonType From 
PersonsDetail_Type1 As a 
INNER JOIN PersonTypes1 AS b ON b.PersonTypeId = a.PersonTypeId
INNER JOIN PersonDetail1 AS c ON c.PersonId = a.PersonId Group By a.PersonTypeId,b.PersonType;

---------------UC_10_Retreive Number Of Persons Records Based On AddressBook Names----------
Select Count(a.AddressBookId) As AddressBookCount,a.AddressBookName From 
Address_Book1 As a 
INNER JOIN PersonDetail1 AS pd ON pd.AddressBookId = a.AddressBookId Group By a.AddressBookName,pd.AddressBookId;