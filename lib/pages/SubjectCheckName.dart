import 'package:flutter/material.dart';
import 'package:ce_reg_system/components/CustomBottomNavigationBar.dart';

import '../utils.dart';

class SubjectCheckName extends StatefulWidget {
  const SubjectCheckName({super.key, required this.subjectID});

  final String? subjectID;

  @override
  State<SubjectCheckName> createState() => _SubjectCheckNameState();
}

class _SubjectCheckNameState extends State<SubjectCheckName> {
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
      body: ListView(
        children: [
          Text(
            // Access subjectID from the widget
            widget.subjectID ?? 'No Subject ID',
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
