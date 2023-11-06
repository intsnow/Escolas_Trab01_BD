use escola;


 	#	Inserindo Valores e Atualizando tabelas
    
    
INSERT INTO cidade (codigo, nome)
VALUES (21, "Rio de Janeiro");
INSERT INTO cidade (codigo, nome)
VALUES (31, "Minas Gerais");
INSERT INTO cidade (codigo, nome)
VALUES (29, "Bahia");
INSERT INTO cidade (codigo, nome)
VALUES (13, "Amazonas");
INSERT INTO cidade (codigo, nome)
VALUES (27, "Espirito Santo");


INSERT INTO escola (codigo, nome, codCidade)
VALUES(1, "Escola_1", 21);
INSERT INTO escola (codigo, nome, codCidade)
VALUES (2, "Escola_2", 31);


INSERT INTO pessoa (codigo, nome, telefone, codCidade, codEscola)
VALUES (1, "Neves", "21 98285-1405", 21, 1);
INSERT INTO pessoa (codigo, nome, telefone, codCidade, codEscola)
VALUES (2, "Marcio", "xxxx-xxxx", 21, 1);
INSERT INTO pessoa (codigo, nome, telefone, codCidade, codEscola)
VALUES (3, "Alex Souza", "21 yyyy-yyyy", 21, 2);
INSERT INTO pessoa (codigo, nome, telefone, codCidade, codEscola)
VALUES (4, "Otaviana Souza", "2156-66-6", 31, 2);
INSERT INTO pessoa (codigo, nome, telefone, codCidade, codEscola)
VALUES (5, "Chris Silva ", "3436-22-6", 21, 1);
INSERT INTO pessoa (codigo, nome, telefone, codCidade, codEscola)
VALUES (6, "Erick Barbosa ", "21 91234-3212", 21, 1);
INSERT INTO pessoa (codigo, nome, telefone, codCidade, codEscola)
VALUES (7, "En ", "21 92321-2132", 27, 1);
INSERT INTO pessoa (codigo, nome, telefone, codCidade, codEscola)
VALUES (8, "Fer ", "21 92321-2121", 27, 1);
INSERT INTO pessoa (codigo, nome, telefone, codCidade, codEscola)
VALUES (9, "Meira ", "21 92321-2100", 27, 1);
INSERT INTO pessoa (codigo, nome, telefone, codCidade, codEscola)
VALUES (10, "Bonanza Nascimento ", "21 92321-2100", 27, 1);
INSERT INTO pessoa (codigo, nome, telefone, codCidade, codEscola)
VALUES (11, "Duny Massafera ", "21 93298-0198", 31, 1);
INSERT INTO pessoa (codigo, nome, telefone, codCidade, codEscola)
VALUES (12, "Iza Adidas ", "27 98655-8789", 27, 1);
INSERT INTO pessoa (codigo, nome, telefone, codCidade, codEscola)
VALUES (13, "Larissa ", "13 98642- 8721", 27, 2);
INSERT INTO pessoa (codigo, nome, telefone, codCidade, codEscola)
VALUES (14, "Ferrnando ", "27 98325- 2145", 27, 1);
INSERT INTO pessoa (codigo, nome, telefone, codCidade, codEscola)
VALUES (15, "Amanda ", "27 94369- 9723", 27, 1);
INSERT INTO pessoa (codigo, nome, telefone, codCidade, codEscola)
VALUES (16, "Emanuel ", "21 94532- 4321", 21, 2);

 
INSERT INTO professor (codigo, RG, CPF, titulo, isDiretor)
VALUES (2, "12345678-9", "xxxxxxxxx-x","Professor_Mestre", true);
INSERT INTO professor (codigo, RG, CPF, titulo, isDiretor)
VALUES (3, "66.666.666-6", "666.666.666-6","Doutor", true);
INSERT INTO professor (codigo, RG, CPF, titulo, isDiretor)
VALUES (10, "65.987.352-8", "987.654.321-9","Professor", false);
INSERT INTO professor (codigo, RG, CPF, titulo, isDiretor)
VALUES (11, "34.526.914-5", "645.327.185-6","Professor", false);
INSERT INTO professor (codigo, RG, CPF, titulo, isDiretor)
VALUES (13, "57.845.241-5", "451.441.254-6","Professor", false);
INSERT INTO professor (codigo, RG, CPF, titulo, isDiretor)
VALUES (14, "32.423.213-8", "443.211.564-4","Doutor", false);
INSERT INTO professor (codigo, RG, CPF, titulo, isDiretor)
VALUES (15, "23.354.751-5", "423.321.874-2","Professor", false);
INSERT INTO professor (codigo, RG, CPF, titulo, isDiretor)
VALUES (16, "54.124.325-2", "431.546.687-3","Professor", false);



INSERT INTO disciplina (codigo, nome)
VALUES (1, "Portugues");
INSERT INTO disciplina (codigo, nome)
VALUES (2, "Matematica");
INSERT INTO disciplina (codigo, nome)
VALUES (3, "Geografia");
INSERT INTO disciplina (codigo, nome)
VALUES (4, "Historia");
INSERT INTO disciplina (codigo, nome)
VALUES (5, "Ingles");


INSERT INTO turma (codigo, nome,codEscola)
VALUES (101, "turma_101", 1);
INSERT INTO turma (codigo, nome,codEscola)
VALUES (102, "turma_102", 1);
INSERT INTO turma (codigo, nome,codEscola)
VALUES (103, "turma_103", 1);
INSERT INTO turma (codigo, nome,codEscola)
VALUES (104, "turma_104", 1);
INSERT INTO Turma (codigo, nome, codEscola)
VALUES (606, "turma_606", 2);
INSERT INTO Turma (codigo, nome, codEscola)
VALUES (601, "turma_601", 2);


INSERT INTO ministra (codProf, codDisc, codTurma, codEsc)
VALUES (2, 1,  101, 1);
INSERT INTO ministra (codProf, codDisc, codTurma, codEsc)
VALUES (2, 5,  102, 1); 
INSERT INTO ministra (codProf, codDisc, codTurma, codEsc)
VALUES (2, 1,  103, 1); 
INSERT INTO ministra (codProf, codDisc, codTurma, codEsc)
VALUES (3, 5, 606, 2);
INSERT INTO ministra (codProf, codDisc, codTurma, codEsc)
VALUES (10, 4, 101, 1);
INSERT INTO ministra (codProf, codDisc, codTurma, codEsc)
VALUES (10, 4, 102, 1);
INSERT INTO ministra (codProf, codDisc, codTurma, codEsc)
VALUES (10, 1, 103, 1);
INSERT INTO ministra (codProf, codDisc, codTurma, codEsc)
VALUES (10, 3, 103, 1);
INSERT INTO ministra (codProf, codDisc, codTurma, codEsc)
VALUES (10, 4, 103, 1);
INSERT INTO ministra (codProf, codDisc, codTurma, codEsc)
VALUES (11, 1, 103, 1);
INSERT INTO ministra (codProf, codDisc, codTurma, codEsc)
VALUES (11, 5, 103, 1);
INSERT INTO ministra (codProf, codDisc, codTurma, codEsc)
VALUES (13, 4, 601, 2);
INSERT INTO ministra (codProf, codDisc, codTurma, codEsc)
VALUES (14, 4, 103, 1);
INSERT INTO ministra (codProf, codDisc, codTurma, codEsc)
VALUES (15, 4, 101, 1);
INSERT INTO ministra (codProf, codDisc, codTurma, codEsc)
VALUES (16, 2, 601, 2);


INSERT INTO aluno (codigo, matricula, dataNasc, codTurma)
VALUES (1, 4807, "13/08/1998", 103);
INSERT INTO aluno (codigo, matricula, dataNasc, codTurma)
VALUES (4, 662, "25/01/1985", 606);
INSERT INTO aluno (codigo, matricula, dataNasc, codTurma)
VALUES (5, 5478, "20/03/1999", 103);
INSERT INTO aluno (codigo, matricula, dataNasc, codTurma)
VALUES (6, 34212, "12/04/2004", 101);
INSERT INTO aluno (codigo, matricula, dataNasc, codTurma)
VALUES (7, 0077, "16/06/2004", 103);
INSERT INTO aluno (codigo, matricula, dataNasc, codTurma)
VALUES (8, 0078, "16/06/2004", 103);
INSERT INTO aluno (codigo, matricula, dataNasc, codTurma)
VALUES (9, 0079, "16/06/2004", 103);
INSERT INTO aluno (codigo, matricula, dataNasc, codTurma)
VALUES (12, 0251, "10/08/1999", 103);


INSERT INTO contato (nome, telefone, codAluno, codEscola)
VALUES ("Solange", "YYYY-YYYY", 1, 1);
INSERT INTO contato (nome, telefone, codAluno, codEscola)
VALUES ("Rosangela", "5482-6618-6", 4, 2);
INSERT INTO contato (nome, telefone, codAluno, codEscola)
VALUES ("Otaviano", "27 93241-4356", 7, 1);
INSERT INTO contato (nome, telefone, codAluno, codEscola)
VALUES ("Otaviano", "27 93241-4356", 8, 1);
INSERT INTO contato (nome, telefone, codAluno, codEscola)
VALUES ("Otaviano", "27 93241-4356", 9, 1);
INSERT INTO contato (nome, telefone, codAluno, codEscola)
VALUES ("Luiza", "27 95472-3251", 7, 1);
INSERT INTO contato (nome, telefone, codAluno, codEscola)
VALUES ("Luiza", "27 95472-3251", 8, 1);
INSERT INTO contato (nome, telefone, codAluno, codEscola)
VALUES ("Luiza", "27 95472-3251", 9, 1);
