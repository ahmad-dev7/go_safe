const mongoose = require("mongoose");
const db = require("../config/db");
const bcrypt = require("bcrypt");
const { Schema } = mongoose;

const userSchema = new Schema({
  email: {
    type: String,
    unique: true,
    required: true,
  },
  phoneNumber: {
    type: String,
    unique: true,
    required: true,
  },
  password: {
    type: String,
    required: true,
  },
  name: {
    type: String,
    required: true,
  },
  profilePicture: {
    type: String,
    default: null,
  },
});

//* For hashing password before saving the data, so the hashed password is stored and not the plain text
userSchema.pre("save", async function () {
  try {
    const user = this;
    const salt = await bcrypt.genSalt(10);
    const hashPass = await bcrypt.hash(user.password, salt);
    user.password = hashPass;
  } catch (error) {
    console.log(error);
    throw error;
  }
});

const UserSchema = db.model("users", userSchema);

module.exports = UserSchema;
