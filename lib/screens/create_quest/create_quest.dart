import 'package:flutter/material.dart';
import 'package:quest_creator/shared_widgets/bottom_nav_bar.dart';

class CreateQuestScreen extends StatefulWidget {
  @override
  _CreateQuestScreenState createState() => _CreateQuestScreenState();
}

class _CreateQuestScreenState extends State<CreateQuestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
