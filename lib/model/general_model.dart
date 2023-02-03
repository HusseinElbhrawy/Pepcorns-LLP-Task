// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'general_model.g.dart';

@JsonSerializable()
class GeneralModel {
  int? id;
  @JsonKey(name: 'user_id')
  String? userId;
  String? name;
  int? age;
  @JsonKey(name: 'pay_id')
  String? payId;
  @JsonKey(name: 'pay_ref')
  String? paymentReference;
  int? amount;
  int? status;

  GeneralModel({
    this.id,
    this.userId,
    this.name,
    this.age,
    this.payId,
    this.paymentReference,
    this.amount,
    this.status,
  });

  Map<String, dynamic> toJson() => _$GeneralModelToJson(this);
  factory GeneralModel.fromJson(Map<String, dynamic> json) =>
      _$GeneralModelFromJson(json);
}
