import 'package:ainik_frontend/common/colors.dart';
import 'package:ainik_frontend/widgets/personality_checkbox_list.dart';
import 'package:ainik_frontend/widgets/personality_question.dart';
import 'package:flutter/material.dart';

class PersonalityInformation extends StatefulWidget {
  const PersonalityInformation({super.key});

  @override
  State<PersonalityInformation> createState() => _PersonalityInformationState();
}

const questionslist = [
  "من فردی عملگرا هستم و از تعاملات اجتماعی مکرر لذت میبرم و از صرف وقت با بقیه انرژی میگیرم.",
  "من توجه زیادی به واقعیت ها دارم. به ویژه آن چیزهایی که میتوانم با کمک حواس پنجگانه یاد بگیرم. تمایل دارم روی واقعیت ها و جزئیات تمرکز کنم و از تجربه کردن لذت میبرم.",
  "من بر واقعیت ها و داده های عینی بیشتر تاکید میکنم و هنگام تصمیم گرفتن استوار، منطقی و بی غرض هستم.",
  "ساختار و تصمیمات استوار را ترجیح میدهم و دوست دارم همه چیز ساختار مشخصی داشته باشد.",
  "من فردی فکرگرا هستم و از تعاملات اجتماعی عمیق و معنی دار لذت میبرم و از تنها بودن انرژی میگیرم.",
  "من بیشتر به الگوها و تصورات توجه میکنم و بیشتر درباره احتمالات، آینده و نظریه های انتزاعی فکر میکنم و از آن لذت میبرم.",
  "من در هنگام تصمیم گیری مردم و احساساتشان را نیز در نظر میگیرم.",
  "من در دنیای ساختارمند احساس خفگی میکنم و بیشتر دچار بی حوصلگی و بی قراری میشوم."
];

class _PersonalityInformationState extends State<PersonalityInformation> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                margin: EdgeInsets.only(top: 10),
                color: AinikColors["warning"]!.withOpacity(0.2),
                child:
                    const Text("اطلاعات شخصیتی شما در راستای بهبود پیشنهادات"),
              ),
            ),
            for (int i = 0; i < questionslist.length; i += 1)
              Directionality(
                textDirection: TextDirection.rtl,
                child: PersonalityQuestion(
                    text: questionslist[i], i: (i + 1).toString() + ": "),
              ),
          ],
        ),
      ),
    );
  }
}
