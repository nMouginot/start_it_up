import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../layer_technical/api/data/json_parsers.dart';

part 'user_dto.g.dart';

@CopyWith()
@JsonSerializable()
class UserDto {
  @JsonKey(fromJson: JsonParsers.idFromJson, toJson: JsonParsers.idToJson)
  final int? id;

  final String? email;

  @JsonKey(name: 'last_name')
  final String? lastName;

  @JsonKey(name: 'first_name')
  final String? firstName;

  const UserDto({
    required this.id,
    required this.email,
    required this.lastName,
    required this.firstName,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
