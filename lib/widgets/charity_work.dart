import 'package:ainik_frontend/common/colors.dart';
import 'package:flutter/material.dart';

class CharityWork extends StatefulWidget {
  const CharityWork({
    super.key,
    required this.picPath,
    required this.name,
    required this.id,
    required this.charityName,
  });
  final String picPath;
  final String name;
  final int id;
  final String charityName;
  @override
  State<CharityWork> createState() => _CharityWorkState();
}

class _CharityWorkState extends State<CharityWork> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          Image.asset(
            widget.picPath,
            width: 300,
            height: 150,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.name,
            style: TextStyle(fontSize: 20, color: AinikColors["info"]),
          ),
          Text(
            "ایجاد شده توسط ${widget.charityName}",
            style: TextStyle(fontSize: 16, color: AinikColors["danger"]),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
