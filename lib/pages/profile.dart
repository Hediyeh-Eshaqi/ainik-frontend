import 'package:ainik_frontend/common/colors.dart';
import 'package:ainik_frontend/common/methods.dart';
import 'package:ainik_frontend/widgets/custom_app_bar.dart';
import 'package:ainik_frontend/widgets/custom_bottom_app_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  static const routename = "/profile";
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: !kIsWeb
            ? AppBar(
                backgroundColor: AinikColors["primary"],
                title: const Text('پروفایل'),
              )
            : PreferredSize(
                preferredSize: const Size.fromHeight(60.0),
                child: CustomAppBar(
                  device: Methods.getDeviceType(width),
                ),
              ),
        body: Container(
          child: Center(
            child: Column(
              children: [],
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
