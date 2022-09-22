import 'package:firebase_auth_part/data/models/category/category_item.dart';
import 'package:firebase_auth_part/view_models/category_view_model.dart';
import 'package:firebase_auth_part/views/tab/categories_page/widgets/category_item_view_.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/ui_needs/color.dart';
import '../../../utils/ui_needs/style.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(title: const Text("category of doctors "),),
      body: Stack(children: [

        Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 350,
              height: 450,
              decoration: const BoxDecoration(
                  gradient: RadialGradient(
                      center: Alignment(-0.5, -0.2),
                      colors: [
                        Color.fromARGB(99, 33, 216, 216),
                        Colors.white,
                      ],
                      radius: 0.6)),
            )),
        Positioned(
            top: 500,
            right: 0,
            child: Container(
              width: 350,
              height: 450,
              decoration: const BoxDecoration(
                  gradient: RadialGradient(
                      center: Alignment(0.5, 0.1),
                      colors: [
                        Color.fromARGB(44, 11, 255, 22),
                        Colors.white,
                      ],
                      radius: 0.6)),
            )),

        Column(
          children: [
            Container(
                margin: const EdgeInsets.only(top: 51,right: 150),
                child: Text(
                  "Category of Doctors",
                  style: MyTextStyle.sfProBlack.copyWith(
                    fontSize: 24,
                    color: MyColors.black,
                  ),
                )),
            Expanded(
              child: StreamBuilder<List<CategoryItem>>(
                stream: context.read<CategoryViewModel>().getCategories(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    final categories = snapshot.data!;
                    return ListView(
                      physics: const BouncingScrollPhysics(),
                      children: categories
                          .map((category) => CategoryItemView(
                                categoryItem: category,
                              ))
                          .toList(),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
