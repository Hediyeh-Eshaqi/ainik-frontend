import 'package:ainik_frontend/common/colors.dart';
import 'package:ainik_frontend/common/methods.dart';
import 'package:ainik_frontend/main.dart';
import 'package:ainik_frontend/widgets/charity_work.dart';
import 'package:ainik_frontend/widgets/custom_app_bar.dart';
import 'package:ainik_frontend/widgets/custom_bottom_app_bar.dart';
import 'package:ainik_frontend/widgets/my_list_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CharityPage extends StatefulWidget {
  const CharityPage({super.key});
  static const routeName = "/charity";
  @override
  State<CharityPage> createState() => _CharityPageState();
}

class _CharityPageState extends State<CharityPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      // child: AInik(title: "آینیک"),
      child: Scaffold(
        appBar: !kIsWeb
            ? AppBar(
                backgroundColor: AinikColors["primary"],
                title: const Text('نام خیریه'),
              )
            : PreferredSize(
                preferredSize: const Size.fromHeight(60.0),
                child: CustomAppBar(
                  device: Methods.getDeviceType(width),
                ),
              ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "اطلاعات خیریه:",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Image.asset(
                                "lib/assets/common/charity.png",
                                height: 150,
                                width: 150,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("نام خیریه: نام"),
                            Text("تعداد کل کارهای خیر: تعداد"),
                            Text("آدرس خیریه: آدرس"),
                            Text("توضیحات خیریه: توضیحات")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "ساخته شده توسط:",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(50),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Image.asset(
                              "lib/assets/common/helper.jpeg",
                              width: 200,
                              height: 200,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text("نام: نام"),
                          Text("نام خانوادگی: نام خانوادگی"),
                          Text("آدرس ایمیل: آدرس ایمیل"),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "کارهای خیر:",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  runSpacing: 10,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      color: Colors.white,
                      padding: EdgeInsets.all(10),
                      child: CharityWork(
                          picPath: "lib/assets/images/charity1.png",
                          name: "نام"),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      color: Colors.white,
                      child: CharityWork(
                          picPath: "lib/assets/images/charity2.jpeg",
                          name: "نام"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Methods.getDeviceType(width) == 'Mobile'
            ? const CustomBottomAppBar()
            : null,
      ),
    );
  }
}
