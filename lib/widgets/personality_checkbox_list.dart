import 'package:ainik_frontend/common/colors.dart';
import 'package:flutter/material.dart';

class PersonalityCheckboxList extends StatefulWidget {
  PersonalityCheckboxList({
    super.key,
    required this.onChange,
    required this.active,
  });

  Function onChange;
  int active;

  @override
  State<PersonalityCheckboxList> createState() =>
      _PersonalityCheckboxListState();
}

const text_style = TextStyle(fontSize: 14);

class _PersonalityCheckboxListState extends State<PersonalityCheckboxList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Text(
            "کاملا موافقم",
            style: text_style,
          ),
          Checkbox(
            activeColor: AinikColors["danger"],
            value: widget.active == 1,
            onChanged: (newVal) {
              if (newVal == true) {
                widget.onChange(100);
              }
            },
          ),
          Text(
            "موافقم",
            style: text_style,
          ),
          Checkbox(
            activeColor: AinikColors["danger"],
            value: widget.active == 2,
            onChanged: (newVal) {
              if (newVal == true) {
                widget.onChange(75);
              }
            },
          ),
          Text(
            "نظری ندارم",
            style: text_style,
          ),
          Checkbox(
            activeColor: AinikColors["danger"],
            value: widget.active == 3,
            onChanged: (newVal) {
              if (newVal == true) {
                widget.onChange(50);
              }
            },
          ),
          Text(
            "مخالفم",
            style: text_style,
          ),
          Checkbox(
            activeColor: AinikColors["danger"],
            value: widget.active == 4,
            onChanged: (newVal) {
              if (newVal == true) {
                widget.onChange(25);
              }
            },
          ),
          Text(
            "کاملا مخالفم",
            style: text_style,
          ),
          Checkbox(
            activeColor: AinikColors["danger"],
            value: widget.active == 5,
            onChanged: (newVal) {
              if (newVal == true) {
                widget.onChange(0);
              }
            },
          )
        ],
      ),
    );
  }
}
