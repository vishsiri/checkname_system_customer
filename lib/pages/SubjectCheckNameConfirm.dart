import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:ce_reg_system/components/CustomBottomNavigationBar.dart';
import '../router.dart';
import '../utils.dart';

class SubjectCheckNameConfirm extends StatefulWidget {
  const SubjectCheckNameConfirm({Key? key}) : super(key: key);

  @override
  State<SubjectCheckNameConfirm> createState() =>
      _SubjectCheckNameConfirmState();
}

class _SubjectCheckNameConfirmState extends State<SubjectCheckNameConfirm> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the "Enrollment Success" message
            _buildEnrollmentSuccessMessage(),

            // Green animated checkmark icon
            _buildCheckmarkIcon(),

            // Button to navigate to "/subjectAll"
            ElevatedButton(
              onPressed: () {
                // Navigate to "/subjectAll"
                AppRouter.router.navigateTo(context, '/subjectAll', transition: TransitionType.cupertino);
              },
              child: Text('กลับสู่หน้าหลัก'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEnrollmentSuccessMessage() {
    return const Hero(
      tag: 'enrollment_success_tag',
      child: Material(
        color: Colors.transparent,
        child: Text(
          'ENROLLMENT SUCCESS',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ),
    );
  }

  Widget _buildCheckmarkIcon() {
    return const Hero(
      tag: 'checkmark_icon_tag',
      child: Material(
        color: Colors.transparent,
        child: Icon(
          Icons.check_circle,
          size: 80,
          color: Colors.green,
        ),
      ),
    );
  }
}
