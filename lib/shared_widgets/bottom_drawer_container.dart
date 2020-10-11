import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';

class BottomDrawerContainer extends StatelessWidget {
  final Duration duration;
  final Widget content;
  final bool isVisible;
  final double visibleScreenRatio;
  final double hiddenScreenRatio;

  BottomDrawerContainer(
      {Key key,
      this.content,
      this.isVisible,
      this.visibleScreenRatio = 0.8,
      this.hiddenScreenRatio = 0.1,
      this.duration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final menuHeight = this.visibleScreenRatio * SizeConfig.screenHeight;
    return AnimatedPositioned(
      child: Container(
        child: content,
        width: SizeConfig.screenWidth,
        height: menuHeight,
        color: Colors.white,
      ),
      curve: Curves.easeInOut,
      duration: duration,
      bottom: isVisible ? 0 : -(1 - this.hiddenScreenRatio) * menuHeight,
    );
  }
}
