use Escola;




	#		Alteracao 1 )
    
    
	#	 1.1 )	Atribuir um codigo existente às vars 
SET		@codAluno_replacing = 5 ;
SET 	@codAluno_isReplaced = 7 ;


	#	 1.2 )	Altera todos os contatos de Aluno_Replaced ao Aluno_isReplacing :
UPDATE  contato 
SET 	codAluno = @codAluno_replacing
WHERE 	codAluno = @codAluno_isReplaced ;


	#	Consulta_Exemplo_1 )
SELECT  *
FROM 	contato AS cont, pessoa AS pes
WHERE	cont.codAluno = pes.codigo;




		#		Alteracao 2 )
    
    
	#	2.1 )	Criando FUNCAO para trocar Diretor :
    
DELIMITER **
CREATE FUNCTION subst_Diretor(cod_newDiretor INT,  cod_oldDiretor INT) RETURNS INT
DETERMINISTIC
BEGIN
		#	Verifica se era diretor
	
    SET	@resu = EXISTS (
		 SELECT *
		 FROM	professor AS prof
		 WHERE	prof.codigo = cod_oldDiretor
    );
    
    IF	@resu = 1	
    THEN		#	Atualiza direçao ao novo diretor	
		BEGIN
			UPDATE  professor 
			SET		isDiretor = true
			WHERE	codigo = cod_newDiretor;
		END;
        
		
        BEGIN	
				#	Insere valor novo na tabela Direcao
                
			SET	 @esc =
            (
				SELECT  codEscola
				FROM 	Pessoa AS pes, Professor AS prof
				WHERE 	pes.codigo = prof.codigo
				AND		prof.codigo = cod_newDiretor
			);
            
			INSERT INTO direcao (codEsc, codProf)
			VALUES (@esc, cod_newDiretor);
            

		END;
        
		RETURN 1;

	ELSE
		RETURN 0;
        
	END IF;
    
END **
DELIMITER ;


	#	2.2 )	Atribuir um codPros existente às vars 
SET 	@codProf_delProf  	 = 	13 ;
SET 	@codProf_novoDiretor = 	16 ;


	#	2.3) 	Troca cargos de direção, excluindo direçao antiga e repondo ao novo diretor :
SET 	@verify = subst_Diretor(@codProf_novoDiretor,  @codProf_delProf );
SELECT 	@verify;


	#	2.3 )	Por fim, exclui professor alvo :
DELETE  
FROM 	Professor AS prof
WHERE	prof.codigo = @codProf_delProf ;


	#	Consulta_Exemplo_2 )
    
SELECT  * 
FROM 	professor AS prof, pessoa AS pes
WHERE 	prof.codigo = pes.codigo ;

SELECT  * 
FROM 	Direcao;




	#	Alteracao 3 )


	#	 	3.1)	Atribuir um codigo existente às vars :	 
SET		@codProf_replacing =  14 ;
SET 	@codProf_isReplaced = 10 ;


/*	*****************************************************************	*/


	/*		Salva dados do professor sendo substituido,
		para volta do mesmo às aulas, após seu recesso :	*/
        

	CREATE TEMPORARY TABLE IF NOT EXISTS isReplaced_minProf
	AS  
    ( 
		SELECT  *
		FROM 	ministra AS min
		WHERE	min.codProf = @codProf_replacing
	) ;

/*	*****************************************************************	*/


	/*	 	3.2)	 	Sai professora Bonanza(10), entra Fernando(14),
			mantendo os dados antigos de Fernando :	*/
            
UPDATE 	 ministra
SET		 codProf = @codProf_replacing
WHERE	 codProf = @codProf_isReplaced
AND codDisc NOT IN 
(
	SELECT *
    FROM
    (
		SELECT ministra.codDisc
        FROM ministra
		WHERE codProf = @codProf_replacing
		AND codDisc = ministra.codDisc
		AND codTurma = ministra.codTurma
		AND codEsc = ministra.codEsc
	) AS f
);


	/*		3.3 )	Ao retorno do professor em recesso,
		inserir novamente seus dados guardados à tabela Ministra :			*/
        
INSERT INTO 	ministra 
SELECT * FROM	isReplaced_minProf ;



/*	Consulta_Exemplo_3 ) */

SELECT	 	min.codEsc AS cod_Escola, min.codProf AS cod_Prof,
			pes.nome As nome_Prof,  min.codTurma AS cod_Turma, min.codDisc AS cod_Disciplina 
            
FROM 		pessoa AS pes, professor AS prof, ministra AS min
WHERE 	 	pes.codigo = prof.codigo
AND		 	pes.codEscola = min.codEsc
AND		 	prof.codigo = min.codProf 
ORDER BY	min.codDisc, min.codEsc, min.codTurma, pes.nome ;

