// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payment _$PaymentFromJson(Map<String, dynamic> json) => Payment(
      response: (json['response'] as List<dynamic>?)
          ?.map((e) => GeneralModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
      'response': instance.response,
    };
