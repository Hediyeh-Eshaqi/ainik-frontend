import 'package:ainik_frontend/apis/apis.dart';
import 'package:ainik_frontend/common/colors.dart';
import 'package:ainik_frontend/pages/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginRegister extends StatefulWidget {
  const LoginRegister({super.key});
  static const routeName = "/ligin_register";
  @override
  State<LoginRegister> createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  String activePart = "ورود";
  TextStyle defaultStyle = TextStyle(color: Colors.grey, fontSize: 20.0);
  TextStyle linkStyle = TextStyle(color: AinikColors["danger"]);
  TextEditingController remailcontroller = new TextEditingController();
  TextEditingController rpasswordcontroller = new TextEditingController();
  TextEditingController rconfirmpasswordcontroller =
      new TextEditingController();
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      return Color.fromARGB(255, 241, 91, 181);
    }

    return Scaffold(
      appBar: !kIsWeb
          ? AppBar(
              backgroundColor: AinikColors["primary"],
              title: Text(activePart + " در آینیک"),
            )
          : null,
      body: activePart == "ثبت نام"
          ? SingleChildScrollView(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Image.asset("lib/assets/images/register.png"),
                      const SizedBox(
                        height: 40,
                      ),
                      TextField(
                        textAlign: TextAlign.start,
                        controller: remailcontroller,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 154, 93, 229),
                            ),
                          ),
                          hintText: 'ایمیل خود را وارد کنید',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 154, 93, 229),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        textAlign: TextAlign.start,
                        controller: rpasswordcontroller,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 154, 93, 229)),
                          ),
                          hintText: 'پسورد خود را وارد کنید',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 154, 93, 229),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        textAlign: TextAlign.start,
                        controller: rconfirmpasswordcontroller,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 154, 93, 229)),
                          ),
                          hintText: 'پسورد خود را تکرار کنید',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 154, 93, 229),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 400,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () async {
                            String message = await register(
                                email: remailcontroller.text,
                                password: rpasswordcontroller.text,
                                rePassword: rconfirmpasswordcontroller.text);
                            if (message == "ok") {
                              setState(() {
                                activePart = "ورود";
                              });
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(message),
                              ));
                            }
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: AinikColors["warning"],
                            foregroundColor: Colors.black,
                          ),
                          child: const Text("ثبت نام"),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(
                          style: defaultStyle,
                          children: <TextSpan>[
                            const TextSpan(text: 'حساب کاربری دارید؟'),
                            TextSpan(
                              text: ' ورود',
                              style: linkStyle,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  setState(() {
                                    activePart = "ورود";
                                  });
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : SingleChildScrollView(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("lib/assets/images/login.png"),
                      const SizedBox(
                        height: 40,
                      ),
                      TextField(
                        textAlign: TextAlign.start,
                        controller: usernameController,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 154, 93, 229),
                            ),
                          ),
                          hintText: 'یوزرنیم خود را وارد کنید',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 154, 93, 229),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        textAlign: TextAlign.start,
                        controller: passwordController,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 154, 93, 229)),
                          ),
                          hintText: 'پسورد خود را وارد کنید',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 154, 93, 229),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 400,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () async {
                            String message = await login(
                                email: usernameController.text,
                                password: passwordController.text);
                            if (message == "ok") {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => HomePage(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(message),
                              ));
                            }
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: AinikColors["warning"],
                            foregroundColor: Colors.black,
                          ),
                          child: const Text("ورود"),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(
                          style: defaultStyle,
                          children: <TextSpan>[
                            const TextSpan(text: 'حساب کاربری ندارید؟'),
                            TextSpan(
                              text: ' ثبت نام',
                              style: linkStyle,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  setState(() {
                                    activePart = "ثبت نام";
                                  });
                                },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
