import 'package:firebase_auth_part/views/widgets/universal_text_input.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../data/models/category/category_item.dart';
import '../../../utils/my_utils.dart';
import '../../../view_models/category_view_model.dart';
import '../../../view_models/file_view_model.dart';
import '../../widgets/my_custom_button.dart';

class CategoryAddPage extends StatefulWidget {
  const CategoryAddPage({Key? key}) : super(key: key);

  @override
  State<CategoryAddPage> createState() => _CategoryAddPageState();
}

class _CategoryAddPageState extends State<CategoryAddPage> {
  final TextEditingController categoryNameController = TextEditingController();
  final TextEditingController categoryDescriptionController = TextEditingController();
  String imageUrl = "https://www.yourbrainonporn.com/wp-content/uploads/2018/09/medical_doctor-683x1024.jpg";


  final ImagePicker _picker = ImagePicker();
  XFile? image;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Category add Page"),
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1, color: Colors.red),
        ),
        child: Column(
          children: [
            UniversalTextInput(
              hintText: "Category name",
              textController: categoryNameController,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 20,),
            UniversalTextInput(
              hintText: "Description",
              textController: categoryDescriptionController,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 20),
            Image.network(imageUrl, width: 200, height: 150,),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () => selectImageDialog(context),
              child: const Text(
                "Upload category Image",
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
                  context.read<CategoryViewModel>().addCategory(
                    context: context,
                    categoryItem: CategoryItem(
                      categoryImg: imageUrl,
                      categoryName: name,
                      categoryId: "",
                      description: desc,
                    ),
                  );
                  Navigator.pop(context);
                }
              },
              text: "Add category",
            )
          ],
        ),
      ),
    );
  }

  void selectImageDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      backgroundColor: Colors.white,
      builder: (BuildContext bc) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                height: 150, // MediaQuery.of(context).size.height * 0.6,
                child: Column(children: [
                  ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text(
                      "Gallery",
                      style: TextStyle(color: Colors.blue, fontSize: 16,),
                    ),
                    onTap: () async {
                      await _getFromGallery().then((value) {
                        Navigator.of(context).pop();
                      });
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.camera_alt),
                    title: const Text(
                      "Camera",
                      style: TextStyle(color: Colors.blue, fontSize: 16,),
                    ),
                    onTap: () async {
                      await _getFromCamera().then((value) {
                        Navigator.of(context).pop();
                      });
                    },
                  ),
                ],),
              );
            });
      },
    );
  }


  Future<void> _getFromGallery() async {
    final selectedImage = await _picker.pickImage(
      maxWidth: 720,
      maxHeight: 720,
      source: ImageSource.gallery,
    );

    image = selectedImage;
    imageUrl = await context.read<FileViewModel>().uploadImage(image!, context);
    setState(() {});
  }

  Future<void> _getFromCamera() async {
    final selectedImage = await _picker.pickImage(
      maxWidth: 720,
      maxHeight: 720,
      source: ImageSource.camera,
    );
    image = selectedImage;
    imageUrl = await context.read<FileViewModel>().uploadImage(image!, context);
    setState(() {});
  }


}
