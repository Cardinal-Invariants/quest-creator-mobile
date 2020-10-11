import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quest_creator/shared_widgets/bottom_drawer_container.dart';
import 'package:quest_creator/shared_widgets/map_widget/map_widget.dart';
import 'package:quest_creator/shared_widgets/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMenuVisible = false;
  final showMenuOffset = 10;

  void handlePanUpdate(DragUpdateDetails details) {
    if (details.delta.dy.abs() > showMenuOffset) {
      setState(() {
        // in flutter point (0,0) lies in top left corner
        isMenuVisible = details.delta.dy < 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavBar(),
        body: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onPanUpdate: this.handlePanUpdate,
            child: Stack(children: [
              MapWidget(),
              BottomDrawerContainer(
                  duration: Duration(milliseconds: 600),
                  isVisible: isMenuVisible,
                  visibleScreenRatio: 0.8,
                  content: Container(
                    color: Colors.blueGrey[50],
                  )),
            ])));
  }
}
