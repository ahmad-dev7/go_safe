const express = require("express");
const body_parser = require("body-parser");
const userRouter = require("./router/user.route");
const warningPointsRouter = require("./router/warning_points.route");

const app = express();

app.use(body_parser.json());

app.use("/", userRouter);

app.use("/api", warningPointsRouter);

module.exports = app;
