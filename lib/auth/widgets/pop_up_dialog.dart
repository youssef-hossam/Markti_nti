import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:marketi_nti/auth/models/error_model.dart';

AwesomeDialog popupDialog(BuildContext context, ErrorModel errorModel, String errorMessage) {
  return AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: '${errorModel.message}',
        desc: '${errorMessage.trim()}',
        btnCancelOnPress: () {},
        btnOkOnPress: () {},
      );
}
