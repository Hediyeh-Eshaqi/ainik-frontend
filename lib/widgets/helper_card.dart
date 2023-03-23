import 'package:ainik_frontend/common/colors.dart';
import 'package:flutter/material.dart';

class HelperCard extends StatefulWidget {
  const HelperCard({super.key, required this.picPath, required this.name});
  final String picPath;
  final String name;
  @override
  State<HelperCard> createState() => _HelperCardState();
}

class _HelperCardState extends State<HelperCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "lib/assets/images/medal.png",
                height: 50,
                width: 50,
              ),
            ],
          ),
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
          )
        ],
      ),
    );
  }
}
