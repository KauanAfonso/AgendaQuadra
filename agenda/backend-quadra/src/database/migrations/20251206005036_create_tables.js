exports.up = function(knex) {
  return knex.schema
    .createTable("quadras", table => {
      table.increments("id").primary();
      table.string("nome");
      table.string("tipo");
      table.string("localizacao");
    })
    .createTable("clientes", table => {
      table.increments("id").primary();
      table.string("nome");
      table.string("telefone");
      table.string("contato");
    })
    .createTable("reservas", table => {
      table.increments("id").primary();
      table.integer("quadraId").references("id").inTable("quadras");
      table.integer("clienteId").references("id").inTable("clientes");
      table.string("data");
      table.string("horario");
      table.string("duracao");
    });
};

exports.down = function(knex) {
  return knex.schema.dropTable("reservas")
    .dropTable("clientes")
    .dropTable("quadras");
};
