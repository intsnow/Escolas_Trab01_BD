use Escola;


#			Consultando tabelas



#		Consulta 1)
SELECT    esc.nome AS nome_Escola, cid.nome AS Cidade_Escola #, pes.nome
FROM 	  escola AS esc, cidade AS cid, pessoa AS pes, aluno AS alu 
WHERE  	  esc.codCidade = cid.codigo
AND	 	  pes.codigo = alu.codigo  
AND  	  esc.codigo = pes.codEscola
AND 	  esc.codCidade = pes.codCidade
GROUP BY  esc.codigo, esc.nome;



 #		Consulta 2)
SELECT   pes.nome AS nome_Aluno, alu.matricula AS matri_Aluno, pes.codEscola AS cod_Escola
FROM 	 pessoa AS pes, aluno AS alu 
WHERE 	 pes.codigo = alu.codigo
AND 	 alu.codigo 
NOT IN 
(
	SELECT alu.codigo AS cod_Aluno
	FROM contato AS cont, aluno AS alu
	WHERE cont.codAluno = alu.codigo
);
			 
 
 
 #		Consulta 3)
 SELECT    t.codigo AS cod_Turma, t.nome AS nome_Turma, pes.codEscola AS cod_Escola
 FROM  	   turma AS t, aluno AS alu, pessoa AS pes
 WHERE	   t.codigo = alu.codTurma 
 AND	   t.codEscola = pes.codEscola
 AND	   alu.codigo = pes.codigo
 GROUP BY  t.codigo, t.nome, pes.codEscola
 HAVING	   count(t.codigo) > 5 ;
 
 
 
#		Consulta 4)
SELECT   		pes.codEscola AS cod_Escola, pes.nome AS nome_Prof, prof.codigo AS cod_Prof, prof.titulo AS Titulacao
FROM			ministra AS min  JOIN ( pessoa AS pes, professor AS prof )
ON				prof.codigo = pes.codigo  AND  min.codProf = pes.codigo
GROUP BY 		prof.codigo
HAVING 			count(DISTINCT min.codTurma) >= 3
ORDER BY 		pes.codEscola, pes.nome;
 
 

  #		Consulta 5)	CORRIGIDA!
SELECT 	  *
FROM 
(		#	Relaciona Num_Profs para cada disciplina POR TURMA

	SELECT	  esc.nome AS nome_Escola, disc.nome AS nome_Disciplina,
			  count(DISTINCT min.codProf) AS numProfs_Ministram_MesmaTurma, tur.nome AS nome_Turma  
	FROM 	  ( escola AS esc, professor AS prof ) 
	JOIN 	  (  disciplina AS disc, ministra AS min, turma AS tur )
	ON 		  esc.codigo = min.codEsc 		AND disc.codigo = min.codDisc
	AND 	  prof.codigo = min.codProf 	AND tur.codigo = min.codTurma
	GROUP BY  disc.nome, esc.nome, tur.nome 
	ORDER BY  esc.nome, disc.nome, tur.nome
)   AS f
JOIN
(		#	Relaciona Num_Profs_Totais de cada disciplina POR ESCOLA
	
	SELECT    esc.nome AS nome_Escola, disc.nome AS nome_Disciplina,
			  count(DISTINCT min.codProf ) AS numProfs_Total_porEscola
	FROM 	  ( escola AS esc, professor AS prof ) 
	JOIN 	  ( disciplina AS disc, ministra AS min )
	ON 		  esc.codigo = min.codEsc 		AND disc.codigo = min.codDisc
	AND 	  prof.codigo = min.codProf 	
	GROUP BY  disc.nome, esc.nome
	ORDER BY  esc.nome, disc.nome
) 	AS g
ON 		  f.nome_Escola = g.nome_Escola
AND 	  f.nome_Disciplina = g.nome_Disciplina
ORDER BY  f.nome_Escola, f.nome_Disciplina, nome_Turma;	

 
 
 #		Consulta 6)
SELECT 	  esc.nome AS nome_Escola, pes.nome AS nome_Diretor, pes.codCidade AS cod_Cid_Prof, esc.codCidade AS cod_Cid_Escola
FROM 	  escola AS esc, pessoa AS pes, professor AS prof
WHERE 	  esc.codigo = pes.codEscola
AND		  pes.codigo = prof.codigo
AND		  pes.codCidade != esc.codCidade
AND		  prof.isDiretor = true
ORDER BY  esc.nome ;


 
 #		Consulta 7)
 
	#		Lista Escolas e num_turmas de cada:
    
SELECT	  esc.nome AS nome_Escola, count(DISTINCT tur.codigo) AS num_Turmas, num_profs_ministra_disciplina
FROM 	  ( escola AS esc, turma AS tur )
JOIN
(	 #		Lista Escolas e num_prof que ministra_disciplina >= 1 
   	
	SELECT		esc.nome AS nome_Escola, count(DISTINCT min.codProf) AS num_profs_ministra_disciplina
	FROM 		professor AS prof, ministra AS min, escola AS esc
	WHERE 		prof.codigo = min.codProf
	AND 		esc.codigo = min.codEsc
	GROUP BY 	esc.codigo
)	AS f
ON		  esc.nome = f.nome_Escola
WHERE 	  esc.codigo = tur.codEscola  
GROUP BY  esc.codigo, num_profs_ministra_disciplina
ORDER BY  esc.nome ;
    


#		Consulta 8)	

SELECT 	 esc.nome AS nome_Escola, count(DISTINCT alu.codigo) AS num_Alunos, 
		 conta_profs.num_Profs_ministram_algumaDisc AS num_Profs_ministram_algumaDisc,
		 CAST( (count(DISTINCT alu.codigo) / conta_profs.num_Profs_ministram_algumaDisc) AS DECIMAL (10,2) ) AS razao_aluno_prof 
            
FROM	 pessoa AS pes, aluno AS alu, escola AS esc 
JOIN
(	#		Numero de Profs que ministram minimamente 1 disciplina
			
	SELECT 	esc.nome AS nome_Escola,  count(DISTINCT prof.codigo) AS num_Profs_ministram_algumaDisc
	FROM		escola AS esc, professor AS prof, ministra AS min, pessoa AS pes
	WHERE 		esc.codigo = min.codEsc
	AND		esc.codigo = pes.codEscola
	AND 		prof.codigo = min.codProf
	AND		prof.codigo = pes.codigo
	GROUP BY	esc.codigo
)	AS conta_profs
WHERE	  pes.codigo = alu.codigo
AND		  pes.codEscola = esc.codigo	
AND		  esc.nome = conta_profs.nome_Escola
GROUP BY  esc.nome, num_Profs_ministram_algumaDisc
ORDER BY  esc.nome;



#		Consulta 9)
SELECT    esc.nome AS cod_Escola, alu.matricula AS matri_Aluno, pes.nome AS nome_Aluno,
		  cont.nome AS nome_Contato, cont.telefone AS tel_Contato
FROM 	  contato AS cont, aluno AS alu, pessoa AS pes, escola AS esc
WHERE	  cont.codAluno = alu.codigo
AND		  alu.codigo = pes.codigo
AND 	  pes.codEscola = esc.codigo
ORDER BY  esc.nome, alu.matricula, cont.nome ;



/*		A FAZER...
#		Consulta 10)	
SELECT    esc.nome AS nome_Escola, pes.nome AS nome_Professor, tur.nome AS Turma_Ministrada
FROM 	  pessoa AS pes INNER JOIN ( ministra AS min, turma AS tur, escola AS esc )
ON		  pes.codEscola = min.codEsc
AND		  pes.codigo = min.codProf
AND		  pes.codEscola = esc.codigo
AND 	  min.codTurma = tur.codigo
AND	      min.codEsc = esc.codigo
GROUP BY  esc.nome, pes.nome, tur.nome
HAVING 	  count(DISTINCT pes.nome) = 1
ORDER BY  esc.nome, pes.nome;

SELECT vezes AS num_Vezes_Prof, nome_Escola, nome_Professor, Turma_Ministrada
FROM (
    SELECT    esc.nome AS nome_Escola, pes.nome AS nome_Professor, tur.nome AS Turma_Ministrada, COUNT(pes.nome) as vezes
    FROM 	  pessoa AS pes, professor AS prof, ministra AS min, turma AS tur, escola AS esc
    WHERE	  pes.codigo = prof.codigo
    AND		  pes.codEscola = min.codEsc
    AND		  pes.codEscola = esc.codigo
    AND		  prof.codigo = min.codProf
    AND 	  min.codTurma = tur.codigo
    AND	      min.codEsc = esc.codigo
    GROUP BY  esc.nome, pes.nome, tur.nome
) as sub
GROUP BY  sub.nome_Escola, sub.nome_Professor, sub.Turma_Ministrada
HAVING 	  SUM(vezes) = 1 
ORDER BY  nome_Escola, nome_Professor;
 */
 
 
 
 #		Consultas gerais para visualiazcao total
select * from cidade;
select * from escola;
select * from aluno;
select * from pessoa;
select * from professor;
select * from ministra;
select * from turma;
select * from disciplina;
select * from contato;
