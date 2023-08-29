import 'package:ainik_frontend/apis/apis.dart';
import 'package:ainik_frontend/common/colors.dart';
import 'package:ainik_frontend/common/methods.dart';
import 'package:ainik_frontend/widgets/custom_app_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CreateCharity extends StatefulWidget {
  const CreateCharity({super.key});
  static const routeName = "/create_charity";
  @override
  State<CreateCharity> createState() => _CreateCharityState();
}

class _CreateCharityState extends State<CreateCharity> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: !kIsWeb
            ? AppBar(
                backgroundColor: AinikColors["primary"],
                title: const Text('ایجاد خیریه'),
              )
            : PreferredSize(
                preferredSize: const Size.fromHeight(60.0),
                child: CustomAppBar(
                  device:
                      Methods.getDeviceType(MediaQuery.of(context).size.width),
                ),
              ),
        body: Container(
          child: SingleChildScrollView(
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
                    Image.asset(
                      "lib/assets/images/createCharity.png",
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextField(
                      textAlign: TextAlign.start,
                      controller: nameController,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 154, 93, 229),
                          ),
                        ),
                        hintText: 'نام خیریه را وارد کنید',
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
                      controller: addressController,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 154, 93, 229)),
                        ),
                        hintText: 'آدرس خیریه را وارد کنید',
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
                      controller: descriptionController,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 154, 93, 229)),
                        ),
                        hintText: 'توضیحات خیریه را وارد کنید ',
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
                          var message = await createCharity(
                              name: nameController.text,
                              address: addressController.text,
                              description: descriptionController.text);
                          if (message == "ok") {
                            Navigator.pop(context);
                          }
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: AinikColors["secondary"],
                          foregroundColor: Colors.black,
                        ),
                        child: const Text("ایجاد"),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
