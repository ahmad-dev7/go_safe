const router = require("express").Router();

const { route } = require("../app");
const UserController = require("../controller/user.controller");

router.post("/signup", UserController.signup);
router.post("/login", UserController.login);

module.exports = router;
