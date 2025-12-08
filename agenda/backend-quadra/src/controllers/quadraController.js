const db = require("../database/db");

module.exports = {
  async index(req,res){ res.json(await db("quadras")); },
  async store(req,res){ res.json(await db("quadras").insert(req.body)); },
  async update(req,res){ 
    await db("quadras").where("id", req.params.id).update(req.body);
    res.json({status:"ok"});
  },
  async delete(req,res){ 
    await db("quadras").where("id", req.params.id).del();
    res.json({status:"deleted"});
  }
};
