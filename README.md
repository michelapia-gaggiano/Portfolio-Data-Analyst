Project Work: Data Analysis & Business Intelligence

Ruolo: Data Preparer

Obiettivo: Trasformazione e pulizia di dataset grezzi (Prodotti, Transazioni, Clienti) per garantire l'integrità del dato prima del modellamento.

Strumenti: Power Query, Excel.

Key Tasks: Data Cleaning avanzato, Transpose di tabelle non strutturate, normalizzazione di formati internazionali e gestione di stringhe (Trim).

📊 Guida alla Lettura della Dashboard (Power BI)
Questa dashboard è stata progettata per fornire una visione olistica delle performance aziendali, focalizzandosi su tre pilastri principali: Ricavi, Redditività e Distribuzione Geografica.

KPI Principali (Indicatori Chiave)
Total Revenue (Ricavi Totali): Calcolati incrociando i dati delle transazioni con i listini prodotti, al netto di sconti e resi.

Profit Margin (Margine di Profitto): Analisi della differenza tra prezzo di vendita e costo unitario per identificare i prodotti più redditizi.

Transaction Volume: Monitoraggio della frequenza d'acquisto per individuare picchi stagionali.

Cosa osservare nei Report:
Analisi per Categoria Prodotto: Grazie alla pulizia della tabella Products, è possibile filtrare le vendite per categoria e sottocategoria, individuando quali linee di business trascinano il fatturato.

Performance Regionale: Utilizzando i dati normalizzati della tabella Customers, la mappa mostra la concentrazione dei ricavi per area geografica, evidenziando le zone con maggior potenziale di crescita.

Trend Temporale: Il grafico a linee mostra l'andamento delle vendite nel tempo, permettendo di verificare l'efficacia delle campagne marketing o l'impatto di fattori esterni.

Dettagli Tecnici del Modello:
Star Schema: Le tabelle Products, Customers e Calendar sono collegate alla tabella dei fatti Transactions tramite relazioni 1:N.

Misure DAX: Ho implementato misure personalizzate per il calcolo dinamico dei margini e delle variazioni percentuali rispetto al periodo precedente.
