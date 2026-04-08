--- 13-04-2025 18:08:47 MariaDB.7
-- Creazione della tabella denormalizzata con gli indicatori richiesti
CREATE TABLE cliente_feature AS
SELECT 
    c.id_cliente,
    -- Calcolo dell'età del cliente
    TIMESTAMPDIFF(YEAR, c.data_nascita, CURDATE()) AS eta_cliente,
    
    -- Numero totale di conti posseduti
    COUNT(DISTINCT co.id_conto) AS num_conti_posseduti,

    -- Numero di conti per tipo 0 (base)
	COUNT(DISTINCT CASE WHEN co.id_tipo_conto = 0 THEN co.id_conto END) AS num_conti_tipo_0,
 	-- Numero di conti per tipo 1 (business)
	COUNT(DISTINCT CASE WHEN co.id_tipo_conto = 1 THEN co.id_conto END) AS num_conti_tipo_1,
    -- Numero di conti per tipo 2 (privati)
	COUNT(DISTINCT CASE WHEN co.id_tipo_conto = 2 THEN co.id_conto END) AS num_conti_tipo_2,
    -- Numero di conti per tipo 3 (famiglie)
	COUNT(DISTINCT CASE WHEN co.id_tipo_conto = 3 THEN co.id_conto END) AS num_conti_tipo_3,
    
    -- Numero di transazioni in entrata e uscita
    COUNT(CASE WHEN tt.segno = '+' THEN t.id_conto END) AS num_transazioni_entrata,
    COUNT(CASE WHEN tt.segno = '-' THEN t.id_conto END) AS num_transazioni_uscita,
    
    -- Importo totale transato in entrata e uscita
    SUM(CASE WHEN tt.segno = '+' THEN t.importo ELSE 0 END) AS importo_totale_entrata,
    SUM(CASE WHEN tt.segno = '-' THEN t.importo ELSE 0 END) AS importo_totale_uscita,
    
    -- Numero di transazioni in entrata e uscita per tipo di conto
    COUNT(CASE WHEN tt.segno = '+' AND co.id_tipo_conto = 0 THEN t.id_conto END) AS num_trans_entrata_tipo_0,
    COUNT(CASE WHEN tt.segno = '-' AND co.id_tipo_conto = 0 THEN t.id_conto END) AS num_trans_uscita_tipo_0,
    COUNT(CASE WHEN tt.segno = '+' AND co.id_tipo_conto = 1 THEN t.id_conto END) AS num_trans_entrata_tipo_1,
    COUNT(CASE WHEN tt.segno = '-' AND co.id_tipo_conto = 1 THEN t.id_conto END) AS num_trans_uscita_tipo_1,
    COUNT(CASE WHEN tt.segno = '+' AND co.id_tipo_conto = 2 THEN t.id_conto END) AS num_trans_entrata_tipo_2,
    COUNT(CASE WHEN tt.segno = '-' AND co.id_tipo_conto = 2 THEN t.id_conto END) AS num_trans_uscita_tipo_2,
    COUNT(CASE WHEN tt.segno = '+' AND co.id_tipo_conto = 3 THEN t.id_conto END) AS num_trans_entrata_tipo_3,
    COUNT(CASE WHEN tt.segno = '-' AND co.id_tipo_conto = 3 THEN t.id_conto END) AS num_trans_uscita_tipo_3,
    
    -- Importo transato in entrata e uscita per tipologia di conto
    SUM(CASE WHEN tt.segno = '+' AND co.id_tipo_conto = 0 THEN t.importo ELSE 0 END) AS importo_entrata_tipo_0,
    SUM(CASE WHEN tt.segno = '-' AND co.id_tipo_conto = 0 THEN t.importo ELSE 0 END) AS importo_uscita_tipo_0,
    SUM(CASE WHEN tt.segno = '+' AND co.id_tipo_conto = 1 THEN t.importo ELSE 0 END) AS importo_entrata_tipo_1,
    SUM(CASE WHEN tt.segno = '-' AND co.id_tipo_conto = 1 THEN t.importo ELSE 0 END) AS importo_uscita_tipo_1,
    SUM(CASE WHEN tt.segno = '+' AND co.id_tipo_conto = 2 THEN t.importo ELSE 0 END) AS importo_entrata_tipo_2,
    SUM(CASE WHEN tt.segno = '-' AND co.id_tipo_conto = 2 THEN t.importo ELSE 0 END) AS importo_uscita_tipo_2,
    SUM(CASE WHEN tt.segno = '+' AND co.id_tipo_conto = 3 THEN t.importo ELSE 0 END) AS importo_entrata_tipo_3,
    SUM(CASE WHEN tt.segno = '-' AND co.id_tipo_conto = 3 THEN t.importo ELSE 0 END) AS importo_uscita_tipo_3
FROM cliente c
LEFT JOIN conto co ON c.id_cliente = co.id_cliente
LEFT JOIN transazioni t ON co.id_conto = t.id_conto
LEFT JOIN tipo_transazione tt ON t.id_tipo_trans = tt.id_tipo_transazione
GROUP BY c.id_cliente;


