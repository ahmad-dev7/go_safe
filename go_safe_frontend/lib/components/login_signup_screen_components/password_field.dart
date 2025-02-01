import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_safe/constants/k_app_colors.dart';
import 'package:go_safe/constants/k_validator.dart';

class PasswordField extends StatefulWidget {
  final Function(String value) onChanged;
  const PasswordField({super.key, required this.onChanged});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isObsecure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      validator: validatePassword,
      onChanged: widget.onChanged,
      obscureText: isObsecure,
      decoration: InputDecoration(
        labelText: "Password",
        prefixIcon: const Icon(CupertinoIcons.lock),
        suffixIcon: IconButton(
          onPressed: () => setState(() => isObsecure = !isObsecure),
          icon: Icon(
            isObsecure ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
            color: AppColors.secondary(context),
          ),
        ),
      ),
    );
  }
}
