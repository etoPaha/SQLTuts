-- ������ ���������� �����
-- �������:
-- ������� ������ ���������� � ������ ���������� �����
-- ������� ������ ����� ����
-- ��� ���������� ������� ������� ������ �������� �� ������� ����� (� ������ ���� �� ���������)

-----------------------------------
-- ������� ����� ��
USE master
GO

CREATE DATABASE infoCompTutsDB
GO

USE infoCompTutsDB
GO

----------------------------------
-- ������� ������� � ������ ���������� �����

DROP TABLE Employees
GO

CREATE TABLE Employees(
	FullName varchar(max)
	,Position varchar(max)
	,Department varchar(max)
	,DepartmentDescription varchar(max)
)
GO

INSERT Employees VALUES
('������ �.�.', '�����������', '����� ����������', '���������� � ������������� ���������� � ������')
,('������� �.�.', '���������', '�����������', '������� �������������� � ���������� ����� ���������-������������� ������������')
,('John Smith', '��������', '����� ����������', '����������� ����� ���������')
GO

SELECT * FROM Employees
GO

-- ������� � ������ ���������� �����
-- ��� ������������� �����
-- �������� ��������
-------------------------------------

-------------------------------------
-- ��� �������� �� ������ ����� ����� 
-- �������� ��������� ���� � �������

DROP TABLE Employees
GO

CREATE TABLE Employees(
	PersonnelNumber int NOT NULL
	,FullName varchar(max)
	,Position varchar(max)
	,Department varchar(max)
	,DepartmentDescription varchar(max)
	,CONSTRAINT PK_PersonnelNumber PRIMARY KEY CLUSTERED (PersonnelNumber)
)
GO

INSERT Employees VALUES
(1, '������ �.�.', '�����������', '����� ����������', '���������� � ������������� ���������� � ������')
,(2, '������� �.�.', '���������', '�����������', '������� �������������� � ���������� ����� ���������-������������� ������������')
,(3, 'John Smith', '��������', '����� ����������', '����������� ����� ���������')
GO

SELECT * FROM Employees
GO

-- ��� ��� ��������� ���� �� ���������, 
-- �� ������� ���������� ������������� ������ ���������� �����
-- ������ ������� ����� ������ ��� ���������� �����
------------------------------------------

------------------------------------------
-- ���������� �� ������ ���������� ����� ������� � ��������� ������
-- �������: ��� ���������� ������� ������� ������ �������� �� ������� ����� 
--(� ������ ���� �� ���������)

-- � ��� ���� ������� � ������ ���������� �����
CREATE TABLE Projects(
	ProjectName varchar(max)
	,Participant varchar(max)
	,Position varchar(max)
	,ProjectTermMonth int
)
GO

INSERT Projects VALUES
('��������� ����������', '������ �.�.', '�����������', 8)
,('��������� ����������', '������� �.�.', '���������', 8)
,('��������� ����������', 'John Smith', '��������', 8)
,('�������� ������ ��������', '������� �.�.', '���������', 12)
,('�������� ������ ��������', 'John Smith', '��������', 12)
GO

--------------------------------------------------------
-- ��� �������� �� ������ ���������� �����
-- ��������� � ������� �������� ���� 

DROP TABLE Projects
GO

CREATE TABLE Projects(
	ProjectName varchar(max) NOT NULL
	,Participant varchar(max) NOT NULL
	,Position varchar(max)
	,ProjectTermMonth int
	,CONSTRAINT PK_ProjectName_Participant PRIMARY KEY CLUSTERED (ProjectName, Participant)
)
GO

-- �� ���� �������� �� �������� ���� ��������� � ������ ������ ����������� �����
-- "���������" ��������� � "����������"
-- "���� ������� (���.)" ��������� � "�������"
-- ����� ������� ����� 2 ����� ����� ������� �� �� ��������� 
-- �������, ��������� � �� �����

DROP TABLE Projects

CREATE TABLE Projects(
	ID int IDENTITY(1,1) NOT NULL
	,[Name] varchar(max)
	,TermMonth int
	,CONSTRAINT PR_ID PRIMARY KEY CLUSTERED (ID)
)
GO

CREATE TABLE Particiants(
	ID int IDENTITY(1,1) NOT NULL
	,FullName varchar(max)
	,Position varchar(max)
	,CONSTRAINT PR_ID PRIMARY KEY CLUSTERED (ID)
)
GO

CREATE TABLE ParticipationInProjects(
	ProjectID int NOT NULL,
	ParticiantID int NOT NULL
)
GO

--INSERT Projects VALUES
--()
--GO

--INSERT Particiants VALUES
--()
--GO

--INSERT ParticipationInProjects VALUES
--()
--GO

--������������� �������	�������� �������	���� ������� (���.)
--1	��������� ����������	8
--2	�������� ������ ��������	12
--���������.

--������������� ���������	��������	���������
--1	������ �.�.	�����������
--2	������� �.�.	���������
--3	John Smith	��������
--����� �������� � ���������� ���� ��������.

--������������� �������	������������� ���������
--1	1
--1	2
--1	3
--2	2
--2	3


SELECT * FROM Projects
GO

SELECT * FROM Particiants
GO

SELECT * FROM ParticipationInProjects
GO