#drop schema escola;
#create schema escola;
use Escola;

	#	Criando tabelas
  
  
CREATE TABLE IF NOT EXISTS Cidade(
	codigo integer not null,
    nome varchar(20) not null,
    primary key (codigo)
);



CREATE TABLE IF NOT EXISTS Escola(
	codigo integer not null,
    nome varchar(25) not null,
    codCidade integer not null,
    primary key ( codigo ),
	foreign key (codCidade) references Cidade(codigo)
);


CREATE TABLE IF NOT EXISTS Turma(
	codigo integer not null,
    nome varchar(20) not null,
    codEscola integer not null,
    primary key (codigo),
	foreign key (codEscola) references Escola(codigo)
);
    
    
CREATE TABLE IF NOT EXISTS Pessoa(
	codigo integer not null,
    nome varchar(20) not null,
    telefone varchar(14) not null,
    codCidade integer not null,
    codEscola integer not null,
    primary key (codigo),foreign key (codCidade) references Cidade (codigo),
    foreign key (codEscola) references Escola (codigo)
    );


CREATE TABLE IF NOT EXISTS Aluno(
	codigo integer not null,
    matricula varchar(12) not null,
    dataNasc varchar(10) not null,
    codTurma integer not null,
    primary key (codigo),
    foreign key (codigo) references Pessoa(codigo),
    foreign key (codTurma) references Turma(codigo)
);


CREATE TABLE IF NOT EXISTS Contato(
	nome varchar(20) not null,
    telefone varchar(14) not null,
    codAluno integer not null,
    codEscola integer not null,
    primary key (nome, codAluno, codEscola),
    foreign key (codAluno) references Aluno(codigo),
    foreign key (codEscola) references Pessoa(codEscola)
);


CREATE TABLE IF NOT EXISTS Professor(
	codigo integer not null,
    RG varchar(15) not null,
    CPF varchar(15) not null,
    titulo varchar(20) not null,
    isDiretor boolean not null,
    primary key (codigo),
    foreign key (codigo) references Pessoa(codigo)
);
    
    
CREATE TABLE IF NOT EXISTS Disciplina (
	codigo integer not null,
    nome varchar(20) not null,
    primary key (codigo)
);


CREATE TABLE IF NOT EXISTS Ministra(
	codProf integer AUTO_INCREMENT,
    codDisc integer not null,
    codTurma integer not null,
    codEsc integer not null,
    primary key (codProf, codDisc, codTurma, codEsc) ,
    
    CONSTRAINT fk_ministra_codDisc 
		foreign key (codDisc) 
		references Disciplina(codigo)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
     
     CONSTRAINT fk_ministra_codTurma 
		foreign key (codTurma) 
		references Turma(codigo)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    
	CONSTRAINT fk_ministra_codEsc
		foreign key (codEsc)
		references Escola(codigo)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_ministra_codProf 
		foreign key (codProf) 
		references Professor(codigo)	
        ON DELETE CASCADE
        ON UPDATE CASCADE
		
);


CREATE TABLE IF NOT EXISTS Direcao
(
		codEsc	integer not null,
   codProf integer not null,
		primary key (codEsc, codProf),    

   CONSTRAINT fk_direcao_codEsc
		foreign key (codEsc) references Escola(codigo)
        ON DELETE CASCADE
        ON UPDATE CASCADE					,
        
   CONSTRAINT fk_direcao_codProf
		foreign key (codProf) references Professor(codigo)
        ON DELETE CASCADE
        ON UPDATE CASCADE		
);






