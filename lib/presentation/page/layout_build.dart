import 'package:flutter/material.dart';
import '../../ui_data/destinations.dart';
import '../../models/data.dart' as data;
import '../../models/models.dart';
import '../../widgets/email_list_view.dart';
import '../../widgets/disappearing_bottom_navigation_bar.dart';
import '../../widgets/disappearing_navigation_rail.dart';

class LayoutBuild extends StatelessWidget {
  const LayoutBuild({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Feed(currentUser: data.user_0),
    );
  }
}

class Feed extends StatefulWidget {
  const Feed({super.key, required this.currentUser});

  final User currentUser;

  @override
  State<StatefulWidget> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  late final _colorScheme = Theme.of(context).colorScheme;
  late final _backgroundColor = Color.alphaBlend(
    _colorScheme.primary.withAlpha(36),
    _colorScheme.surface,
  );

  int selectedIndex = 0;
  bool wideScreen = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final double width = MediaQuery.of(context).size.width;
    print('width: $width');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          if (wideScreen)
            DisappearingNavigationRail(
              backgroundColor: _backgroundColor,
              selectedIndex: selectedIndex,
              onDestinationSelected: (index) {
                selectedIndex = index;
              },
            ),
          Expanded(
            child: Container(
              color: _backgroundColor,
              child: EmailListView(
                selectedIndex: selectedIndex,
                onSelected: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                currentUser: widget.currentUser,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: wideScreen
          ? null
          : FloatingActionButton(
              backgroundColor: _colorScheme.tertiaryContainer,
              foregroundColor: _colorScheme.onTertiaryContainer,
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
      bottomNavigationBar: wideScreen
          ? null
          : DisappearingBottomNavigationBar(
              selectedIndex: selectedIndex,
              onDestinationSelected: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
    );
  }
}
