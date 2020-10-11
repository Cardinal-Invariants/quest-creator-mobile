import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quest_creator/shared_widgets/bottom_drawer_container.dart';
import 'package:quest_creator/shared_widgets/map_widget/map_model.dart';
import 'package:quest_creator/shared_widgets/map_widget/map_widget.dart';

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
          BottomDrawerContainer(
              animationDuration: Duration(milliseconds: 600),
              isVisible: isMenuVisible,
              visibleScreenFactor: 0.8,
              hiddenScreenFactor: 0.05,
              content: Container(
                color: Colors.blueGrey[50],
              )),
        ]));
  }
}
