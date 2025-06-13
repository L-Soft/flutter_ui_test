import 'package:flutter/material.dart';

import '../../database/database_helper.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var _ = DatabaseHelper(); // 초기화 떄문에 호출

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/main');
    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color(0xFFFF8D98)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/ui-logo.png', width: 100),
                SizedBox(height: 8),
                Text(
                  'UI Test App',
                  style: TextStyle(
                    color: Color(0xFF241415),
                    fontSize: 21,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
