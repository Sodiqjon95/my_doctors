
import 'package:json_annotation/json_annotation.dart';

// category_img "https://www.pinclipart.com/picdir/middle/185-1855107_ear-otology-conditions-in-boise-id-skype-logo.png"(string)
// category_name "ear doctor"
// description "information about doctors"
// id "bir"

part 'category_item.g.dart';

@JsonSerializable()
class CategoryItem {
  @JsonKey(defaultValue: "", name: "id")
  String categoryId;

  @JsonKey(defaultValue: "", name: "category_name")
  String categoryName;

  @JsonKey(defaultValue: "", name: "description")
  String description;

  @JsonKey(defaultValue: "", name: "category_img")
  String categoryImg;

  CategoryItem({
    required this.categoryId,
    required this.description,
    required this.categoryName,
    required this.categoryImg

  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) =>
      _$CategoryItemFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryItemToJson(this);
}