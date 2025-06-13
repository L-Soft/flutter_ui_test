import 'package:flutter/material.dart';

import '../../data/user_info.dart';
import '../../database/database_helper.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  var dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFFFEEF0),
        title: Text(
          'FutureBuilder 사용법',
          style: TextStyle(
            color: Color(0xFF241415),
            fontSize: 21,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: FutureBuilder(
        future: dbHelper.selectUserInfo(),
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

  Widget _listItem(List<UserInfo> userInfos) {
    return Container(
      color: Color(0xFFFFEEF0),
      child: ListView.builder(
        itemCount: userInfos.length,
        itemBuilder: (context, index) {
          var userInfo = userInfos[index];
          return GestureDetector(
            child: Container(
              height: 50,
              margin: EdgeInsets.only(top: 10, left: 20, right: 20),
              padding: EdgeInsets.all(3),
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
              child: Row(
                children: [
                  Container(width: 45, height: 45, color: Color(0xFFFF4D5F)),
                  SizedBox(width: 3,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${userInfo.firstName},${userInfo.lastName}',
                        style: TextStyle(
                          color: Color(0xFF241415),
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        '${userInfo.company} | ${userInfo.ipAddress}',
                        style: TextStyle(
                          color: Color(0xFF241415),
                          fontSize: 11,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            onTap: () {

            },
          );
        },
      ),
    );
  }
}
