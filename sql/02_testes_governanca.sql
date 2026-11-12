/* =====================================================================
   Testes de governança (rode como ADMIN depois de conversar no n8n)
   ===================================================================== */

-- Ferramentas publicadas para o usuário do MCP
SELECT tool_name, status
  FROM C##CLOUD$SERVICE.DBA_AI_AGENT_TOOLS
 WHERE owner = 'ITOPS_MCP';

-- Chamados: os vindos do n8n nascem PENDENTE_APROVACAO
SELECT chamado_id, titulo, prioridade, aberto_por, status, origem
  FROM chamados
 ORDER BY chamado_id;

-- Aprovação humana (troque o ID e o nome)
EXEC aprovar_chamado(<ID_DO_CHAMADO>, '<NOME_DO_ANALISTA>');

-- Trilha completa
SELECT quando, ferramenta, entrada, resultado
  FROM auditoria_agente
 WHERE ferramenta LIKE 'MCP%' OR ferramenta = 'APROVACAO_HUMANA'
 ORDER BY evento_id;
