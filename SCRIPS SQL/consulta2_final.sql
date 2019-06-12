/*SCRIP DE CRIAÇÃO DA STORED PROCEDURE DA CONSULTA 2*/

/* CONSULTA 2 - SEM STORED PROCEDURE */
SELECT museu.nome_museu, museu.estado, museu.esfera, 
	MV_qtdacess.qntidade_acessibilidade, 
	MV_qtdseguranca.qntidade_seguranca  FROM
	museu 
NATURAL JOIN MV_qtdacess
NATURAL JOIN MV_qtdseguranca
WHERE MV_qtdacess.qntidade_acessibilidade > p_acc AND 
	MV_qtdseguranca.qntidade_seguranca > p_seg AND museu.estado = p_estado;
 

 /*  PROCEDURE */
CREATE OR REPLACE FUNCTION consulta_dois(p_estado VARCHAR(15), p_acc int, p_seg int) 
RETURNS table(
		  nome_museu VARCHAR(100),  estado VARCHAR(100), esfera VARCHAR(100), 
		  qntidade_acessibilidade bigint , 
		  qntidade_seguranca bigint ) as $$
      BEGIN
		RETURN QUERY 
		SELECT museu.nome_museu, museu.estado, museu.esfera, 
			MV_qtdacess.qntidade_acessibilidade, 
			MV_qtdseguranca.qntidade_seguranca  FROM
			museu 
		NATURAL JOIN MV_qtdacess
		NATURAL JOIN MV_qtdseguranca
		WHERE MV_qtdacess.qntidade_acessibilidade > p_acc AND 
			MV_qtdseguranca.qntidade_seguranca > p_seg AND museu.estado = p_estado;
      END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
														  
/*COMO TESTAR*/														  
/*select * from consulta_dois('MT',1,1);*/