import 'package:flutter/material.dart';

import '../../data/menu_info.dart';
import '../../database/database_helper.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFFFEEF0),
        title: Text(
          'UI 테스트',
          style: TextStyle(
            color: Color(0xFF241415),
            fontSize: 21,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: FutureBuilder(
        future: dbHelper.selectMenuInfo(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(
              color: Color(0xFFFFEEF0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [CircularProgressIndicator()],
                  ),
                ],
              ),
            );
          }

          return _listItem((snapshot.data ?? []));
        },
      ),
    );
  }

  Widget _listItem(List<MenuInfo> menuItems) {
    return Container(
      color: Color(0xFFFFEEF0),
      child: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          var menuItem = menuItems[index];
          return GestureDetector(
            child: Container(
              height: 50,
              margin: EdgeInsets.only(top: 10, left: 20, right: 20),
              padding: EdgeInsets.all(10),
              decoration: ShapeDecoration(
                color: Color(0xFFFF8D98),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xFFFFCDD2)),
                  borderRadius: BorderRadius.circular(0),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0xffd9d9d9),
                    spreadRadius: 0,
                    blurRadius: 8.0,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    menuItem.menuName,
                    style: TextStyle(
                      color: Color(0xFF241415),
                      fontSize: 16,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              print('menuItem.id: ${menuItem.id}');
              if (menuItem.id == 1) {
                Navigator.pushNamed(context, '/user_info');
              } else if (menuItem.id == 2) {
                Navigator.pushNamed(context, '/model_bottom');
              } else if (menuItem.id == 3) {
                Navigator.pushNamed(context, '/dribbble_design_01');
              } else if (menuItem.id == 4) {
                Navigator.pushNamed(context, '/layout_build');
              } else if (menuItem.id == 5) {
                Navigator.pushNamed(context, '/web_view_page');
              }
            },
          );
        },
      ),
    );
  }
}
