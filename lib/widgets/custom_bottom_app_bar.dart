import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        children: [
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.home),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.house_outlined),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person_4_outlined),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
