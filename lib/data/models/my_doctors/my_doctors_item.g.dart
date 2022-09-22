// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_doctors_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyDoctorsItem _$MyDoctorsItemFromJson(Map<String, dynamic> json) =>
    MyDoctorsItem(
      createdAt: DateTime.parse(json['created_at'] as String),
      userId: json['user_id'] as String? ?? '',
      totalPrice: (json['total_price'] as num?)?.toDouble() ?? 0.0,
      orderProductName: json['order_product_name'] as String? ?? '',
      doctorId: json['doctor_id'] as String? ?? '',
      myDoctorId: json['my_doctor_id'] as String? ?? '',
      doctorImages: (json['doctor_images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      specialist: json['specialist'] as String? ?? '',
    );

Map<String, dynamic> _$MyDoctorsItemToJson(MyDoctorsItem instance) =>
    <String, dynamic>{
      'doctor_id': instance.doctorId,
      'specialist': instance.specialist,
      'doctor_images': instance.doctorImages,
      'my_doctor_id': instance.myDoctorId,
      'total_price': instance.totalPrice,
      'user_id': instance.userId,
      'order_product_name': instance.orderProductName,
      'created_at': instance.createdAt.toIso8601String(),
    };
