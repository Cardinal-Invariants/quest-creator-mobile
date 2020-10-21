import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quest_creator/pages/create_quest/create_quest.dart';
import 'package:quest_creator/shared_widgets/bottom_drawer_container.dart';
import 'package:quest_creator/shared_widgets/map_widget/map_model.dart';
import 'package:quest_creator/shared_widgets/map_widget/map_widget.dart';
import 'package:quest_creator/shared_widgets/search_bar/search_bar.dart';
import 'package:animations/animations.dart';

class HomePage extends StatelessWidget {
  final bool isMenuVisible = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MapModel(),
        child: Stack(children: [
          Consumer<MapModel>(builder: (context, mapModel, child) {
            return MapWidget(mapModel);
          }),
          Container(
            child: SearchBar(),
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 40),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: 60),
            child: IconButton(
              onPressed: null,
              icon: Icon(Icons.arrow_upward_outlined),
              iconSize: 30,
            ),
          ),
          BottomDrawerContainer(
              animationDuration: Duration(milliseconds: 600),
              isVisible: isMenuVisible,
              visibleScreenFactor: 0.8,
              hiddenScreenFactor: 0.05,
              content: Container(
                margin: EdgeInsets.only(bottom: 70, left: 15, right: 15),
                child: Column(children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 5.0, color: Colors.amber),
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey),
                    ),
                  )
                ]),
              ))
        ]));
  }
}
