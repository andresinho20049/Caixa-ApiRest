USE master

CREATE DATABASE Fluxo_Caixa
ON PRIMARY
(
NAME = ' Locadora',
FILENAME = 'C:BancoDados LocadoraDB.mdf',
SIZE = 10 MB,
MAXSIZE = 2 GB,
FILEGROWTH = 5 MB
)
LOG ON
(
NAME = 'LocadoraLog',
FILENAME = 'C:BancoDados LocadoraDBlog.ldf',
SIZE = 2MB,
MAXSIZE = 100MB,
FILEGROWTH = 1MB
);