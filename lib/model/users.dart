// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:pepcorns_llp/model/general_model.dart';

part 'users.g.dart';

@JsonSerializable()
class Users {
  List<GeneralModel>? response;
  Users({
    this.response,
  });

  Map<String, dynamic> toJson() => _$UsersToJson(this);
  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
}
