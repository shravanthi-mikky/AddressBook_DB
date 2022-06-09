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

Create table Address_Book(AddressBookId Int Identity(1,1) Primary Key,
						  AddressBookName varchar(100));
Create table PersonDetail(   PersonId Int Identity(1,1) Primary Key,
							 AddressBookId Int Foreign Key References Address_Book(AddressBookId),
							 FirstName varchar(50),
							 LastName varchar(50),
							 Address varchar(100),
							 City varchar(50),
							 State varchar(50),
							 Zip int,
							 PhoneNumber bigint,
							 Email_ID varchar(50)    );

CREATE table PersonTypes(	 PersonTypeId Int Identity(1,1) Primary Key,
							 PersonType varchar(50), );

CREATE table PersonsDetail_Type(PersonId Int Foreign Key References PersonDetail(PersonId),
								PersonTypeId Int Foreign Key References PersonTypes(PersonTypeId)  );

CREATE table Employee_Department(PersonId Int Foreign Key References PersonDetail(PersonId),
								EmployeeID Int  ,
								DepartmentID int,);
				
select *from Address_Book;
select *from PersonDetail;
select *from PersonTypes;
select *from PersonsDetail_Type;
select *from Employee_Department;