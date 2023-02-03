// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Users _$UsersFromJson(Map<String, dynamic> json) => Users(
      response: (json['response'] as List<dynamic>?)
          ?.map((e) => GeneralModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
      'response': instance.response,
    };
