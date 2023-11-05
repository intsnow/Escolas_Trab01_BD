#create schema escola;
use Escola;

	#	Criando tabelas
  
  
CREATE TABLE Cidade(
	codigo integer not null,
    nome varchar(20) not null,
    primary key (codigo)
);


CREATE TABLE Escola(
	codigo integer not null,
    nome varchar(25) not null,
    codCidade integer not null,
    primary key ( codigo ),
    foreign key (codCidade) references Cidade(codigo)
);


CREATE TABLE Turma(
	codigo integer not null,
    nome varchar(20) not null,
    codEscola integer not null,
    primary key (codigo),
    foreign key (codEscola) references Escola(codigo)
);
    
    
CREATE TABLE Pessoa(
	codigo integer not null,
    nome varchar(20) not null,
    telefone varchar(14) not null,
    codCidade integer not null,
    codEscola integer not null,
    primary key (codigo),
    foreign key (codCidade) references Cidade (codigo),
    foreign key (codEscola) references Escola (codigo)
);


CREATE TABLE Aluno(
	codigo integer not null,
    matricula varchar(12) not null,
    dataNasc varchar(10) not null,
    codTurma integer not null,
    primary key (codigo),
    foreign key (codigo) references Pessoa(codigo),
    foreign key (codTurma) references Turma(codigo)
);


CREATE TABLE Contato(
	nome varchar(20) not null,
    telefone varchar(14) not null,
    codAluno integer not null,
    codEscola integer not null,
    primary key (nome, codAluno, codEscola),
    foreign key (codAluno) references Aluno(codigo),
    foreign key (codEscola) references Pessoa(codEscola)
);


CREATE TABLE Professor(
	codigo integer not null,
    RG varchar(15) not null,
    CPF varchar(15) not null,
    titulo varchar(20) not null,
    isDiretor boolean not null,
    primary key (codigo),
    foreign key (codigo) references Pessoa(codigo)
);
    
    
CREATE TABLE Disciplina (
	codigo integer not null,
    nome varchar(20) not null,
    primary key (codigo)
);


CREATE TABLE Ministra(
	codProf integer not null,
    codDisc integer not null,
    codTurma integer not null,
    codEsc integer not null,
    primary key (codProf, codDisc, codTurma, codEsc),
    foreign key (codProf) references Professor(codigo),
    foreign key (codDisc) references Disciplina(codigo),
    foreign key (codTurma) references Turma(codigo),
    foreign key (codEsc) references Escola(codigo)
);
