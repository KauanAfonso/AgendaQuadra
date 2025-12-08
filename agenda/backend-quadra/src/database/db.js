const knex = require("knex");
const path = require("path");
const config = require("../../knexfile.js");

const db = knex({
  client: "sqlite3",
  connection: {
    filename: path.resolve(__dirname, "database.db")
  },
  useNullAsDefault: true,
  migrations: config.development.migrations
});

module.exports = db;
