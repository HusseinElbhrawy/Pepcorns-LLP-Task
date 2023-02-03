// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneralModel _$GeneralModelFromJson(Map<String, dynamic> json) => GeneralModel(
      id: json['id'] as int?,
      userId: json['user_id'] as String?,
      name: json['name'] as String?,
      age: json['age'] as int?,
      payId: json['pay_id'] as String?,
      paymentReference: json['pay_ref'] as String?,
      amount: json['amount'] as int?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$GeneralModelToJson(GeneralModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'age': instance.age,
      'pay_id': instance.payId,
      'pay_ref': instance.paymentReference,
      'amount': instance.amount,
      'status': instance.status,
    };
