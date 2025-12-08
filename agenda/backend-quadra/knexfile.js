module.exports = {
  development: {
    client: "sqlite3", // <- Faltava isso!
    connection: {
      filename: "./src/database/database.db"
    },
    migrations: {
      directory: "./src/database/migrations"
    },
    useNullAsDefault: true
  }
};
