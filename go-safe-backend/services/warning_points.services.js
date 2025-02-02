const WarningPointsModel = require("../model/warning_point.model");

class WarningPointServices {
  //* For getting warning points
  static async getWarningPoints(email) {
    try {
      return await WarningPointsModel.find();
    } catch (error) {}
  }
}

module.exports = WarningPointServices;
