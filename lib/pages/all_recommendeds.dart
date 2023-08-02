import 'package:ainik_frontend/common/colors.dart';
import 'package:ainik_frontend/common/methods.dart';
import 'package:ainik_frontend/widgets/charity_work.dart';
import 'package:ainik_frontend/widgets/custom_app_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AllRecommendeds extends StatefulWidget {
  const AllRecommendeds({super.key});
  static const routeName = "/recommendeds";
  @override
  State<AllRecommendeds> createState() => _AllRecommendedsState();
}

class _AllRecommendedsState extends State<AllRecommendeds> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: !kIsWeb
            ? AppBar(
                backgroundColor: AinikColors["primary"],
                title: const Text('همه پیشنهادها'),
              )
            : PreferredSize(
                preferredSize: const Size.fromHeight(60.0),
                child: CustomAppBar(
                  device:
                      Methods.getDeviceType(MediaQuery.of(context).size.width),
                ),
              ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    color: Color.fromARGB(255, 216, 216, 216).withOpacity(0.5),
                    padding: EdgeInsets.all(10),
                    child: CharityWork(
                        name: "کمک به حیوانات",
                        picPath: "lib/assets/images/animalHelp.jpeg"),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    color: Color.fromARGB(255, 216, 216, 216).withOpacity(0.5),
                    child: CharityWork(
                        name: "کمک به حیوانات",
                        picPath: "lib/assets/images/animalHelp.jpeg"),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    color: Color.fromARGB(255, 216, 216, 216).withOpacity(0.5),
                    child: CharityWork(
                        name: "کمک به حیوانات",
                        picPath: "lib/assets/images/animalHelp.jpeg"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
