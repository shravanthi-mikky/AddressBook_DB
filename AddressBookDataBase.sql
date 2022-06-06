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

