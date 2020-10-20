import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';

class BottomDrawerContainer extends StatefulWidget {
  final Duration animationDuration;
  final Widget content;
  final bool isVisible;
  final double visibleScreenFactor;
  final double hiddenScreenFactor;

  BottomDrawerContainer(
      {Key key,
      this.content,
      this.isVisible,
      this.visibleScreenFactor = 0.8,
      this.hiddenScreenFactor = 10,
      this.animationDuration})
      : super(key: key);
  @override
  State<BottomDrawerContainer> createState() =>
      _BottomDrawerContainerState(this.isVisible);
}

class _BottomDrawerContainerState extends State<BottomDrawerContainer> {
  static const int showMenuOffset = 10;
  bool isVisible = false;

  _BottomDrawerContainerState(bool isVisible) {
    this.isVisible = isVisible;
  }

  handlePanUpdate(DragUpdateDetails details) {
    if (details.delta.dy.abs() > showMenuOffset) {
      setState(() {
        isVisible = details.delta.dy < 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final drawerHeight = widget.visibleScreenFactor * SizeConfig.screenHeight;
    final borderRadius = Radius.circular(15);
    return AnimatedPositioned(
      child: GestureDetector(
          onPanUpdate: this.handlePanUpdate,
          behavior: HitTestBehavior.translucent,
          child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: borderRadius, topRight: borderRadius),
              child: Container(
                margin: EdgeInsets.only(top: 150),
                child: widget.content,
                width: SizeConfig.screenWidth,
                height: drawerHeight,
              ))),
      curve: Curves.easeInOut,
      duration: widget.animationDuration,
      bottom: isVisible ? 0 : -(1 - widget.hiddenScreenFactor) * drawerHeight,
    );
  }
}
