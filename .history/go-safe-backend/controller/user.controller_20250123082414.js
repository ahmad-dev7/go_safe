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
      const isMatch = await user.matchPassword(password);
      if (isMatch === true) {
        // Remove the password before sending the response
        const { password, ...userWithoutPassword } = user.toObject(); // Exclude password

        //* Return user data when login is successful
        res
          .status(200)
          .json({
            status: true,
            message: "Login successful",
            user: userWithoutPassword,
          });
      } else {
        return res.status(401).json({ message: "Invalid password" });
      }
    } else {
      return res.status(404).json({ message: "User not found" });
    }
  } catch (error) {
    console.log("Error ocurred during login: " + error);
    throw error;
  }
};
