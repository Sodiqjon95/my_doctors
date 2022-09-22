// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctors_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorsItem _$DoctorsItemFromJson(Map<String, dynamic> json) => DoctorsItem(
      createdAt: DateTime.parse(json['created_at'] as String),
      categoryId: json['category_id'] as String? ?? '',
      description: json['description'] as String? ?? '',
      doctorId: json['doctor_id'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      doctorImages: (json['doctor_images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      doctorName: json['doctor_name'] as String? ?? '',
      level: json['level'] as int? ?? 0,
      specialist: json['specialist'] as String? ?? '',
      phoneNumber: json['phone_number'] as String? ?? '',
    );

Map<String, dynamic> _$DoctorsItemToJson(DoctorsItem instance) =>
    <String, dynamic>{
      'doctor_id': instance.doctorId,
      'category_id': instance.categoryId,
      'level': instance.level,
      'price': instance.price,
      'doctor_name': instance.doctorName,
      'description': instance.description,
      'specialist': instance.specialist,
      'phone_number': instance.phoneNumber,
      'doctor_images': instance.doctorImages,
      'created_at': instance.createdAt.toIso8601String(),
    };
