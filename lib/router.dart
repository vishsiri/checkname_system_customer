import 'package:ce_reg_system/pages/AuthenPage.dart';
import 'package:ce_reg_system/pages/HistoryEnroll.dart';
import 'package:ce_reg_system/pages/MenuPage.dart';
import 'package:ce_reg_system/pages/ProfilePage.dart';
import 'package:ce_reg_system/pages/SubjectCheckName.dart';
import 'package:ce_reg_system/pages/SubjectCheckNameConfirm.dart';
import 'package:ce_reg_system/pages/SubjectPage.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

class AppRouter {
  static final FluroRouter router = FluroRouter();

  static void configureRoutes() {
    router.define(
      '/history',
      handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
          return const HistoryEnroll();
        },
      ),
    );
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
      '/successPage',
      handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
          return const SubjectCheckNameConfirm();
        },
      ),
    );
    router.define(
      '/subject/:id',
      handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
          print('Params: $params');
          String? subjectID;

          if (params['id'] is List<String>) {
            // Extract the first item from the list
            subjectID = params['id'].first;
          } else {
            subjectID = params['id'];
          }

          print('Subject ID: $subjectID');
          return SubjectCheckName(subjectID: subjectID ?? '');

          // Rest of your handler code...
        },
      ),
    );


  }
}
