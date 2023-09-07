import 'package:ainik_frontend/widgets/personality_checkbox_list.dart';
import 'package:flutter/material.dart';

class PersonalityQuestion extends StatefulWidget {
  PersonalityQuestion({
    super.key,
    required this.text,
    required this.i,
    required this.onChange,
  });
  final String text;
  final String i;
  Function onChange;
  @override
  State<PersonalityQuestion> createState() => _PersonalityQuestionState();
}

class _PersonalityQuestionState extends State<PersonalityQuestion> {
  int active = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.i + " " + widget.text),
          PersonalityCheckboxList(
            active: active,
            onChange: (var value) {
              if (value == 0) {
                widget.onChange(0);
                setState(() {
                  active = 5;
                });
              } else if (value == 25) {
                widget.onChange(25);
                setState(() {
                  active = 4;
                });
              } else if (value == 50) {
                widget.onChange(50);
                setState(() {
                  active = 3;
                });
              } else if (value == 75) {
                widget.onChange(75);
                setState(() {
                  active = 2;
                });
              } else if (value == 100) {
                widget.onChange(100);
                setState(() {
                  active = 1;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
