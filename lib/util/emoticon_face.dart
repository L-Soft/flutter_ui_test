import 'package:flutter/material.dart';

class EmoticonFace extends StatelessWidget {
  final String emoticonFace;
  const EmoticonFace({super.key, required this.emoticonFace});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[600],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(16),
      child: Text(emoticonFace, style:TextStyle(
        fontSize: 28,
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w400,
      )),
    );
  }
}
