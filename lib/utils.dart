import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:ce_reg_system/router.dart';

void navigateToPage(BuildContext context, int index) {
  // Navigate to the selected page
  switch (index) {
    case 0:
      AppRouter.router.navigateTo(context, '/menuAll', transition: TransitionType.none);
      break;
    case 1:
      AppRouter.router.navigateTo(context, '/subjectAll', transition: TransitionType.none);
      break;
    case 2:
      AppRouter.router.navigateTo(context, '/profile', transition: TransitionType.cupertino);
      break;
  }
}
