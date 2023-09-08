import 'package:ainik_frontend/apis/apis.dart';
import 'package:ainik_frontend/common/colors.dart';
import 'package:ainik_frontend/common/methods.dart';
import 'package:ainik_frontend/common/states.dart';
import 'package:ainik_frontend/widgets/charity_work.dart';
import 'package:ainik_frontend/widgets/custom_app_bar.dart';
import 'package:ainik_frontend/widgets/custom_bottom_app_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EditCharity extends StatefulWidget {
  const EditCharity({super.key});

  @override
  State<EditCharity> createState() => _EditCharityState();
}

class _EditCharityState extends State<EditCharity> {
  TextEditingController titleController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  String type = "";
  var creator = {};
  var info = {};
  var charity_work = [];
  String dropdownvalue = '1. کمک های بشردوستانه';
  var items = [
    '1. کمک های بشردوستانه',
    '2. آموزش',
    '3. مراقبت های بهداشتی',
    '4. کاهش فقر',
    '5. حفاظت از محیط زیست',
    '6. رفاه حیوانات'
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    await getCharityData().then((value) {
      print(value);
      setState(() {
        creator = value["creator"];
        info = value["info"];
        charity_work = value["charity_works"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print(States.ClickedCharityID);
    double width = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: !kIsWeb
            ? AppBar(
                backgroundColor: AinikColors["primary"],
                title: const Text('ویرایش خیریه'),
              )
            : PreferredSize(
                preferredSize: const Size.fromHeight(60.0),
                child: CustomAppBar(
                  device: Methods.getDeviceType(width),
                ),
              ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "اطلاعات خیریه:",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Image.asset(
                                "lib/assets/common/charity.png",
                                height: 150,
                                width: 150,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("نام خیریه: ${info["name"]}"),
                            Text(
                                "تعداد کل کارهای خیر: ${charity_work.length.toString()}"),
                            Text("آدرس خیریه: ${info["address"]}"),
                            Text("توضیحات خیریه: ${info["description"]}")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "ساخته شده توسط:",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(50),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Image.asset(
                              "lib/assets/common/helper.jpeg",
                              width: 200,
                              height: 200,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("نام: ${creator["firstName"]}"),
                          Text("نام خانوادگی: ${creator["lastName"]} "),
                          Text("آدرس ایمیل: ${creator["email"]}"),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "کارهای خیر:",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => StatefulBuilder(
                                  builder: (BuildContext context, setState) {
                                    return Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Container(
                                        padding: EdgeInsets.all(20),
                                        height: 300,
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            TextField(
                                              textAlign: TextAlign.start,
                                              controller: titleController,
                                              decoration: const InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 154, 93, 229),
                                                  ),
                                                ),
                                                hintText: 'عنوان کار خیر',
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 154, 93, 229),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            DropdownButton(
                                              // Initial Value
                                              value: dropdownvalue,
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 154, 93, 229)),
                                              // Down Arrow Icon
                                              icon: const Icon(
                                                Icons.keyboard_arrow_down,
                                                color: Color.fromARGB(
                                                    255, 154, 93, 229),
                                              ),

                                              // Array list of items
                                              items: items.map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Directionality(
                                                    child: Text(items),
                                                    textDirection:
                                                        TextDirection.rtl,
                                                  ),
                                                );
                                              }).toList(),
                                              // After selecting the desired option,it will
                                              // change button value to selected value
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  dropdownvalue = newValue!;
                                                  type = newValue
                                                      .toString()
                                                      .split('.')[0];
                                                });
                                              },
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            Container(
                                              width: 400,
                                              height: 50,
                                              child: ElevatedButton(
                                                onPressed: () async {
                                                  var message =
                                                      await addCharityWork(
                                                          tittle:
                                                              titleController
                                                                  .text,
                                                          type: type);
                                                  if (message == "ok") {
                                                    loadData();
                                                    Navigator.pop(context);
                                                    titleController.text = "";
                                                    type = "";
                                                  }
                                                },
                                                style: OutlinedButton.styleFrom(
                                                  backgroundColor:
                                                      AinikColors["warning"],
                                                  foregroundColor: Colors.black,
                                                ),
                                                child: const Text("افزودن"),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                )).then(
                          (value) => this.setState(
                            () {
                              dropdownvalue = '1. کمک های بشردوستانه';
                              titleController.text = "";
                            },
                          ),
                        );
                      },
                      icon: Icon(Icons.add),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  runSpacing: 10,
                  children: [
                    for (int i = charity_work.length - 1; i > -1; i--)
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            color: Colors.white,
                            padding: EdgeInsets.all(10),
                            child: CharityWork(
                                charityName: charity_work[i]["charityName"]
                                    ["name"],
                                id: charity_work[i]["id"],
                                picPath: "lib/assets/images/charity1.png",
                                name: charity_work[i]["title"]),
                          ),
                          Positioned(
                            right: 15,
                            child: GestureDetector(
                              onTap: () async {
                                States.SelectedCharityWorkID =
                                    charity_work[i]["id"];
                                var msg = await DeleteCharityWork();
                                if (msg == "ok") {
                                  await loadData();
                                }
                              },
                              child: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Methods.getDeviceType(width) == 'Mobile'
            ? const CustomBottomAppBar()
            : null,
      ),
    );
  }
}
