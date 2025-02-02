const mongoose = require("mongoose");
const db = require("../config/db");
const { Schema } = mongoose;

const warningPointsSchema = new Schema({
  latitude: {
    type: Number,
    required: true,
  },
  longitude: {
    type: Number,
    required: true,
  },
  severity: {
    type: Number,
    required: true,
  },
  reportedOn: {
    type: String,
    required: true,
  },
  description: {
    type: String,
  },
});

const WarningPointSchema = db.model("warning-points", warningPointsSchema);

module.exports = WarningPointSchema;
