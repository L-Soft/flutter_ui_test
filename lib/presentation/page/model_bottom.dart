import 'package:flutter/material.dart';

class ModelBottom extends StatefulWidget {
  const ModelBottom({super.key});

  @override
  State<ModelBottom> createState() => _ModelBottomState();
}

enum AnimationStyles { defaultStyle, custom, none }

const List<(AnimationStyles, String)> animationStyleSegments =
    <(AnimationStyles, String)>[
      (AnimationStyles.defaultStyle, '기본'),
      (AnimationStyles.custom, '변경'),
      (AnimationStyles.none, '없음'),
    ];

class _ModelBottomState extends State<ModelBottom> {
  Set<AnimationStyles> animationStyleSelection = <AnimationStyles>{
    AnimationStyles.defaultStyle,
  };
  AnimationStyle? animationStyle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFFFEEF0),
        title: Text(
          'showModalBottomSheet',
          style: TextStyle(
            color: Color(0xFF241415),
            fontSize: 21,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xFFFFEEF0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SegmentedButton<AnimationStyles>(
              selectedIcon: Icon(
                Icons.audiotrack_outlined,
                color: Colors.red.shade900,
              ),
              showSelectedIcon: true,
              // 체크 없애기
              selected: animationStyleSelection,
              onSelectionChanged: (Set<AnimationStyles> styles) {
                setState(() {
                  animationStyleSelection = styles;
                  animationStyle = switch (styles.first) {
                    AnimationStyles.defaultStyle => null,
                    AnimationStyles.custom => const AnimationStyle(
                      duration: Duration(seconds: 3),
                      reverseDuration: Duration(seconds: 1),
                    ),
                    AnimationStyles.none => AnimationStyle.noAnimation,
                  };
                });
              },
              segments: animationStyleSegments
                  .map<ButtonSegment<AnimationStyles>>((
                    (AnimationStyles, String) shirt,
                  ) {
                    return ButtonSegment<AnimationStyles>(
                      value: shirt.$1,
                      label: Text(
                        shirt.$2,
                        style: TextStyle(
                          color: Color(0xFF241415),
                          fontSize: 15,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  })
                  .toList(),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              width: double.infinity,
              height: 50,

              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    sheetAnimationStyle: animationStyle,
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    context: context,
                    isDismissible: false,
                    // 영역 외에서 닫기
                    isScrollControlled: false,
                    // 전체 화면 여부
                    builder: (BuildContext context) {
                      return Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 30,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(50),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 30,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 30,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(50),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      // margin: EdgeInsets.only(left: 5, right: 5),
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(50)),
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 30,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(50),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 30,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 30,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(50),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 30,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 30,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 30,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 30,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                height: 30,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF8D98),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                child: Text(
                  'showModalBottomSheet 버튼',
                  style: TextStyle(
                    color: Color(0xFF241415),
                    fontSize: 15,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
