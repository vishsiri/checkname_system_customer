import 'package:flutter/material.dart';
import 'package:ce_reg_system/components/CustomBottomNavigationBar.dart';

import '../utils.dart';

class SubjectPage extends StatefulWidget {
  const SubjectPage({super.key});

  @override
  State<SubjectPage> createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
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
          InkWell(
            child: Container(
              width: 130,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(0),
              ),
              padding: const EdgeInsets.all(5),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "รายวิชาที่ลงทะเบียนเรียน",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}