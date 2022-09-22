import 'category_item.dart';

class UpdateCategoryArgs {
  UpdateCategoryArgs({required this.categoryItem, required this.docId});

  final CategoryItem categoryItem;
  final String docId;
}