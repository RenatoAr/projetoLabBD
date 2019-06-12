/*SCRIP DE CRIAÇÃO DAS VIEWS*/

/* VIEW */
CREATE MATERIALIZED VIEW MV_qtdseguranca as     
SELECT nome_museu, count(*) AS qntidade_seguranca FROM
    seguranca_museu GROUP BY nome_museu;

CREATE MATERIALIZED VIEW MV_qtdacess as     
    SELECT nome_museu, count(*) AS qntidade_acessibilidade
    FROM acessibilidade_museu GROUP BY nome_museu;