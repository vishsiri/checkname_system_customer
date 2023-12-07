import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:ce_reg_system/utils.dart';
import '../components/CustomBottomNavigationBar.dart';
import '../router.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

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
        child: ListView(
          children: [
            const SizedBox(height: 40),
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
                        Text('สวัสดี', style: TextStyle(fontSize: 14.0)),
                        Text('A มั่นคง', style: TextStyle(fontSize: 10.0, color: Colors.grey)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.max, // Use min instead of max
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildMenuItem(
                  icon: Icons.fact_check_outlined,
                  text: 'เช็คชื่อ',
                  backgroundColor: Colors.blueAccent,
                  navigatePage: '/subjectAll',
                ),
                _buildMenuItem(
                  icon: Icons.history_rounded,
                  text: 'ประวัติ',
                  backgroundColor: Colors.blueAccent,
                  navigatePage: '/subjectCheckName',
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.max, // Use min instead of max
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildMenuItem(
                  icon: Icons.table_rows,
                  text: 'ตารางเรียน',
                  backgroundColor: Colors.blueAccent,
                  navigatePage: '/learnTable',
                ),
                _buildMenuItem(
                  icon: Icons.abc,
                  text: 'ผลการเรียน',
                  backgroundColor: Colors.blueAccent,
                  navigatePage: '/gradeReport',
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.max, // Use min instead of max
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildMenuItem(
                  icon: Icons.book,
                  text: 'ใบลา',
                  backgroundColor: Colors.blueAccent,
                  navigatePage: '/absentReport',
                ),
                _buildMenuItem(
                  icon: Icons.qr_code_scanner,
                  text: 'QR Scanner',
                  backgroundColor: Colors.blueAccent,
                  navigatePage: "/qrScanner"
                ),
              ],
            )

            // Add more menu items as needed
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String text,
    required Color backgroundColor,
    required String navigatePage,
  }) {
    return InkWell(
      onTap: () {
        AppRouter.router.navigateTo(context, navigatePage, transition: TransitionType.none);
      },
      child: Container(
        width: 130,
        height: 130,
        decoration: BoxDecoration(
          color: backgroundColor,
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