// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryItem _$CategoryItemFromJson(Map<String, dynamic> json) => CategoryItem(
      categoryId: json['id'] as String? ?? '',
      description: json['description'] as String? ?? '',
      categoryName: json['category_name'] as String? ?? '',
      categoryImg: json['category_img'] as String? ?? '',
    );

Map<String, dynamic> _$CategoryItemToJson(CategoryItem instance) =>
    <String, dynamic>{
      'id': instance.categoryId,
      'category_name': instance.categoryName,
      'description': instance.description,
      'category_img': instance.categoryImg,
    };
