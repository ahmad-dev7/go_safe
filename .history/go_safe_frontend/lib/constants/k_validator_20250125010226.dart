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
