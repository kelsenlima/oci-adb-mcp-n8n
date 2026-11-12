# Habilitar o MCP Server / Enable the MCP Server

OCI Console → Autonomous Database → **More actions → Add tags** (free-form):

| Key | Value |
|---|---|
| `adb$feature` | `{"name":"mcp_server","enable":true}` |

Endpoint:

```
https://dataaccess.adb.<REGION>.oraclecloudapps.com/adb/mcp/v1/databases/<AUTONOMOUS_DATABASE_OCID>
```

Desligar / disable: `{"name":"mcp_server","enable":false}`
