use Escola;


	#		Alteracao 1)

#	 1.1)	Altera todos os contatos de aluno com codigo 7 ao aluno de codigo 5 :
UPDATE  contato 
SET 	codAluno = 5
WHERE 	codAluno = 7;

#	 1.EXTRA)	Reverte ao original :
UPDATE  contato 
SET 	codAluno = 7
WHERE 	codAluno = 5;

SELECT  * FROM 	contato ;



	#		Alteracao 2)
    
#	 2.1)	 Dropa FK restrita :
ALTER TABLE ministra 
DROP CONSTRAINT ministra_ibfk_1;

#	 2.2)	 Add FK em CASCATA
ALTER TABLE ministra 
ADD CONSTRAINT ministra_ibfk_1_Cascade
FOREIGN KEY (codProf) REFERENCES Professor(codigo)
ON DELETE CASCADE;

#	 2.3) 	Remoçao de Professor_Cod = 2, da Escola_Cod = 1 :
DELETE FROM Professor 
WHERE	codigo = 2;

#  	 2.4) 	Atribuir novo diretor Professor_Cod = 11 à Escola_Cod = 1 :
UPDATE  professor
SET		isDiretor = true
WHERE   codigo = 11 ;

#	 2.EXTRA)		Adicionar Professor_Cod = 2, na Escola_Cod = 1, mas sem ser Diretor :
/*
INSERT INTO professor (codigo, RG, CPF, titulo, isDiretor)
VALUES (2, "12345678-9", "xxxxxxxxx-x","Professor_Mestre", false);
*/

select * 
FROM 	professor AS prof, pessoa AS pes
WHERE 	prof.codigo = pes.codigo ;



	#	Alteracao 3)

/*	 3.1)	 Sai professora Bonanza(10), entra Duny(11),
			mantendo os dados antigos de Duny, ja que a mesma ministra disciplina(5) :	*/
UPDATE	 ministra
SET		 codProf = 11
WHERE	 codProf = 10 AND codDisc != 5 ;

/*	 3.2)	 Reverte substituição, retornando os antigos dados de Bonanza,
			ainda mantendo os dados antigos de Duny :	*/
UPDATE	 ministra
SET		 codProf = 10
WHERE	 codProf = 11 AND codDisc != 5;


SELECT	 *
FROM 	 pessoa AS pes, professor AS prof, ministra AS min
WHERE 	 pes.codigo = prof.codigo
AND		 pes.codEscola = min.codEsc
AND		 prof.codigo = min.codProf ;
