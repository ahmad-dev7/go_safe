const UserServices = require("../services/user.services");

exports.signup = async (req, res, next) => {
  try {
    const { email, phoneNumber, password, name } = req.body;
    const successRes = await UserServices.signupUser(
      email,
      phoneNumber,
      password,
      name
    );

    if (successRes) {
      res.status(200).json({ message: "Account created" });
    } else {
      res.status(400).json({ message: "Failed to create account" });
    }
  } catch (error) {
    next(error);
  }
};
