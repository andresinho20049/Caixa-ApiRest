Use Fluxo_Caixa
Go

CREATE TABLE Folha (
	Pk int identity not null,
	Comp date noy null,
	Constraint Pk_Folha Primary Key(Pk),
	Constraint UQ_Comp Unique(Comp)
)

CREATE TABLE Custo (
	Pk int identity not null,
	Dt_cadastro date not null,
	Pg_Previsto date not null,
	Constraint Pk_Custo Primary Key(Pk)
)

CREATE TABLE Despesa (
	Pk int identity not null,
	Fk_Fluxo_Caixa int not null,
	Fk_Custo int,
	Constraint Pk_Despesa Primary Key(Pk),
	Constraint Fk_Despesa_Fluxo_Caixa FOREIGN KEY(Fk_Fluxo_Caixa) REFERENCES Fluxo_Caixa (Pk),
	Constraint Fk_Despesa_Custo FOREIGN KEY(Fk_Custo) REFERENCES Custo (Pk)
)

CREATE TABLE Tipo_Fluxo_Caixa (
	Pk int identity not null,
	Nome varchar(7),
	Constraint Pk_Tipo_Fluxo_Caixa Primary Key(Pk),
	Constraint UQ_Nome_Tipo_Fluxo_Caixa Unique(Nome)
)

CREATE TABLE Servico_Cliente (
	Pk int identity not null,
	Valor numeric(10,2) not null,
	Descricao varchar(100) not null,
	Comp date not null,
	Fk_Renda int not null,
	Fk_Cliente int not null,
	Constraint Pk_Servico_Cliente Primary Key(Pk),
	Constraint Fk_Servico_Cliente_Renda FOREIGN KEY(Fk_Renda) REFERENCES Renda (Pk),
	Constraint Fk_Servico_Cliente_Cliente FOREIGN KEY(Fk_Cliente) REFERENCES Cliente (Pk)
	
)

CREATE TABLE Cliente (
	Pk int identity not null,
	CNPJ varchar(14) not null,
	Logradouro varchar(100) not null,
	Numero int not null,
	Bairro varchar(100) not null,
	Cidade varchar(100) not null,
	UF char(2) not null,
	Cep Varchar(9) not null,
	Complemento varchar(50) null,
	Nome varchar(150) not null,
	Obra varchar(100) not null,
	Constraint Pk_Cliente Primary Key(Pk),
	Constraint UQ_CNPJ_Cliente Unique(CNPJ)
)

CREATE TABLE Tipo_Credito (
	Pk int identity not null,
	Nome varchar(50) not null,
	Constraint Pk_Tipo_Cliente Primary Key(Pk),
	Constraint UQ_Nome_Tipo_Cliente Unique(Nome)
)

CREATE TABLE Credito (
	Pk int identity not null,
	Descricao varchar(100) not null,
	Comp date not null,
	Valor numeric(10,2) not null,
	Fk_Renda int not null,
	Fk_Tipo int not null,
	Constraint Pk_Credito Primary Key(Pk),
	Constraint Fk_Credito_Renda FOREIGN KEY(Fk_Renda) REFERENCES Renda (Pk),
	Constraint Fk_Credito_Tipo FOREIGN KEY(Fk_Tipo) REFERENCES Tipo_Credito (Pk)
)

CREATE TABLE Renda (
	Pk int identity not null,
	Dt_Cadastro date not null,
	Pg_Previsto date not null,
	Constraint Pk_Renda Primary KEY(Pk)
)

CREATE TABLE Fluxo_Caixa (
	Pk int identity not null,
	Data date not null,
	Valor numeric(10,2) not null,
	Fk_Tipo int not null,
	Constraint Pk_Fluxo_Caixa Primary Key(Pk),
	Constraint Fk_Fluxo_Caixa_Tipo FOREIGN KEY(Fk_Tipo) REFERENCES Tipo_Fluxo_Caixa (Pk)
)

CREATE TABLE Debitos (
	Pk int identity not null,
	Descricao varchar(100) not null,
	Valor numeric(10,2) not null,
	Comp date not null,
	Fk_Custo int not null,
	Fk_Tipo int not null,
	Constraint Pk_Debitos Primary Key(Pk),
	Constraint Fk_Debitos_Custo FOREIGN KEY(Fk_Custo) REFERENCES Custo (Pk),
	Constraint Fk_Debitos_Tipo FOREIGN KEY(Fk_Tipo) REFERENCES Tipo_Debito (Pk)
)

CREATE TABLE Tipo_Debito (
	Pk int identity not null,
	Nome varchar(50) not null,
	Constraint Pk_Tipo_Debito Primary Key(Pk),
	Constraint UQ_Nome_Tipo_Debito Unique(Nome)
)

CREATE TABLE Fornecedor (
	Pk int identity not null,
	CNPJ varchar(14) not null,
	Complemento varchar(50) null,
	Cep Varchar(9) not null,
	UF char(2) not null,
	Cidade varchar(100) not null,
	Bairro varchar(100) not null,
	Numero int not null,
	Logradouro varchar(100) not null,
	Nome Varchar(150) not null,
	Constraint Pk_Fornecedor Primary Key(Pk)
)

CREATE TABLE Func_Folha (
	Pk int identity not null,
	Salario numeric(10,2) not null,
	Holerite numeric(10,2) not null,
	Desconto numeric(10,2) not null,
	Transporte numeric(10,2) not null,
	Vale numeric(10,2) not null,
	Fk_Custo int not null,
	Fk_Func int not null,
	FK_Folha int not null,
	Constraint Pk_Func_Folha Primary Key(Pk),
	Constraint Fk_Func_Folha_Custo FOREIGN KEY(Fk_Custo) REFERENCES Custo (Pk),
	Constraint Fk_Func_Folha_Func FOREIGN KEY(Fk_Func) REFERENCES Funcionario (Pk),
	Constraint Fk_Func_Folha_Folha FOREIGN KEY(FK_Folha) REFERENCES Folha (Pk)
)

CREATE TABLE Funcionario (
	Pk int identity not null,
	Admissao date not null Default Getdate(),
	Demissao date null,
	Fk_Pessoa int not null,
	Fk_Funcao int not null,
	Constraint Pk_Funcionario Primary Key(Pk),
	Constraint Fk_Funcionario_Pessoa FOREIGN KEY(Fk_Pessoa) REFERENCES Pessoa (Pk),
	Constraint Fk_Funcionario_Funcao FOREIGN KEY(Fk_Funcao) REFERENCES Funcao (Pk)
)

CREATE TABLE Funcao (
	Pk int identity not null,
	Nome Varchar(50)
	Constraint Pk_Funcao Primary Key(Pk),
	Constraint UQ_Nome_Funcao Unique(Nome)
)

CREATE TABLE Pessoa (
	Pk int identity not null,
	Complemento varchar(50) null,
	UF char(2) not null,
	Cep varchar(9) not null,
	Cidade varchar(50) not null,
	Bairro Varchar(50) not null,
	Numero int not null,
	Logradouro varchar(100) not null,
	Funcao varchar(50) not null,
	Nome Varchar(150) not null,
	DataNasc date not null,
	Sexo char(1) not null,
	Constraint Pk_Pessoa Primary Key(Pk),
	Constraint UQ_Nome_Pessoa Unique(Nome),
	Constraint Check_Sexo_Pessoa Check(Sexo IN ('F','M'))
)

CREATE TABLE Servico_Fornecedor (
	Pk int identity not null,
	Comp date not null,
	Valor numeric(10,2) not null,
	Descricao varchar(100) not null,
	Fk_Custo int not null,
	Fk_Fornecedor int not null,
	Constraint Pk_Servico_Fornecedor Primary Key(Pk),
	Constraint Fk_Servico_Fornecedor_Custo FOREIGN KEY(Fk_Custo) REFERENCES Custo (Pk),
	Constraint Fk_Servico_Fornecedor_Fornecedor FOREIGN KEY(Fk_Fornecedor) REFERENCES Fornecedor (Pk)
)

CREATE TABLE Telefone_Fornecedor (
	Pk int identity not null,
	Telefone int not null,
	Fk_Fornecedor int not null,
	Constraint Pk_Telefone_Fornecedor Primary Key(Pk),
	Constraint Fk_Telefone_Fornecedor_Fornecedor FOREIGN KEY(Fk_Fornecedor) REFERENCES Fornecedor (Pk)
)

CREATE TABLE Telefone_Pessoa (
	Pk int identity not null,
	Telefone int not null,
	Fk_Pessoa int not null,
	Constraint Pk_Telefone_Pessoa Primary Key(Pk),
	Constraint Fk_Telefone_Pessoa_Pessoa FOREIGN KEY(Fk_Pessoa) REFERENCES Pessoa (Pk)
)

CREATE TABLE Telefone_Cliente (
	Pk int identity not null,
	Telefone int not null,
	Fk_Cliente int not null,
	Constraint Pk_Telefone_Cliente Primary Key(Pk),
	Constraint Fk_Telefone_Cliente_Cliente FOREIGN KEY(Fk_Cliente) REFERENCES Cliente (Pk)
)

CREATE TABLE Receita (
	Pk int identity not null,
	Fk_Fluxo_Caixa int,
	Fk_Renda int,
	Constraint Pk_Receita Primary Key(Pk),
	Constraint Fk_Receita_Fluxo_Caixa FOREIGN KEY(Fk_Fluxo_Caixa) REFERENCES Fluxo_Caixa (Pk),
	Constraint Fk_Receita_Renda FOREIGN KEY(Fk_Renda) REFERENCES Renda (Pk)
)
