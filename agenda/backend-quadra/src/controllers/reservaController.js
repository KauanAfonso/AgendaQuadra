const db = require("../database/db");

module.exports = {
  async index(req,res){ 
    const result = await db("reservas")
      .join("quadras","reservas.quadraId","quadras.id")
      .join("clientes","reservas.clienteId","clientes.id")
      .select("reservas.*","quadras.nome as quadra","clientes.nome as cliente");
    res.json(result);
  },

  async store(req,res){ 
    const { quadraId, data, horario } = req.body;

    const existe = await db("reservas")
      .where({ quadraId, data, horario }).first();

    if(existe) return res.status(400).json({erro:"Horário já reservado!"});

    res.json(await db("reservas").insert(req.body));
  },

  async delete(req,res){ 
    await db("reservas").where("id", req.params.id).del();
    res.json({status:"deleted"});
  }
};
