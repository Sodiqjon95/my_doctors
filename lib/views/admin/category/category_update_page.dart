import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/models/category/category_item.dart';
import '../../../data/models/category/update_arguments.dart';
import '../../../utils/my_utils.dart';
import '../../../view_models/category_view_model.dart';
import '../../widgets/my_custom_button.dart';
import '../../widgets/universal_text_input.dart';

class CategoryUpdatePage extends StatefulWidget {
  const CategoryUpdatePage({Key? key, required this.updateCategoryArgs})
      : super(key: key);

  final UpdateCategoryArgs updateCategoryArgs;

  @override
  State<CategoryUpdatePage> createState() => _CategoryUpdatePageState();
}

class _CategoryUpdatePageState extends State<CategoryUpdatePage> {
  final TextEditingController categoryNameController = TextEditingController();
  final TextEditingController categoryDescriptionController =
  TextEditingController();
  String imageUrl = "";

  @override
  void initState() {
    categoryNameController.text =
        widget.updateCategoryArgs.categoryItem.categoryName;
    categoryDescriptionController.text =
        widget.updateCategoryArgs.categoryItem.description;
    imageUrl = widget.updateCategoryArgs.categoryItem.categoryImg;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Category Update Page"),
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 1, color: Colors.red)),
        child: Column(
          children: [
            UniversalTextInput(
              hintText: "Category name",
              textController: categoryNameController,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 20),
            UniversalTextInput(
              hintText: "Description",
              textController: categoryDescriptionController,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 20),
            Image.network(
              widget.updateCategoryArgs.categoryItem.categoryImg,
              width: 200,
              height: 150,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {},
              child: const Text(
                "Upload new category Image",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            MyCustomButton(
              onTap: () {
                String desc = categoryDescriptionController.text;
                String name = categoryNameController.text;
                if (desc.isEmpty) {
                  MyUtils.getMyToast(message: "Enter category name");
                } else if (name.isEmpty) {
                  MyUtils.getMyToast(message: "Enter category description");
                } else if (imageUrl.isEmpty) {
                  MyUtils.getMyToast(message: "Upload category image!");
                } else {
                  context.read<CategoryViewModel>().updateCategory(
                    docId: widget.updateCategoryArgs.docId,
                    context: context,
                    categoryItem: CategoryItem(
                      categoryImg: imageUrl,
                      categoryName: name,
                      categoryId: widget.updateCategoryArgs.categoryItem.categoryId,
                      description: desc,
                    ),
                  );
                  Navigator.pop(context);
                }
              },
              text: "Update category",
            )
          ],
        ),
      ),
    );
  }
}