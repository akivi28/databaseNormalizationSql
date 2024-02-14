use [master]
go 

create database [TravelAgencyV4]
go

use [TravelAgencyV4]
go

create table [Tourist]
(
	[Id] int not null identity(1, 1) primary key,
	[Name] nvarchar(max) not null check([Name]<>N''),
	[Surname] nvarchar(max) not null check([Surname]<>N''),
	[Age] int not null
);

create table [PhoneOfTourist]
(
	[Id] int not null identity(1, 1) primary key,
	[Number] nvarchar(max) not null check ([Number] <> N''),
	[TouristId] int not null
);
go

create table[TypeOfOvernightStay]
(
	[Id] int not null identity(1, 1) primary key,
	[Name] nvarchar(max) not null,
	[TouristId] int not null
);
go

create table [PhoneOfTourAgent]
(
	[Id] int not null identity(1, 1) primary key,
	[Number] nvarchar(max) not null check ([Number] <> N''),
	[TourAgentId] int not null
);
go

create table[TourAgent]
(
	[Id] int not null identity(1, 1) primary key,
	[Name] nvarchar(max) not null check([Name]<>N''),
	[Surname] nvarchar(max) not null check([Surname]<>N'')
);
go

create table[Tour]
(
	[Id] int not null identity(1, 1) primary key,
	[Name] nvarchar(max) not null,
	[StartDate] date not null,
	[EndDate] date not null,
	[Price] money not null check ([Price] > 0.0)
);
go

create table[TourForTourist]
(
	[Id] int not null identity(1, 1) primary key,
	[TouristId] int not null,
	[TourId] int not null
);
go

create table[Booking]
(
	[Id] int not null identity(1, 1) primary key,
	[TourForTouristId] int not null,
	[TypeOfOvernightStayId] int not null,
	[TourAgentId] int not null
);
go

alter table [PhoneOfTourist]
add foreign key ([TouristId]) references [Tourist]([Id]);
go

alter table [TypeOfOvernightStay]
add foreign key ([TouristId]) references [Tourist]([Id]);
go

alter table [PhoneOfTourAgent]
add foreign key ([TourAgentId]) references [TourAgent]([Id]);
go

alter table [TourForTourist]
add foreign key ([TouristId]) references [Tourist]([Id]);
go

alter table [TourForTourist]
add foreign key ([TourId]) references [Tour]([Id]);
go

alter table [Booking]
add foreign key ([TourForTouristId]) references [TourForTourist]([Id]);
go

alter table [Booking]
add foreign key ([TypeOfOvernightStayId]) references [TypeOfOvernightStay]([Id]);
go

alter table [Booking]
add foreign key ([TourAgentId]) references [TourAgent]([Id]);
go