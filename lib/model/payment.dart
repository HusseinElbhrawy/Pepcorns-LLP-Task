// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'general_model.dart';

part 'payment.g.dart';

@JsonSerializable()
class Payment {
  List<GeneralModel>? response;
  Payment({
    this.response,
  });

  Map<String, dynamic> toJson() => _$PaymentToJson(this);
  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);
}
