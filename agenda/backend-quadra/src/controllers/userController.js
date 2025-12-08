const db = require("../database/db");
const bcrypt = require("bcryptjs");

module.exports = {

  async register(req, res) {
    const { nome, email, senha } = req.body;

    const existe = await db("users").where({ email }).first();
    if (existe) return res.status(400).json({ error: "Email já cadastrado" });

    const hash = await bcrypt.hash(senha, 8);
    const [id] = await db("users").insert({ nome, email, senha: hash });

    return res.json({ id, message: "Usuário cadastrado com sucesso!" });
  },

  async login(req, res) {
    const { email, senha } = req.body;

    const user = await db("users").where({ email }).first();
    if (!user) return res.status(404).json({ error: "Usuário não encontrado" });

    const match = await bcrypt.compare(senha, user.senha);
    if (!match) return res.status(401).json({ error: "Senha incorreta" });

    return res.json({
      message: "Login efetuado!",
      user: {
        id: user.id,
        nome: user.nome,
        email: user.email
      }
    });
  }

};
