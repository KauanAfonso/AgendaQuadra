const express = require("express");
const quadra = require("./controllers/quadraController");
const cliente = require("./controllers/clienteController");
const reserva = require("./controllers/reservaController");
const userController = require("./controllers/userController");

const router = express.Router();


router.post("/register", userController.register);
router.post("/login", userController.login);

// quadras
router.get("/quadras", quadra.index);
router.post("/quadras", quadra.store);
router.put("/quadras/:id", quadra.update);
router.delete("/quadras/:id", quadra.delete);

// clientes
router.get("/clientes", cliente.index);
router.post("/clientes", cliente.store);
router.put("/clientes/:id", cliente.update);
router.delete("/clientes/:id", cliente.delete);

// reservas
router.get("/reservas", reserva.index);
router.post("/reservas", reserva.store);
router.delete("/reservas/:id", reserva.delete);

module.exports = router;
