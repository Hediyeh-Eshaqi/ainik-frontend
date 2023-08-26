import 'package:ainik_frontend/common/colors.dart';
import 'package:ainik_frontend/pages/create_cahrity.dart';
import 'package:ainik_frontend/widgets/charity_card.dart';
import 'package:flutter/material.dart';

class MyCharities extends StatefulWidget {
  const MyCharities({super.key});

  @override
  State<MyCharities> createState() => _MyCharitiesState();
}

class _MyCharitiesState extends State<MyCharities> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          IconButton(
            color: AinikColors["danger"],
            onPressed: () {
              Navigator.of(context).pushNamed(CreateCharity.routeName);
            },
            icon: Icon(Icons.add),
          ),
          const SizedBox(
            height: 2,
          ),
          Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 10,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                color: Color.fromARGB(255, 216, 216, 216).withOpacity(0.5),
                padding: EdgeInsets.all(10),
                child: CharityCard(
                    id: 0,
                    picPath: "lib/assets/images/charity1.png",
                    name: "نام"),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                color: Color.fromARGB(255, 216, 216, 216).withOpacity(0.5),
                child: CharityCard(
                    id: 0,
                    picPath: "lib/assets/images/charity2.jpeg",
                    name: "نام"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
