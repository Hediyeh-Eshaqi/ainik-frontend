import 'package:ainik_frontend/common/colors.dart';
import 'package:ainik_frontend/pages/all_recommendeds.dart';
import 'package:ainik_frontend/widgets/charity_card.dart';
import 'package:ainik_frontend/widgets/charity_work.dart';
import 'package:ainik_frontend/widgets/helper_card.dart';
import 'package:flutter/material.dart';

class MyListView extends StatefulWidget {
  String firstItem;
  Icon icon;
  String type;
  MyListView({
    super.key,
    required this.firstItem,
    required this.icon,
    required this.type,
    required this.items,
  });
  List items;
  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  // var items = const [
  //   CharityCard(picPath: "lib/assets/images/charity1.png", name: "خیریه اول"),
  //   CharityCard(picPath: "lib/assets/images/charity2.jpeg", name: "خیریه دوم"),
  //   CharityCard(picPath: "lib/assets/images/charity3.jpeg", name: "خیریه سوم"),
  //   CharityCard(
  //       picPath: "lib/assets/images/charity4.jpeg", name: "خیریه چهارم"),
  // ];

  var helper = const [
    HelperCard(picPath: "lib/assets/images/user1.png", name: "نیکوکار اول"),
    HelperCard(picPath: "lib/assets/images/user2.png", name: "نیکوکار دوم"),
    HelperCard(picPath: "lib/assets/images/user3.png", name: "نیکوکار سوم"),
    HelperCard(picPath: "lib/assets/images/user4.png", name: "نیکوکار چهارم"),
  ];

  // var works = const [
  //   CharityWork(
  //       picPath: "lib/assets/images/animalHelp.jpeg", name: "کمک به حیوانات"),
  //   CharityWork(
  //       picPath: "lib/assets/images/natureHelp.jpeg", name: "کمک به طبیعت"),
  //   CharityWork(
  //       picPath: "lib/assets/images/childHelp.jpeg",
  //       name: "کمک به کودکان بیمار"),
  //   CharityWork(
  //       picPath: "lib/assets/images/childsPhelp.jpeg",
  //       name: "کمک به کودکان بی سرپرست"),
  // ];
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
                  onPressed: () {
                    widget.type == "rwork"
                        ? Navigator.of(context)
                            .pushNamed(AllRecommendeds.routeName)
                        : null;
                  },
                  child: Text("مشاهده همه"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AinikColors["warning"],
                    foregroundColor: Colors.black,
                  ),
                )
              ],
            ),
          ),
          widget.type == "charity"
              ? Row(
                  children: widget.items.map((item) {
                    return Container(
                      // color: Colors.cyan,
                      margin: EdgeInsets.all(10),
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: CharityCard(
                          id: item["id"],
                          name: item["name"],
                          picPath: "lib/assets/common/charity.png"),
                    );
                  }).toList(),
                )
              : widget.type == "helper"
                  ? Row(
                      children: helper.map((item) {
                        return Container(
                          // color: Colors.cyan,
                          margin: EdgeInsets.all(10),
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: item,
                        );
                      }).toList(),
                    )
                  : Row(
                      children: widget.items.map((item) {
                        return Container(
                          // color: Colors.cyan,
                          margin: EdgeInsets.all(10),
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: CharityWork(
                            name: item["title"],
                            picPath: "lib/assets/images/childsPhelp.jpeg",
                          ),
                        );
                      }).toList(),
                    )
        ],
      ),
    );
  }
}
