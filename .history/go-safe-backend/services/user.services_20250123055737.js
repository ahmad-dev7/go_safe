const UserModel = require("../model/user.model");

class UserServices {
  //* For signup
  static async signupUser(email, phoneNumber, password, name) {
    try {
      const createUser = new UserModel({
        email,
        phoneNumber,
        password,
        name,
      });

      return await createUser.save();
    } catch (error) {
      console.log("An error ocurred while creating user: " + error);
    }
  }
}
