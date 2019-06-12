/*SCRIP DE CRIAÇÃO DE INDICES*/

/*INDICES PARA CONSULTA 1*/
CREATE INDEX idx_acc_museu_by_nome_museu ON acessibilidade_museu (nome_museu);
CREATE INDEX idx_seg_museu_by_nome_museu ON seguranca_museu (nome_museu);

/*INDICES PARA CONSULTA 2*/
CREATE INDEX idx_tip_museu_by_nome_tipologia ON tipologia_museu (nome_tipologia);