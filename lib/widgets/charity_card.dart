import 'package:ainik_frontend/common/colors.dart';
import 'package:flutter/material.dart';

class CharityCard extends StatefulWidget {
  const CharityCard({super.key, required this.picPath, required this.name});
  final String picPath;
  final String name;
  @override
  State<CharityCard> createState() => _CharityCardState();
}

class _CharityCardState extends State<CharityCard> {
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
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AinikColors["secondary"],
              foregroundColor: Colors.black,
            ),
            onPressed: () {},
            child: const Text("مشاهده"),
          ),
        ],
      ),
    );
  }
}
