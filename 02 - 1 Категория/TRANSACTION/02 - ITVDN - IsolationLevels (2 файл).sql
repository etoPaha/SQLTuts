﻿create database tut_ITVDN_IsolationLevels
go

use tut_ITVDN_IsolationLevels
go

----------------------------------------------
-- Подготовка таблицы для примеров с уровнями изоляции

if exists(select 1 from sys.tables where object_id = OBJECT_ID('TestTable'))
	drop table TestTable
	

create table TestTable (
	[Id] int identity,
	[Value] int
)
go

insert into TestTable values
(1)
go

---------------------------------------------
-- 1. LOST UPDATE / ПОТЕРЯННОЕ ОБНОВЛЕНИЕ

-- Вторая транзакция, чтобы показать как работают уровни изоляции
-- Вторая транзакция будет ждать пока первая треназкция не завершится
-- Пример показывает, что в MS SQL решена проблема с потерянными обновлениями

begin tran 

update TestTable
set [Value] = [Value] + 10
where Id = 1;

select [Value]
from TestTable
where Id = 1;

commit tran;

-- Можно понизить уровень блокировки до минимального (по умолчанию read committed)
-- Но это транзакции так же ждут свой очереди

set transaction isolation level read uncommitted;

----------------------------------------------------------------
-- 2. DIRTY READ / ГРЯЗНОЕ ЧТЕНИЕ

-- Выполнение с уровнем изолированности по умолчанию (read committed)
-- Запрос не выполняется пока не будут помещены данные первой транзакцией

begin tran 

select [Value]
from TestTable
where Id = 1

commit tran

-- понижаем уровень изоляции

set transaction isolation level read uncommitted

-- снова считывает данные без ожидания
-- но они являются не верными так как данные в первой транзакции по итогу откатились

----------------------------------------------------------------
-- 3. NON-REPEATABLE READS / НЕ ПОВТОРЯЕМОЕ ЧТЕНИЕ

begin tran 

update TestTable
set [Value] = 100
where Id = 1

commit tran