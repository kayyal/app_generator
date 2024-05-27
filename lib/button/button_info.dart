import 'package:gold_cherry_app_generator/button/button_action.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'button_info.g.dart';

@JsonSerializable(explicitToJson: true)
@CopyWith(copyWithNull: true)
class ButtonInfo {
  final ButtonActionInfo action;

  ButtonInfo({
    required this.action,
  });

  factory ButtonInfo.fromJson(Map<String, dynamic> json) =>
      _$ButtonInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ButtonInfoToJson(this);
}
