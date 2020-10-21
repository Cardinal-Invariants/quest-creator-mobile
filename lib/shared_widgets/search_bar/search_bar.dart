import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:quest_creator/pages/search_page/search_page.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 100,
      right: 0,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.symmetric(horizontal: 5),
        height: 45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 3.0, color: Colors.amber),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 50,
              color: Colors.amber.withOpacity(0.23),
            ),
          ],
        ),
        child: OpenContainer(
            closedBuilder: (_, openContainer) {
              return Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: "",
                        hintStyle: TextStyle(
                          color: Colors.amber.withOpacity(0.5),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        // surffix isn't working properly  with SVG
                        // thats why we use row
                        // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                      ),
                    ),
                  ),
                  Icon(Icons.search),
                ],
              );
            },
            openColor: Colors.white,
            transitionType: ContainerTransitionType.fadeThrough,
            closedElevation: 0,
            transitionDuration: const Duration(milliseconds: 600),
            closedShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
            ),
            closedColor: Colors.white,
            openBuilder: (_, closeContainer) {
              return SearchPage();
            }),
      ),
    );
  }
}
