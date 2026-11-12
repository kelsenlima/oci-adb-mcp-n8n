/* Limpeza (como ADMIN) */
BEGIN
  DBMS_SCHEDULER.CREATE_JOB(
    job_name   => 'ITOPS_MCP.REMOVER_FERRAMENTAS_MCP',
    job_type   => 'PLSQL_BLOCK',
    job_action => q'[BEGIN
      DBMS_CLOUD_AI_AGENT.DROP_TOOL('LISTAR_INCIDENTES_ABERTOS');
      DBMS_CLOUD_AI_AGENT.DROP_TOOL('RESUMO_SERVIDOR');
      DBMS_CLOUD_AI_AGENT.DROP_TOOL('SOLICITAR_CHAMADO');
    END;]',
    enabled    => TRUE,
    auto_drop  => TRUE);
END;
/
-- Aguarde alguns segundos e depois:
DROP USER itops_mcp CASCADE;
DROP PROCEDURE aprovar_chamado;
DROP FUNCTION mcp_solicitar_chamado;
DROP FUNCTION mcp_resumo_servidor;
DROP FUNCTION mcp_listar_incidentes_abertos;
-- Desligue o MCP: tag adb$feature = {"name":"mcp_server","enable":false}
