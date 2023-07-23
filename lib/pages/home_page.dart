import 'package:ainik_frontend/common/colors.dart';
import 'package:ainik_frontend/widgets/my_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
            type: "work",
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
    );
  }
}
