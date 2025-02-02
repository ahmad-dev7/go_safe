const WarningPointServices = require("../services/warning_points.services");

exports.get_warning_points = async (req, res) => {
  try {
    const warningPoints = await WarningPointServices.getWarningPoints();
    res.status(200).json(warningPoints);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch warning points" });
  }
};
