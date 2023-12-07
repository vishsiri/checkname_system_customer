import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ข้อมูลของฉัน', style: TextStyle(fontSize: 15.0)),
      ),
      backgroundColor: const Color(0xFFF0F0F0),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Colors .blueAccent,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      width: 60,
                      height: 60,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        'https://cdn.discordapp.com/attachments/1154599666361585668/1182150550498844702/FB_IMG_1701917039671.jpg',
                        fit: BoxFit.cover,
                        cacheWidth: 180,
                        cacheHeight: 180,
                        frameBuilder: (BuildContext context, Widget child, int? frame, bool wasSynchronouslyLoaded) {
                          return AnimatedOpacity(
                            opacity: frame == null ? 0 : 1,
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeOut,
                            child: child,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  alignment: Alignment.center,
                  child: const Column(
                    mainAxisSize: MainAxisSize.min, // Use min instead of max
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 10),
                      Text('วิศว์ ศิริวัฒน์', style: TextStyle(fontSize: 14.0)),
                      Text('วิศวกรรมคอมพิวเตอร์', style: TextStyle(fontSize: 10.0, color: Colors.grey)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          _buildCard('ข้อมูลส่วนบุคคล', [
            _buildPersonalInfo('ชื่อ (อังกฤษ)', 'VISH SIRIWATANA'),
            _buildPersonalInfo('ชื่อ (ไทย)', 'วิศว์ ศิริวัฒน์'),
            Row(
              children: [
                Expanded(
                  child: _buildPersonalInfo('วันเกิด', '10/10/1010'),
                ),
                Expanded(
                  child: _buildPersonalInfo('เพศ', 'ชาย'),
                ),
              ],
            ),
            _buildPersonalInfo('สัญชาติ', 'ไทย'),
          ]),
          _buildCard('หน่วยงาน', [
            Row(
              children: [
                Expanded(
                  child: _buildPersonalInfo('ประเภทผู้ใช้', 'นักศึกษา'),
                ),
                Expanded(
                  child: _buildPersonalInfo('รหัสประจำตัว', '00000000'),
                ),
              ],
            ),
            _buildPersonalInfo('ชั้นปี', '2564'),
            _buildPersonalInfo('คณะ (ไทย)', 'วิทยาศาสตร์'),
            _buildPersonalInfo('อีเมล', '00000000@ac.th'),
          ]),
          ElevatedButton.icon(
            onPressed: () => AppRouter.router.navigateTo(context, '/authen', transition: TransitionType.cupertino),
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
              ),
            ),
            icon: const Icon(Icons.exit_to_app, color: Colors.white),
            label: const Text("ออกจากระบบ", style: TextStyle(color: Colors.white)),
          ),

          const SizedBox(height: 30),
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
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
            const SizedBox(height: 20),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildPersonalInfo(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.normal, color: Colors.grey),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.normal, color: Colors.black),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
