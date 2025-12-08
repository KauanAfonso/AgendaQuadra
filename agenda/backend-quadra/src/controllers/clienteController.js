const db = require("../database/db");

module.exports = {
  async index(req,res){ res.json(await db("clientes")); },
  async store(req,res){ res.json(await db("clientes").insert(req.body)); },
  async update(req,res){ 
    await db("clientes").where("id", req.params.id).update(req.body);
    res.json({status:"ok"});
  },
  async delete(req,res){ 
    await db("clientes").where("id", req.params.id).del();
    res.json({status:"deleted"});
  }
};
