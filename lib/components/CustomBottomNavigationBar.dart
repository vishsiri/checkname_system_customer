import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabTapped;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTabTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTabTapped,
      selectedItemColor: Colors.blueAccent, // Set the selected item color to blue
      unselectedItemColor: Colors.grey, // Set the unselected item color to grey
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'เมนูหลัก',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'รายวิชา',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'โปรไฟล์',
        ),
      ],
    );
  }
}
