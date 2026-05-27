// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'user_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserDtoCWProxy {
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored.
  ///
  /// Example:
  /// ```dart
  /// UserDto(...).copyWith(id: 12, name: "My name")
  /// ```
  UserDto call({int? id, String? email, String? lastName, String? firstName});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfUserDto.copyWith(...)`.
class _$UserDtoCWProxyImpl implements _$UserDtoCWProxy {
  const _$UserDtoCWProxyImpl(this._value);

  final UserDto _value;

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored.
  ///
  /// Example:
  /// ```dart
  /// UserDto(...).copyWith(id: 12, name: "My name")
  /// ```
  UserDto call({
    Object? id = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? lastName = const $CopyWithPlaceholder(),
    Object? firstName = const $CopyWithPlaceholder(),
  }) {
    return UserDto(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      lastName: lastName == const $CopyWithPlaceholder()
          ? _value.lastName
          // ignore: cast_nullable_to_non_nullable
          : lastName as String?,
      firstName: firstName == const $CopyWithPlaceholder()
          ? _value.firstName
          // ignore: cast_nullable_to_non_nullable
          : firstName as String?,
    );
  }
}

extension $UserDtoCopyWith on UserDto {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfUserDto.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$UserDtoCWProxy get copyWith => _$UserDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
  id: JsonParsers.idFromJson(json['id']),
  email: json['email'] as String?,
  lastName: json['last_name'] as String?,
  firstName: json['first_name'] as String?,
);

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
  'id': JsonParsers.idToJson(instance.id),
  'email': instance.email,
  'last_name': instance.lastName,
  'first_name': instance.firstName,
};
