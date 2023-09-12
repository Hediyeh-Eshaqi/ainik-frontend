import 'package:ainik_frontend/apis/apis.dart';
import 'package:ainik_frontend/common/colors.dart';
import 'package:ainik_frontend/common/states.dart';
import 'package:ainik_frontend/pages/create_cahrity.dart';
import 'package:ainik_frontend/widgets/charity_card.dart';
import 'package:flutter/material.dart';

class MyCharities extends StatefulWidget {
  const MyCharities({super.key});

  @override
  State<MyCharities> createState() => _MyCharitiesState();
}

class _MyCharitiesState extends State<MyCharities> {
  List myCharitiesList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCharities();
  }

  Future<void> loadCharities() async {
    await myCharities().then((value) => this.setState(() {
          myCharitiesList = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    //
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          IconButton(
            color: AinikColors["danger"],
            onPressed: () async {
              try {
                final reLoadPage = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateCharity()),
                );

                if (reLoadPage || reLoadPage == null) {
                  loadCharities();
                }
              } catch (e) {}
            },
            // onPressed: () {
            //   Navigator.pushNamed(context, CreateCharity.routeName)
            //       .then((_) => this.setState(() {}));
            // },
            icon: Icon(Icons.add),
          ),
          const SizedBox(
            height: 2,
          ),
          Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 10,
            children: [
              for (int i = 0; i < myCharitiesList.length; i++)
                Stack(
                  children: [
                    Container(
                      width: 350,
                      height: 300,
                      padding: EdgeInsets.all(10),
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      color:
                          Color.fromARGB(255, 216, 216, 216).withOpacity(0.5),
                      child: CharityCard(
                          canEdit: true,
                          id: myCharitiesList[i]["id"],
                          picPath: "lib/assets/common/charity.png",
                          name: myCharitiesList[i]["name"]),
                    ),
                    Positioned(
                      right: 0,
                      top: -5,
                      child: GestureDetector(
                        onTap: () async {
                          States.ClickedCharityID = myCharitiesList[i]["id"];
                          var msg = await DeleteCharity();
                          if (msg == "ok") {
                            await loadCharities();
                          }
                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 40,
                        ),
                      ),
                    )
                  ],
                )
            ],
          ),
        ],
      ),
    );
  }
}
