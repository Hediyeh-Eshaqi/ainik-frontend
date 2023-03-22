import 'package:ainik_frontend/common/colors.dart';
import 'package:ainik_frontend/pages/login_register.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key, required this.device});
  final String device;
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    if (widget.device == "Mobile") {
      return AppBar(
        backgroundColor: AinikColors["primary"],
        title: const Text(
          "آینیک",
          style: TextStyle(color: Colors.white),
        ),
      );
    }
    if (widget.device == "Laptop") {
      return AppBar(
        backgroundColor: AinikColors["primary"],
        title: Row(
          children: [
            Row(
              children: const [
                Icon(Icons.home, color: Colors.white),
                Text(
                  "آینیک",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: const [
                Icon(Icons.house, color: Colors.white),
                Text(
                  "خیریه ها",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: const [
                Icon(Icons.person_4_outlined, color: Colors.white),
                Text(
                  "خیر ها",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: const [
                Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                Text(
                  "پروفایل",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            const Spacer(),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(LoginRegister.routeName);
              },
              child: Text("ورود/ثبت نام"),
              style: OutlinedButton.styleFrom(
                backgroundColor: AinikColors["warning"],
                foregroundColor: Colors.black, //<-- SEE HERE
              ),
            )
          ],
        ),
      );
    }
    return AppBar(
      backgroundColor: AinikColors["primary"],
      title: Row(
        children: [
          Row(children: const [
            Text(
              "آینیک",
              style: TextStyle(color: Colors.white),
            ),
          ]),
          const Spacer(),
          Row(
            children: const [
              Icon(Icons.house, color: Colors.white),
            ],
          ),
          const Spacer(),
          Row(
            children: const [
              Icon(Icons.person_4_outlined, color: Colors.white),
            ],
          ),
          const Spacer(),
          Row(
            children: const [
              Icon(Icons.person, color: Colors.white),
            ],
          ),
          const Spacer(),
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(LoginRegister.routeName);
            },
            child: Text("ورود/ثبت نام"),
            style: OutlinedButton.styleFrom(
              backgroundColor: AinikColors["warning"],
              foregroundColor: Colors.black, //<-- SEE HERE
            ),
          )
        ],
      ),
    );
  }
}
