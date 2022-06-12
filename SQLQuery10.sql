create Database Hospital_Management_dB





create table Doctor
(
doctorId varchar(30) primary key,
doctorName varchar(50) not null,
doctorDept varchar(50)
)

select * from Doctor
insert into Doctor values('D001','Laxman','Physician'),
('D002','Mohan','Laboratory')


















create table Patient
(
PatientId varchar(30)  primary key,
Name varchar(30)not null,
 Age int not null,
 Weight int ,
Gender varchar(10), 
Address varchar(30),
PhoneNo varchar (10),
Disease varchar(30) ,
DoctorId varchar(30) foreign key references Doctor(DoctorId)
)



select * from Patient

insert into Patient values('P001','Ravi',40,60,'M','Uppal Hyderabad','9987635565','asthma','D001')
insert into Patient values('P002','Sachith',44,62,'M','Srinagar Hyderabad','8967635565','Allergy','D001')
insert into Patient values('P003','Kavya',24,52,'F','Delhi','8967635567','Covid','D002')
insert into Patient values('P004','Sagnik',34,62,'M','Delhi NCR','8967675567','Stone','D002')
insert into Patient values('P005','Pankaj',36,68,'M','Kolkata','8937675567','Back Pain','D002')














create table Lab
(LabId varchar(30) primary key,
PId varchar(30) foreign key references Patient(PatientId),
DoctorId varchar(30) foreign key references Doctor(DoctorId),
TestDate date,
TestType varchar(300),
PatientType varchar(30)
)



select * from Lab

insert into Lab values('L001','P001','D001','2022-04-13','TUSG','Inpatient')

insert into Lab values('L002','P002','D001','2022-05-13','CT','Inpatient')

insert into Lab values('L003','P003','D002','2022-04-18','X-RAY','Outpatient')

insert into Lab values('L004','P004','D002','2022-05-13','Covid-TEST','Outpatient')

update Lab set PatientType='Inpatient' where LabId='L002';











create table RoomData
(RoomNo varchar(30) primary key,
TreatmentDate date,
DoctorId varchar(30) foreign key references Doctor(DoctorId),
LabNo varchar(30) foreign key references Lab(LabId))


select * from RoomData

insert into RoomData values('R001','2022-04-13','D001','L001')
insert into RoomData values('R002','2022-05-13','D001','L002')















create table BillData
(BillNo varchar(30) primary key,
PId varchar(30) foreign key references Patient(PatientId),
PatientType varchar(30),
DoctorId varchar(30) foreign key references Doctor(DoctorId),
DoctorFees int,
RoomCharge int,
OperationCharges int,
MedicineFees int,
TotalDays int,
LabFees int,
TotalAmount int)

select * from BillData

insert into BillData values ('B01','P001','Inpatient','D001',5000,1000,20000,30000,3,500,169500)
insert into BillData values ('B02','P002','Inpatient','D001',5000,1000,20000,30000,2,500,113000)
insert into BillData values ('B03','P003','Outpatient','D002',5000,0,0,3000,0,500,8500)
insert into BillData values ('B04','P004','Outpatient','D002',5000,0,0,2000,0,500,7500)












create table Inpatient
(InpId varchar(30) primary key,
PId varchar(30) foreign key references Patient(PatientId),
RoomNo varchar(30) foreign key references RoomData(RoomNo),
DoctorId varchar(30) foreign key references Doctor(DoctorId),
AdmissionDate date,
DischargeDate date,
LabNo varchar(30) foreign key references Lab(LabId),
AmountPerDay int)

select * from Inpatient
insert into Inpatient values('IN01','P001','R001','D001','2022-04-13','2022-04-16','L001',56500)
insert into Inpatient values('IN02','P002','R001','D001','2022-05-13','2022-05-15','L002',56500)

















create table Outpatient
(OutpId varchar(30) primary key,
PId varchar(30) foreign key references Patient(PatientId),
TreatmentDate date,
DoctorId varchar(30) foreign key references Doctor(DoctorId),
LabNo varchar(30) foreign key references Lab(LabId))

select * from Outpatient

insert into Outpatient values('OP01','P003','2022-04-18','D002','L001')
insert into Outpatient values('OP02','P004','2022-05-13','D002','L001')