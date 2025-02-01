extension StringExtensions on String {
  bool get isEmail {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(this);
  }

  bool get isName {
    final nameRegex = RegExp(r'^[a-zA-Z\s]+$');
    return nameRegex.hasMatch(this);
  }

  bool get isPhoneNumber {
    RegExp phoneNumberRegex = RegExp(r'^[0-9]{10}$');
    return phoneNumberRegex.hasMatch(this);
  }
}
