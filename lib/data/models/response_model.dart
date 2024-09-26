import 'package:json_annotation/json_annotation.dart';

part 'response_model.g.dart';

@JsonSerializable()
class ResponseModel {
  @JsonKey(name: 'message', defaultValue: 'NA')
  final String? message;

  @JsonKey(name: 'data')
  final dynamic data;

  const ResponseModel(this.message, this.data);

  factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(json);
}
