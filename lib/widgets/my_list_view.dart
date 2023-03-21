import 'package:ainik_frontend/common/colors.dart';
import 'package:flutter/material.dart';

class MyListView extends StatefulWidget {
  String firstItem;
  Icon icon;
  MyListView({super.key, required this.firstItem, required this.icon});

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color.fromARGB(255, 201, 165, 201),
      height: 300,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AinikColors["primary"],
              boxShadow: const [
                BoxShadow(
                    spreadRadius: 2, color: Color.fromARGB(255, 154, 93, 229)),
              ],
            ),
            margin: EdgeInsets.all(10),
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.icon,
                Center(
                    child: Text(
                  widget.firstItem,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                )),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("مشاهده همه"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AinikColors["danger"],
                    foregroundColor: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Container(
            // color: Colors.cyan,
            margin: EdgeInsets.all(10),
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Center(
                child: Text(
              widget.firstItem,
              style: TextStyle(fontSize: 18, color: Colors.white),
            )),
          ),
          Container(
            // color: Colors.cyan,
            margin: EdgeInsets.all(10),
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Center(
                child: Text(
              widget.firstItem,
              style: TextStyle(fontSize: 18, color: Colors.white),
            )),
          ),
          Container(
            // color: Colors.cyan,
            margin: EdgeInsets.all(10),
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Center(
                child: Text(
              widget.firstItem,
              style: TextStyle(fontSize: 18, color: Colors.white),
            )),
          ),
          Container(
            // color: Colors.cyan,
            margin: EdgeInsets.all(10),
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Center(
                child: Text(
              widget.firstItem,
              style: TextStyle(fontSize: 18, color: Colors.white),
            )),
          ),
        ],
      ),
    );
  }
}
