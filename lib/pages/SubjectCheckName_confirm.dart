import 'package:flutter/material.dart';
import 'package:ce_reg_system/components/CustomBottomNavigationBar.dart';

import '../utils.dart';

class SubjectCheckNameConfirm extends StatefulWidget {
  const SubjectCheckNameConfirm({super.key});

  @override
  State<SubjectCheckNameConfirm> createState() => _SubjectCheckNameConfirmState();
}

class _SubjectCheckNameConfirmState extends State<SubjectCheckNameConfirm> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTabTapped: (index) {
          setState(() {
            _currentIndex = index;
          });
          navigateToPage(context, index);
        },
      ),
    );
  }
}