import 'package:ainik_frontend/common/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBarButton extends StatefulWidget {
  String text;
  IconData? icon;
  String onpress;
  CustomAppBarButton(
      {super.key,
      required this.text,
      required this.icon,
      required this.onpress});

  @override
  State<CustomAppBarButton> createState() => _CustomAppBarButtonState();
}

class _CustomAppBarButtonState extends State<CustomAppBarButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pushNamed(widget.onpress);
      },
      style: OutlinedButton.styleFrom(
          backgroundColor: AinikColors["primary"],
          shadowColor: AinikColors["primary"]),
      child: Row(
        children: [
          Icon(
            widget.icon,
            color: Colors.white,
          ),
          Text(
            widget.text,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
