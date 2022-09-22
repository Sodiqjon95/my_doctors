import 'package:json_annotation/json_annotation.dart';

part 'doctors_item.g.dart';

@JsonSerializable()
class DoctorsItem {
  @JsonKey(defaultValue: "", name: "doctor_id")
  String doctorId;

  @JsonKey(defaultValue: "", name: "category_id")
  String categoryId;

  @JsonKey(defaultValue: 0, name: "level")
  int level;

  @JsonKey(defaultValue: 0.0, name: "price")
  double price;

  @JsonKey(defaultValue: "", name: "doctor_name")
  String doctorName;

  @JsonKey(defaultValue: "", name: "description")
  String description;

  @JsonKey(defaultValue: "", name: "specialist")
  String specialist;

  @JsonKey(defaultValue: "", name: "phone_number")
  String phoneNumber;


  @JsonKey(defaultValue: [], name: "doctor_images")
  List<String>  doctorImages;

  @JsonKey(name: "created_at")
  DateTime createdAt;

  DoctorsItem({
    required this.createdAt,
    required this.categoryId,
    required this.description,
    required this.doctorId,
    required this.price,
    required this.doctorImages,
    required this.doctorName,
    required this.level,
    required this.specialist,
    required this.phoneNumber,
  });

  factory DoctorsItem.fromJson(Map<String, dynamic> json) =>
      _$DoctorsItemFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorsItemToJson(this);
}