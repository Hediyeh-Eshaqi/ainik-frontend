import 'package:ainik_frontend/common/colors.dart';
import 'package:flutter/material.dart';

class PersonalityCheckboxList extends StatefulWidget {
  const PersonalityCheckboxList({super.key});

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
            value: true,
            onChanged: (newVal) {},
          ),
          Text(
            "موافقم",
            style: text_style,
          ),
          Checkbox(value: false, onChanged: (newVal) {}),
          Text(
            "نظری ندارم",
            style: text_style,
          ),
          Checkbox(value: false, onChanged: (newVal) {}),
          Text(
            "مخالفم",
            style: text_style,
          ),
          Checkbox(value: false, onChanged: (newVal) {}),
          Text(
            "کاملا مخالفم",
            style: text_style,
          ),
          Checkbox(value: false, onChanged: (newVal) {})
        ],
      ),
    );
  }
}
