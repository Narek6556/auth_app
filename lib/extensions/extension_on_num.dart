import 'package:auth_app/utils/responsivnes.dart';
import 'package:flutter/material.dart';

extension ExtensionOnNum on num {
  double h(BuildContext context) {
    return Responsivnes.byHeight(context, this).toDouble();
  }

  double w(BuildContext context) {
    return Responsivnes.byWidth(context, this).toDouble();
  }
}
