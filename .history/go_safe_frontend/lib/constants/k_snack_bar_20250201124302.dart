import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

Future<void> kShowSnackBar(
  BuildContext ctx, {
  required String title,
  required String message,
  ContentType? contentType,
}) async {
  var snackBar = SnackBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    behavior: SnackBarBehavior.floating,
    content: AwesomeSnackbarContent(
      title: title,
      message: message,
      contentType: contentType ?? ContentType.failure,
    ),
  );
  ScaffoldMessenger.of(ctx)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
