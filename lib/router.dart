import 'package:ce_reg_system/pages/AuthenPage.dart';
import 'package:ce_reg_system/pages/MenuPage.dart';
import 'package:ce_reg_system/pages/ProfilePage.dart';
import 'package:ce_reg_system/pages/SubjectCheckName.dart';
import 'package:ce_reg_system/pages/SubjectPage.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

class AppRouter {
  static final FluroRouter router = FluroRouter();

  static void configureRoutes() {
    router.define(
      '/homepage',
      handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
          return const SubjectPage();
        },
      ),
    );
    router.define(
      '/subjectAll',
      handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
          return const SubjectPage();
        },
      ),
    );
    router.define(
      '/menuAll',
      handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
          return const MenuPage();
        },
      ),
    );
    router.define(
      '/authen',
      handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
          return const AuthenPage();
        },
      ),
    );
    router.define(
      '/profile',
      handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
          return const ProfilePage();
        },
      ),
    );
    router.define(
      '/subject/:id',
      handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
          // Extract the 'id' parameter from the params map
          String? subjectID = params['id'];

          // Use the extracted id to navigate to the SubjectCheckName page
          return SubjectCheckName(subjectID: subjectID); // Pass the id to the SubjectCheckName constructor
        },
      ),
    );
  }
}
