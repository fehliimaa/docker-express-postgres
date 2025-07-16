const express = require("express");
const { Pool } = require("pg");

const app = express();
const port = process.env.PORT || 3000;

const pool = new Pool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
});

app.get("/", async (req, res) => {
  try {
    const result = await pool.query("SELECT NOW()");
    res.send(`📡 Conectado ao banco com sucesso: ${result.rows[0].now}`);
  } catch (err) {
    console.error("Erro ao conectar ao banco:", err);
    res.status(500).send("Erro ao conectar ao banco.");
  }
});

app.listen(port, () => {
  console.log(`API rodando na porta ${port}`);
});
