import 'package:json_annotation/json_annotation.dart';

part 'my_doctors_item.g.dart';

@JsonSerializable()
class MyDoctorsItem {
  @JsonKey(defaultValue: "", name: "doctor_id")
  String doctorId;

  @JsonKey(defaultValue: "", name: "specialist")
  String specialist;

  @JsonKey(defaultValue: [], name: "doctor_images")
  List<String>  doctorImages;

  @JsonKey(defaultValue: "", name: "my_doctor_id")
  String myDoctorId;

  @JsonKey(defaultValue: 0.0, name: "total_price")
  double totalPrice;

  @JsonKey(defaultValue: "", name: "user_id")
  String userId;

  @JsonKey(defaultValue: "", name: "order_product_name")
  String orderProductName;

  @JsonKey(name: "created_at")
  DateTime createdAt;

  MyDoctorsItem({
    required this.createdAt,
    required this.userId,
    required this.totalPrice,
    required this.orderProductName,
    required this.doctorId,
    required this.myDoctorId,
    required this.doctorImages,
    required this.specialist
  });

  factory MyDoctorsItem.fromJson(Map<String, dynamic> json) =>
      _$MyDoctorsItemFromJson(json);

  Map<String, dynamic> toJson() => _$MyDoctorsItemToJson(this);
}