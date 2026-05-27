import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';

import '../../domain/entity/user.dart';
import '../dto/user_dto.dart';

import 'user_mapper.auto_mappr.dart';

@AutoMappr([MapType<UserDto, User>(reverse: true)])
class UserMapper extends $UserMapper {
  const UserMapper();
}
