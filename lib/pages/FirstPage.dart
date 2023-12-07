import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:ce_reg_system/router.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  get onPressed => null;

  void _toSecPage() {
    AppRouter.router.navigateTo(context, '/authen', transition: TransitionType.cupertino);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF97BCE8),
              Color(0xFF2867B0),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img/reg_logo.png', // Replace 'your_image.png' with the actual image asset path
                width: 300, // Adjust the width as needed
                height: 300, // Adjust the height as needed
              ),
              const SizedBox(height: 50), // Add some space between the image and the text
              const Text(
                "Check Name",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35.0
                ),
              ),
              const SizedBox(height: 30),
              InkWell(
                onTap: () {
                  _toSecPage();
                },
                child: Image.asset(
                  'assets/img/button_go_first.png',
                  width: 90,
                  height: 90,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
