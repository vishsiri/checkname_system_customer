import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:ce_reg_system/components/CustomBottomNavigationBar.dart';

import '../router.dart';
import '../utils.dart';

class SubjectPage extends StatefulWidget {
  const SubjectPage({super.key});

  @override
  State<SubjectPage> createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  int _currentIndex = 1;

  Widget buildCourseEntry(String courseCode, String courseTitle, String room, String type, Color backgroundColor, String link) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: () {
            AppRouter.router.navigateTo(context, link, transition: TransitionType.cupertino);
          },
          child: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: 120,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    shape: BoxShape.rectangle,
                  ),
                ),
                const SizedBox(width: 11),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          courseCode,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        Text(
                          courseTitle,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        Text(
                          room,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          type,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Icon(Icons.chevron_right)
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove the back button
        backgroundColor: Colors.blue, // Set the background color to blue
        title: Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
          ),
          padding: const EdgeInsets.all(5),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "รายวิชาที่ลงทะเบียนเรียน",
                style: TextStyle(
                  color: Colors.white, // Set the text color to white
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
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
          buildCourseEntry("PR204 / 311B", "Personal Image and Impression Management (LECT)", "Room C2-707 / No. 27", "Type: LECT DMC.FM วิชาโท/เลือกเสรี", Colors.blue, "/subject/1"),
          buildCourseEntry("PR204 / 311AAA", "Personal Image and Impression Management (LECT)", "Room C2-707 / No. 27", "Type: LECT DMC.FM วิชาโท/เลือกเสรี", Colors.red, "/subject/2"),
          buildCourseEntry("PR204 / 311AAA", "Personal Image and Impression Management (LECT)", "Room C2-707 / No. 27", "Type: LECT DMC.FM วิชาโท/เลือกเสรี", Colors.orange, "/subject/3"),
          buildCourseEntry("PR204 / 311AAA", "Personal Image and Impression Management (LECT)", "Room C2-707 / No. 27", "Type: LECT DMC.FM วิชาโท/เลือกเสรี", Colors.yellow, "/subject/4"),
          buildCourseEntry("PR204 / 311AAA", "Personal Image and Impression Management (LECT)", "Room C2-707 / No. 27", "Type: LECT DMC.FM วิชาโท/เลือกเสรี", Colors.green, "/subject/4"),
        ],
      ),
    );
  }
}
