import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:ce_reg_system/utils.dart';
import '../components/CustomBottomNavigationBar.dart';
import '../router.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _currentIndex = 0;

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
      bottomSheet: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            _buildProfileWidget(),
            const SizedBox(height: 20),
            _buildMenuRow([
              _buildMenuItem(Icons.fact_check_outlined, 'เช็คชื่อ', '/subjectAll'),
              _buildMenuItem(Icons.history_rounded, 'ประวัติ', '/history'),
            ]),
            const SizedBox(height: 20),
            // _buildMenuRow([
              // _buildMenuItem(Icons.table_rows, 'ตารางเรียน', '/learnTable'),
              // _buildMenuItem(Icons.abc, 'ผลการเรียน', '/gradeReport'),
            // ]),
            const SizedBox(height: 20),
            // _buildMenuRow([
            //   _buildMenuItem(Icons.book, 'ใบลา', '/absentReport'),
            //   _buildMenuItem(Icons.qr_code_scanner, 'QR Scanner', '/qrScanner'),
            // ]),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: Colors.blueAccent,
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
                  'https://cdn.discordapp.com/attachments/998209779375812658/1182471324707336282/image.png',
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
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                Text('สวัสดี', style: TextStyle(fontSize: 14.0)),
                Text('เอกชัย เดวกาดาร์', style: TextStyle(fontSize: 10.0, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuRow(List<Widget> children) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: children,
    );
  }

  Widget _buildMenuItem(IconData icon, String text, String navigatePage) {
    return InkWell(
      onTap: () {
        AppRouter.router.navigateTo(context, navigatePage, transition: TransitionType.none);
      },
      child: Container(
        width: 130,
        height: 130,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: Colors.white,
            ),
            const SizedBox(height: 10),
            Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
