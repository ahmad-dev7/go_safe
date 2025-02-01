const mongoose = require("mongoose");

const dbConnection = mongoose
  .createConnection("mongodb://127.0.0.1:27017/go-safe-db")
  .on("open", () => {
    console.log("Mongodb connected");
  })
  .on("error", () => {
    console.log("Mongodb connection failed");
  });

module.exports = dbConnection;
