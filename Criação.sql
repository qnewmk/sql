CREATE DATABASE Locacao;
GO

USE Locacao;
GO

CREATE SCHEMA Aluguel;

CREATE TABLE Aluguel.CLIENTE(
	CodigoCliente INT IDENTITY, 
	CPF INT NOT NULL,
	NumeroRG INT NOT NULL,
	UfRG CHAR (2) NOT NULL,
	Nome VARCHAR (255) NOT NULL,
	DataNasc DATE NOT NULL,
	Email VARCHAR (100) NOT NULL,
	NumeroCNH BIGINT NOT NULL,
	CONSTRAINT pkCliente PRIMARY KEY (CodigoCliente),
	CONSTRAINT uqClienteCPF UNIQUE (CPF),
	CONSTRAINT uqClienteRg UNIQUE (NumeroRG,UfRG),
	CONSTRAINT uqClienteCnh UNIQUE (NumeroCNH)
):

CREATE TABLE Aluguel.TIPO_VEICULO(
	CodigoTipoVeiculo TINYINT IDENTITY(0,5)
	Descricao VARCHAR (75) NOT NULL,
	CONSTRAINT pkTipoVeiculo PRIMARY KEY (CodigoTipoVeiculo),
);

CREATE TABLE Aluguel.VEICULO (
	Placa CHAR (7) NOT NULL,
	NumChassi VARCHAR (50) NOT NULL,
	Ano SMALLINT NOT NULL,
	Km INT NOT NULL,
	DataAquisicao DATE  NOT NULL,
	CodigoTipoVeiculo  TINYINT,
	CONSTRAINT pkVeiculo PRIMATY KEY (Placa),
	CONSTRAINT uqVeiculoChassi UNIQUE (NumChassi),
	CONSTRAINT fkVeiculoTipo FOREIGN KEY (CodigoTipoVeiculo) 
	REFERENCES Aluguel.TIPO_VEICULO (CodigoTipoVeiculo)
);

CREATE TABLE Alugel.ALUGA(
	CodigoCliente INT NOT NULL,
	Placa CHAR(7) NOT NULL,
	DataInicio DATE NOT NULL,
	DataFim DATE NOT NULL, 
	KmInicio INT NOT NULL,
	KmFim INT,
	CONSTRAINT pkAluga PRIMARY KEY (CodigoCliente,Placa),
	CONSTRAINT fkClienteAluga FOREIGN KEY (CodigoCliente)
	REFERENCES Aluguel.CLIENTE (CodigoCliente),
	CONSTRAINT fkAlugaVeiculo FOREIGN KEY (Placa) 
	REFERENCES Aluguel.VEICULO (Placa)
);