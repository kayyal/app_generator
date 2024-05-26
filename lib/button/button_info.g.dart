// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'button_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ButtonInfo _$ButtonInfoFromJson(Map<String, dynamic> json) => ButtonInfo(
      buttonText: json['buttonText'] as String,
      action: ButtonActionInfo.fromJson(json['action'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ButtonInfoToJson(ButtonInfo instance) =>
    <String, dynamic>{
      'buttonText': instance.buttonText,
      'action': instance.action.toJson(),
    };
