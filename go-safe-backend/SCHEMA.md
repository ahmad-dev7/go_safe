# User Schema for GoSafe Safety App

This is the Mongoose schema for storing user data in the GoSafe Safety App, which includes essential user details, emergency contacts, real-time monitoring settings, and safety-related fields.

## Schema Overview

```javascript
const mongoose = require("mongoose");

const userSchema = new mongoose.Schema({
  //* Basic User Info
  email: { type: String, required: true, unique: true },
  phoneNumber: { type: String, required: true, unique: true }, //* User phone number
  password: { type: String, required: true }, //* Encrypted password
  name: { type: String, required: true },
  profilePicture: { type: String, default: "" }, //* URL to profile picture (optional)

  //* Emergency Contact
  emergencyContacts: [
    {
      name: { type: String, required: true },
      relationship: { type: String, required: true }, //* e.g., "friend", "parent"
      phoneNumber: { type: String, required: true },
      email: { type: String, required: true },
    },
  ],

  //* Safety-related Fields
  homeAddress: { type: String, default: "" }, //* Home address (optional)
  preferredRoutes: [{ type: String }], //* Array of preferred safe routes (could be stored as route names or coordinates)
  location: {
    latitude: { type: Number },
    longitude: { type: Number },
  }, //* Current location (you can update this in real time)

  //* Real-time Monitoring for Safety
  audioAlertEnabled: { type: Boolean, default: true }, //* Whether the app listens for dangerous sounds
  sosAlertEnabled: { type: Boolean, default: true }, //* Whether SOS alerts are active

  //* App Settings
  themePreference: { type: String, enum: ["light", "dark"], default: "light" }, //* Theme preference

  //* User's emergency history (this can store previous incidents)
  emergencyHistory: [
    {
      timestamp: { type: Date, default: Date.now },
      location: {
        latitude: { type: Number },
        longitude: { type: Number },
      },
      alertType: {
        type: String,
        enum: ["sos", "audio", "manual"],
        required: true,
      },
      status: {
        type: String,
        enum: ["resolved", "pending"],
        default: "pending",
      },
    },
  ],

  //* For better security and privacy
  twoFactorAuthEnabled: { type: Boolean, default: false }, //* Two-factor authentication (optional)

  //* Timestamps
  createdAt: { type: Date, default: Date.now },
  updatedAt: { type: Date, default: Date.now },
});

//* Update the `updatedAt` field whenever a user document is modified
userSchema.pre("save", function (next) {
  this.updatedAt = Date.now();
  next();
});

const User = mongoose.model("User", userSchema);

module.exports = User;
```

## Schema Explanation

- **Basic User Info**: Includes essential details such as the email, phone number, password, name, and optional profile picture.
- **Emergency Contacts**: Allows users to store multiple emergency contacts with their names, relationship, phone numbers, and email addresses.
- **Safety-related Fields**: Includes the home address, preferred routes for safety, and real-time location (latitude and longitude).
- **Real-time Monitoring**: Allows the app to listen for dangerous sounds or trigger SOS alerts based on user settings.
- **App Settings**: Users can set their theme preference (light or dark mode).
- **Emergency History**: Stores previous incidents that the user has reported, including the timestamp, location, alert type, and resolution status.
- **Two-Factor Authentication**: Optional feature for enhanced security.
- **Timestamps**: Created and updated dates are automatically managed.
