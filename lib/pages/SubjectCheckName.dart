import 'dart:convert';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../router.dart';

class SubjectCheckName extends StatefulWidget {
  const SubjectCheckName({Key? key, required this.subjectID}) : super(key: key);

  final String subjectID;

  @override
  State<SubjectCheckName> createState() => _SubjectCheckNameState();
}

class _SubjectCheckNameState extends State<SubjectCheckName> {
  Map<String, dynamic> jsonData = {}; // Placeholder for JSON data

  @override
  void initState() {
    super.initState();
    // Load JSON data when the widget is initialized
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    // Load and decode your JSON data (replace 'assets/subject_data.json' with your actual file path)
    String jsonString =
    await DefaultAssetBundle.of(context).loadString('assets/subject_data.json');
    setState(() {
      jsonData = json.decode(jsonString);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Find the subject details based on subjectID
    Map<String, dynamic> subjectDetails = jsonData[widget.subjectID] ?? {};

    // Set the app bar title dynamically
    String appBarTitle = subjectDetails['name'] ?? 'รายละเอียดวิชา';

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          _buildCard('รายละเอียดวิชา', [
            _buildSubjectInfo('วิชา', '${subjectDetails['name']}'),
            Row(
              children: [
                Expanded(
                  child: _buildSubjectInfo('รหัสวิชา', '${subjectDetails['subjectCode']}'),
                ),
                Expanded(
                  child: _buildSubjectInfo('หน่วยกิต', '${subjectDetails['rate']}'),
                ),
                Expanded(
                  child: _buildSubjectInfo('กลุ่มเรียน', '${subjectDetails['section']}'),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: _buildSubjectInfo('อาจาร์ยผู้สอน', '${subjectDetails['subjectCode']}'),
                ),
                Expanded(
                  child: _buildSubjectInfo('สถานะการเข้าเรียน', '${subjectDetails['enter']}'),
                ),
              ],
            ),
            _buildSubjectInfo('เวลาเรียน', '${subjectDetails['learnt']}'),
            _buildSubjectInfo('ห้องเรียน', '${subjectDetails['room']}'),
          ]),
          // ... Add more cards or widgets based on your requirements
          ElevatedButton.icon(
            onPressed: () {
              // Perform any actions before navigating (if needed)
              // ...

              // Navigate to the desired page
              AppRouter.router.navigateTo(context, '/successPage', transition: TransitionType.none);
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            icon: const Icon(Icons.add, color: Colors.white),
            label: const Text("ลงชื่อเข้าชั้นเรียน", style: TextStyle(color: Colors.white)),
          ),

        ],
      ),
    );
  }

  Widget _buildCard(String title, List<Widget> children) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 10, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent),
            ),
            const SizedBox(height: 20),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildSubjectInfo(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              fontSize: 11, fontWeight: FontWeight.normal, color: Colors.grey),
        ),
        Text(
          value,
          style: const TextStyle(
              fontSize: 11, fontWeight: FontWeight.normal, color: Colors.black),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
