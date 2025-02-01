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
      res
        .status(200)
        .json({ message: "Your account has been created successfully" });
    } else {
    }
  } catch (error) {}
};
