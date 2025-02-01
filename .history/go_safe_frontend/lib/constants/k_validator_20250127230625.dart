import 'package:go_safe/constants/k_extensions.dart';
import 'package:velocity_x/velocity_x.dart';

String? validateEmail(String? value) {
  if (value.isEmptyOrNull) {
    return "Please enter email address";
  } else if (!value!.isEmail) {
    return "Please enter a valid email";
  } else {
    return null;
  }
}

String? validateName(String? value) {
  if (value.isEmptyOrNull) {
    return "Please enter name";
  } else if (!value!.isName) {
    return "It is not a valid name";
  } else {
    return null;
  }
}

String? validatePhoneNumber(String? value) {
  if (value.isEmptyOrNull) {
    return "Please enter phone number";
  } else if (!value!.isPhoneNumber) {
    return "Please enter a valid phone number";
  } else {
    return null;
  }
}
