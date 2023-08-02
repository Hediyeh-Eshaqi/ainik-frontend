import 'package:ainik_frontend/common/methods.dart';
import 'package:ainik_frontend/pages/charity_page.dart';
import 'package:ainik_frontend/pages/create_cahrity.dart';
import 'package:ainik_frontend/pages/login_register.dart';
import 'package:ainik_frontend/pages/profile.dart';
import 'package:ainik_frontend/widgets/custom_app_bar.dart';
import 'package:ainik_frontend/widgets/custom_bottom_app_bar.dart';
import 'package:ainik_frontend/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'آینیک',
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: AInik(title: "آینیک"),
      ),
      routes: {
        LoginRegister.routeName: (_) => LoginRegister(),
        CharityPage.routeName: (_) => CharityPage(),
        Profile.routename: (_) => Profile(),
        CreateCharity.routeName: (_) => CreateCharity()
      },
    );
  }
}

class AInik extends StatefulWidget {
  const AInik({super.key, required this.title});
  final String title;

  @override
  State<AInik> createState() => _AInikState();
}

class _AInikState extends State<AInik> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: CustomAppBar(
          device: Methods.getDeviceType(width),
        ),
      ),
      body: const HomePage(),
      bottomNavigationBar: Methods.getDeviceType(width) == 'Mobile'
          ? const CustomBottomAppBar()
          : null,
    );
  }
}
