import 'package:ainik_frontend/common/colors.dart';
import 'package:ainik_frontend/main.dart';
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
    String getDeviceType() {
      if (width < 481) {
        return "Mobile";
      } else if (width > 480 && width < 769) {
        return "Tablet";
      }
      return "Laptop";
    }

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
                  device: getDeviceType(),
                ),
              ),
        body: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Image.asset("lib/assets/images/charity3.jpeg"),
                        ],
                      ),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text("نام خیریه: نام"),
                        Text("تعداد کل کارهای خیر: تعداد"),
                        Text("تعداد کارهای خیر پایان یافته: تعداد"),
                        Text("تعداد کارهای خیر ناتمام: تعداد")
                      ],
                    ),
                    flex: 2,
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar:
            getDeviceType() == 'Mobile' ? const CustomBottomAppBar() : null,
      ),
    );
  }
}
