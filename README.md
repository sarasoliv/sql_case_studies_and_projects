# 📦 PostgreSQL Order Management System

🎓 **Projeto Acadêmico** | **SGBD:** PostgreSQL | **Linguagem:** SQL

---

## 📌 Visão Geral

Projeto acadêmico desenvolvido para demonstrar na prática a modelagem, implementação e manipulação de um Banco de Dados Relacional para gestão de loja e pedidos (`loja_pedidos`).

O foco da aplicação é garantir a integridade dos dados, aplicar regras de negócio relacionais e extrair métricas operacionais por meio de consultas SQL otimizadas.

---

## 🛠️ Competências Técnicas Demonstradas

* **Modelagem e DDL:** Criação de esquemas, gerenciamento de tabelas, chaves primárias (`BIGSERIAL`), chaves estrangeiras com integridade referencial e restrições de unicidade (`UNIQUE`).
* **Manipulação de Dados (DML):** Povoamento de dados cobrindo múltiplos cenários operacionais, atualizações dinâmicas (`UPDATE`) e exclusões seguras (`DELETE`).
* **Consultas e Relatórios (DQL):** Criação de 30 consultas analíticas com filtros avançados, buscas textuais (*case-insensitive* com `ILIKE`) e tratamento de valores nulos (`IS NULL`).
* **Funções de Agregação:** Cálculos de faturamento, médias, contagens e valores extremos (`SUM`, `AVG`, `COUNT`, `MIN`, `MAX`) com conversão de tipos (`::NUMERIC`) e arredondamento (`ROUND`).

---

## 📐 Arquitetura do Banco de Dados

```text
[CLIENTE] (1) ─── (N) [PEDIDO] (1) ─── (N) [PRODUTO_PEDIDO] (N) ─── (1) [PRODUTO]

```

### Regras Principais de Integridade

* **Cliente → Pedido:** Relacionamento 1:N com chave estrangeira vinculando os pedidos aos clientes cadastrados.
* **Pedido ↔ Produto:** Relacionamento N:M resolvido por tabela associativa (`produto_pedido`), com restrição `UNIQUE (idfk_pedido, idfk_produto)` para evitar itens duplicados no mesmo pedido.

---

## 📊 Resumo das Operações e Consultas Executadas

* **Filtros e Buscas Avançadas:** Consultas por padrões de nomes (`A%`, `%silva%`), faixas de preço (`BETWEEN` / operadores lógicos) e acompanhamento de status de entrega (`dt_embarque`).
* **Agregações e KPIs de Negócio:**
* Apuração do ticket médio de produtos e faturamento acumulado da loja.
* Levantamento de estoque e verificação de pedidos pendentes de despacho.


* **Rotinas de Manutenção e Testes:**
* Reajuste em lote de preços de produtos (aplicação de 10%).
* Atualização de status e datas de entrega de pedidos.
* Teste prático de deleção de registros isolados via chave primária.



---

## 🚀 Como Executar

1. Abra o seu SGBD preferido (ex: **pgAdmin** ou **DBeaver**).
2. Conecte-se ao **PostgreSQL**.
3. Importe e execute o script SQL do projeto para criar o banco de dados `loja_pedidos`, popular as tabelas e rodar as consultas.

---

## 👤 Autora

* **Sara dos Santos de Oliveira**
