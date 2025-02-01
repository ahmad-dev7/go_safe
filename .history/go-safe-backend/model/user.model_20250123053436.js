const mongoose = require("mongoose");
const db = require("../config/db");
const { Schema } = mongoose;

const userSchema = new Schema({
  email: {
    type: String,
    required: true,
  },
});
