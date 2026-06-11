import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:start_it_up/layer_technical/version/data/dto/version_dto.dart';
import 'package:start_it_up/layer_technical/version/domain/version.dart';

import 'version_mapper.auto_mappr.dart';

@AutoMappr([MapType<VersionDto, Version>(reverse: true)])
class VersionMapper extends $VersionMapper {
  const VersionMapper();
}
