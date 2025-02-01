import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_safe/constants/k_validator.dart';
import 'package:go_safe/constants/k_values.dart';
import 'package:velocity_x/velocity_x.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isObsecure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validatePassword,
      decoration: InputDecoration(
        labelText: "Password",
        prefixIcon: const Icon(CupertinoIcons.lock),
        suffixIcon: IconButton(
          onPressed: () => setState(() => isObsecure = !isObsecure),
          icon: Icon(isObsecure ? CupertinoIcons.eye : CupertinoIcons.eye_slash),
        ),
      ),
    ).pOnly(bottom: kElementGap);
  }
}
