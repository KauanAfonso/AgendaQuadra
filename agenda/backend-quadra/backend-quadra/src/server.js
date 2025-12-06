const express = require("express");
const cors = require("cors");

const app = express();
app.use(express.json());
app.use(cors());

const routes = require("./routes");
app.use(routes);

app.listen(3000, ()=> console.log("API rodando → http://localhost:3000"));
