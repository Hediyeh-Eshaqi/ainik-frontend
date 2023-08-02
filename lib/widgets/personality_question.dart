import 'package:ainik_frontend/widgets/personality_checkbox_list.dart';
import 'package:flutter/material.dart';

class PersonalityQuestion extends StatefulWidget {
  const PersonalityQuestion({super.key, required this.text, required this.i});
  final String text;
  final String i;
  @override
  State<PersonalityQuestion> createState() => _PersonalityQuestionState();
}

class _PersonalityQuestionState extends State<PersonalityQuestion> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.i + " " + widget.text),
          PersonalityCheckboxList(),
        ],
      ),
    );
  }
}
