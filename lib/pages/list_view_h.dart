import 'package:flutter/material.dart';
import 'package:trilhaapp/shared/widgets/app_images.dart';

class ListViewH extends StatefulWidget {
  const ListViewH({super.key});

  @override
  State<ListViewH> createState() => _ListViewHState();
}

class _ListViewHState extends State<ListViewH> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Card(elevation: 8, child: Image.asset(AppImages.img1)),
                Card(elevation: 8, child: Image.asset(AppImages.img2)),
                Card(elevation: 8, child: Image.asset(AppImages.img3)),
              ],
            ),
          ),
          Expanded(flex: 3, child: Container()),
        ],
      )
    );
  }
}