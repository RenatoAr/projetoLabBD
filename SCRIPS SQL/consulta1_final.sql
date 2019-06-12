/*SCRIP DE CRIAÇÃO DA STORED PROCEDURE DA CONSULTA 2*/

/* CONSULTA 1 - SEM STORED PROCEDURE */
WITH tipo AS (
    SELECT nome_museu, nome_tipologia FROM tipologia_museu
    WHERE nome_tipologia ilike 'his%'
)
SELECT museu.nome_museu, tipo.nome_tipologia, esfera, ano_criacao,
qntidade_acessibilidade, qntidade_seguranca FROM
museu
NATURAL JOIN tipo
NATURAL JOIN MV_qtdacess
NATURAL JOIN MV_qtdseguranca
ORDER BY qntidade_acessibilidade, qntidade_seguranca DESC


/*  PROCEDURE */
CREATE OR REPLACE FUNCTION consulta_um(p_tipologia VARCHAR(15)) 
RETURNS table(
		  nome_museu VARCHAR(100),  nome_tipologia VARCHAR(100), esfera VARCHAR(100), 
			anot_criacao integer,
		  qntidade_acessibilidade bigint , 
		  qntidade_seguranca bigint ) as $$
      BEGIN
		RETURN QUERY 
		WITH tipo AS (
			SELECT tipologia_museu.nome_museu, tipologia_museu.nome_tipologia 
			FROM tipologia_museu
			WHERE tipologia_museu.nome_tipologia ilike CONCAT('%', p_tipologia, '%')
		)
		SELECT museu.nome_museu, tipo.nome_tipologia, museu.esfera, museu.ano_criacao,
		MV_qtdacess.qntidade_acessibilidade, MV_qtdseguranca.qntidade_seguranca FROM
		museu
		NATURAL JOIN tipo
		NATURAL JOIN MV_qtdacess
		NATURAL JOIN MV_qtdseguranca
		ORDER BY qntidade_acessibilidade, qntidade_seguranca DESC;
      END;
$$ LANGUAGE plpgsql SECURITY DEFINER;


/*COMO TESTAR*/
/*select * from consulta_um('ria');*/