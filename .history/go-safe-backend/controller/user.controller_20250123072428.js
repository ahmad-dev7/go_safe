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
    console.log("Error ocurred while creating user: " + error);
    next(error);
  }
};

exports.login = async (req, res, next) => {
  try {
    const { email, password } = req.body;
    const user = await UserServices.checkUser(email);

    if (user) {
      const isMatch = await user.comparePassword(password);
      if (isMatch === true) {
        //* Return user data when login is successful
        res.status(200).json({ status: true, message: "Login successful" });
      } else {
        return res
          .status(401)
          .json({ status: false, message: "Invalid password" });
      }
    } else {
      return res.status(401).json({ status: false, message: "Invalid email" });
    }
  } catch (error) {
    console.log("Error ocurred during login: " + error);
  }
};
