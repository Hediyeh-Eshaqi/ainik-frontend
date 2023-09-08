import 'package:ainik_frontend/common/colors.dart';
import 'package:ainik_frontend/common/methods.dart';
import 'package:ainik_frontend/widgets/custom_app_bar.dart';
import 'package:ainik_frontend/widgets/custom_bottom_app_bar.dart';
import 'package:ainik_frontend/widgets/personal_information.dart';
import 'package:ainik_frontend/widgets/personality_information.dart';
import 'package:ainik_frontend/widgets/user_profile_chairy.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const List<String> list = <String>['ISTJ', 'INTJ', 'ESTJ', 'ESFJ'];

class Profile extends StatefulWidget {
  const Profile({super.key});
  static const routename = "/profile";
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController usernameController = new TextEditingController();
  String activeTab = "PersonalInformation";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController.text = 'test@gmail.com';
    usernameController.text = "یوزرنیم";
  }

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 75,
                color: AinikColors["primary"],
                child: Row(
                  children: [
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          activeTab = "PersonalInformation";
                        });
                      },
                      child: Text(
                        "اطلاعات شخصی",
                        style: TextStyle(
                            color: activeTab == "PersonalInformation"
                                ? Colors.black
                                : Colors.white),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: activeTab == "PersonalInformation"
                            ? AinikColors["warning"]
                            : AinikColors["primary"],
                      ),
                    ),
                    Spacer(),
                    // TextButton(
                    //   onPressed: () {
                    //     setState(() {
                    //       activeTab = "PersonalityInformation";
                    //     });
                    //   },
                    //   child: Text(
                    //     "اطلاعات شخصیتی",
                    //     style: TextStyle(
                    //         color: activeTab == "PersonalityInformation"
                    //             ? Colors.black
                    //             : Colors.white),
                    //   ),
                    //   style: TextButton.styleFrom(
                    //     backgroundColor: activeTab == "PersonalityInformation"
                    //         ? AinikColors["warning"]
                    //         : AinikColors["primary"],
                    //   ),
                    // ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          activeTab = "Charities";
                        });
                      },
                      child: Text(
                        "خیریه های شما",
                        style: TextStyle(
                            color: activeTab == "Charities"
                                ? Colors.black
                                : Colors.white),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: activeTab == "Charities"
                            ? AinikColors["warning"]
                            : AinikColors["primary"],
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              activeTab == "PersonalInformation"
                  ? PersonalInformation()
                  : activeTab == "PersonalityInformation"
                      ? PersonalityInformation()
                      : MyCharities(),
            ],
          ),
        ),
        bottomNavigationBar: Methods.getDeviceType(width) == 'Mobile'
            ? const CustomBottomAppBar()
            : null,
      ),
    );
  }
}
