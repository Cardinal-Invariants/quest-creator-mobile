import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.only(top: 40),
        child: Stack(
          children: [Container(
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
            child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(

                          child: TextField(
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              hintText: "Search",
                              hintStyle: TextStyle(
                                color: Colors.amber.withOpacity(0.5),
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Icon(Icons.search),
                    ],
                  )

          ),
        ]),
      ),
    );
  }
}
