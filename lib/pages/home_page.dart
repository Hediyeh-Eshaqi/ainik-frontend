import 'package:ainik_frontend/apis/apis.dart';
import 'package:ainik_frontend/common/colors.dart';
import 'package:ainik_frontend/common/methods.dart';
import 'package:ainik_frontend/widgets/custom_app_bar.dart';
import 'package:ainik_frontend/widgets/custom_bottom_app_bar.dart';
import 'package:ainik_frontend/widgets/my_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List charities = [];
  List charitiesWorks = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    await allCharities(from: "0", to: "5").then(
      (value) => this.setState(
        () {
          charities = value;
        },
      ),
    );
    await allCharitiesWork(from: "0", to: "5").then(
      (value) => this.setState(
        () {
          charitiesWorks = value;
        },
      ),
    );
    print(charitiesWorks);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: CustomAppBar(
            device: Methods.getDeviceType(MediaQuery.of(context).size.width),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ImageSlideshow(
                /// Width of the [ImageSlideshow].
                width: double.infinity,

                /// Height of the [ImageSlideshow].
                height: MediaQuery.of(context).size.height / 2 + 20,

                /// The page to show when first creating the [ImageSlideshow].
                initialPage: 0,

                /// The color to paint the indicator.
                indicatorColor: AinikColors["primary"],

                /// The color to paint behind th indicator.
                indicatorBackgroundColor: Colors.grey,

                /// The widgets to display in the [ImageSlideshow].
                /// Add the sample image file into the images folder

                /// Called whenever the page in the center of the viewport changes.
                // onPageChanged: (value) {
                //   print('Page changed: $value');
                // },

                /// Auto scroll interval.
                /// Do not auto scroll with null or 0.
                autoPlayInterval: 3000,

                /// Loops back to first slide.
                isLoop: true,
                children: [
                  Image.asset(
                    'lib/assets/images/1.png',
                    // fit: BoxFit.none,
                    fit: BoxFit.fitHeight,
                  ),
                  Image.asset(
                    'lib/assets/images/2.png',
                    fit: BoxFit.fitHeight,
                  ),
                  // Image.asset(
                  //   'lib/assets/images/3.png',
                  //   fit: BoxFit.fitHeight,
                  // ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              MyListView(
                items: charitiesWorks,
                type: "rwork",
                firstItem: "کارهای خیر پیشنهادی",
                icon: const Icon(
                  Icons.ac_unit_outlined,
                  color: Color.fromARGB(255, 241, 91, 181),
                  size: 100,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MyListView(
                items: charitiesWorks,
                type: "work",
                icon: const Icon(
                  Icons.person_4_outlined,
                  color: Color.fromARGB(255, 241, 91, 181),
                  size: 100,
                ),
                firstItem: "کارهای خیر",
              ),
              const SizedBox(
                height: 20,
              ),
              MyListView(
                items: charities,
                type: "charity",
                icon: const Icon(
                  Icons.house,
                  color: Color.fromARGB(255, 241, 91, 181),
                  size: 100,
                ),
                firstItem: " خیریه ها",
              ),
            ],
          ),
        ),
        bottomNavigationBar:
            Methods.getDeviceType(MediaQuery.of(context).size.width) == 'Mobile'
                ? const CustomBottomAppBar()
                : null,
      ),
    );
  }
}
