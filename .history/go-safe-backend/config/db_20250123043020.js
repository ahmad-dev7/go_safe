const mongoose = require("mongoose");

// const connection = mongoose
// . createConnection( "mongodb : / / 127.0.0.1 : 27017/ chat - app-db")
// . "open",
// console. log( "Mongodb connected");
// module . exports =
// connection;

const dbConnection = mongoose
  .createConnection("mongodb://127.0.0.1:27017/go-safe-db")
  .on("open", () => {
    console.log("Mongodb connected");
  });

module.exports = dbConnection;
