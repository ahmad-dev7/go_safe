const router = require("express").Router();
const WarningPintsController = require("../controller/warning_points.controller");

router.get("/warning_points", WarningPintsController.get_warning_points);

module.exports = router;
