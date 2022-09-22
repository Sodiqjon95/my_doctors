import 'package:firebase_auth_part/data/models/doctors/doctors_item.dart';
import 'package:firebase_auth_part/view_models/doctor_view_model.dart';
import 'package:firebase_auth_part/views/admin/doctor/widgets/select_button.dart';
import 'package:firebase_auth_part/views/widgets/universal_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../../data/models/category/category_item.dart';
import '../../../utils/my_utils.dart';
import '../../../view_models/category_view_model.dart';
import '../../../view_models/file_view_model.dart';
import '../../widgets/my_custom_button.dart';

class DoctorAddPage extends StatefulWidget {
  const DoctorAddPage({Key? key}) : super(key: key);

  @override
  State<DoctorAddPage> createState() => _DoctorAddPage();
}

class _DoctorAddPage extends State<DoctorAddPage> {
  final TextEditingController doctorNameController = TextEditingController();

  final TextEditingController doctorLevelController = TextEditingController();
  final TextEditingController doctorPriceController = TextEditingController();
  final TextEditingController doctorDescriptionController = TextEditingController();
  final TextEditingController doctorSpecialistController = TextEditingController();
  final TextEditingController doctorPhoneNumberController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
 List<XFile> images =[];

  List<String> imageUrl = [
    "https://sun1-86.userapi.com/s/v1/if2/kKtldNmGrwlkbFceWACwC7zBB9nfNbnnI69r0fiGqj0dRa3njDoqZ9C2gZ09-LXNiam4FAeTCZB-JED770tR10uB.jpg?size=400x400&quality=96&crop=2,2,958,958&ava=1",
    "https://www.yourbrainonporn.com/wp-content/uploads/2018/09/medical_doctor-683x1024.jpg",
  ];
  CategoryItem? categoryItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Doctors add Page"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24),
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(width: 1, color: Colors.red),
          ),
          child: Column(
            children: [
              UniversalTextInput(
                hintText: "Doctor name",
                textController: doctorNameController,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.done,
              ),
              SizedBox(height: 20.h),
              UniversalTextInput(
                hintText: "Doctor specialist",
                textController: doctorSpecialistController,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.done,
              ),
              SizedBox(height: 20.h),
              UniversalTextInput(
                hintText: "Price  \$",
                textController: doctorPriceController,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.done,
              ),
              SizedBox(height: 20.h),
              UniversalTextInput(
                hintText: "Level  in years",
                textController: doctorLevelController,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.done,
              ),
               SizedBox(height: 20.h),
              UniversalTextInput(
                hintText: "Phone Number",
                textController: doctorPhoneNumberController,
                textInputType: TextInputType.phone,
                textInputAction: TextInputAction.done,
              ),
               SizedBox(height: 20.h),
              SizedBox(
                height: 200.h,
                child: TextFormField(
                  style:
                   TextStyle(fontSize: 18.sp, color: Colors.black),
                  controller: doctorDescriptionController,
                  textInputAction: TextInputAction.done,
                  maxLines: 100,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      hintText: "Description",
                      border: OutlineInputBorder()),
                ),
              ),
               SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SelectButton(
                      text: "Upload Image",
                      onTap: () => selectImageDialog(context),
                    ),
                  ),
                   SizedBox(width: 12.w),
                  Expanded(
                    flex: 1,
                    child: SelectButton(
                      text: categoryItem == null
                          ? "Select category"
                          : categoryItem!.categoryName,
                      onTap: () {
                        selectCategoryDialog((selectedCategoryItem) {
                          setState(() {
                            categoryItem = selectedCategoryItem;
                          });
                        });
                      },
                    ),
                  ),
                ],
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () {},
                child:  Text(
                  "Upload doctor Image",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 40,),
              SizedBox(
                height: 150.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(imageUrl.length, (index) => Image.network(
                    imageUrl[index],
                    width: 200.w,
                    height: 150.h,
                  )),
                ),
              ),
               SizedBox(height: 50.h,),
              MyCustomButton(
                onTap: () {
                  int level = -1;
                  String desc = doctorDescriptionController.text;
                  String name = doctorNameController.text;
                  String specialist = doctorSpecialistController.text;
                  String phoneNumber = doctorPhoneNumberController.text;
                  double price = double.parse(doctorPriceController.text);
                  if (doctorLevelController.text.isNotEmpty) {
                    level = int.parse(doctorLevelController.text);
                  } else {
                    MyUtils.getMyToast(message: "Enter doctor level");
                  }
                  if (name.isEmpty) {
                    MyUtils.getMyToast(message: "Enter doctor name");
                  } else if (desc.isEmpty && desc.length > 50) {
                    MyUtils.getMyToast(message: "Enter doctor description");
                  } else if (imageUrl.isEmpty) {
                    MyUtils.getMyToast(message: "Upload doctor image!");
                  } else if (price == 0.0 || price < 0.0) {
                    MyUtils.getMyToast(message: "Enter doctor price");
                  } else if (level == 0 || level < 0) {
                    MyUtils.getMyToast(message: "Enter doctor level");
                  } else if (specialist.isEmpty) {
                    MyUtils.getMyToast(message: "Enter doctor specialist");
                  } else if (phoneNumber.isEmpty || phoneNumber.length < 13 && phoneNumber.length  > 13) {
                    MyUtils.getMyToast(message: "Enter phone number");
                  } else {
                    context.read<DoctorViewModel>().addDoctors(
                          context: context,
                          categoryItem: DoctorsItem(
                            createdAt: DateTime.now(),
                            categoryId: "",
                            description: desc,
                            doctorId: "",
                            price: price,
                            doctorImages: imageUrl,
                            doctorName: name,
                            level: level,
                            specialist: specialist,
                            phoneNumber: phoneNumber,
                          ),
                        );
                    Navigator.pop(context);
                  }
                },
                text: "Add Doctor",
              )
            ],
          ),
        ),
      ),
    );
  }
  void selectImageDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      backgroundColor: Colors.white,
      builder: (BuildContext bc) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                color: Colors.white,
                padding:  EdgeInsets.all(16.h),
                height: 150.h, // MediaQuery.of(context).size.height * 0.6,
                child: Column(children: [
                  ListTile(
                    leading: const Icon(Icons.photo_library),
                    title:  Text(
                      "Gallery",
                      style: TextStyle(color: Colors.blue, fontSize: 16.sp,),
                    ),
                    onTap: () async {
                      await _getFromGallery().then((value) {
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


  void selectCategoryDialog(ValueChanged<CategoryItem> categoryItem) {
    showCupertinoModalBottomSheet(
      topRadius:  Radius.circular(24.r),
      context: context,
      barrierColor: Colors.grey.withOpacity(0.3),
      builder: (context) => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 200,
        child: StatefulBuilder(
          builder: (BuildContext context, setState) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.white,
              body: StreamBuilder<List<CategoryItem>>(
                stream: context.read<CategoryViewModel>().getCategories(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    Center(child: Text(snapshot.error.toString()));
                  } else if (snapshot.hasData) {
                    final categories = snapshot.data!;
                    return ListView(
                      padding:  EdgeInsets.symmetric(
                          vertical: 20.h, horizontal: 12.w),
                      children: categories
                          .map((category) => ListTile(
                        title: Text(
                          category.categoryName,
                          style:  TextStyle(
                            fontSize: 20.sp,
                            color: Colors.black,
                          ),
                        ),
                        onTap: () {
                          categoryItem.call(category);
                          Navigator.pop(context);
                        },
                      ))
                          .toList(),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }




  Future<void> _getFromGallery() async {
    final selectedImage = await _picker.pickMultiImage(
      maxWidth: 720.w,
      maxHeight: 720.h,
    );
    if(selectedImage!.isNotEmpty){
      images.addAll(selectedImage);
    }
    imageUrl = await context.read<FileViewModel>().uploadDoctorImages(context, images);
    setState(() {});
  }


}
