import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';

import '../../domain/entity/objectif.dart';
import '../dto/objectif_dto.dart';

import 'objectif_mapper.auto_mappr.dart';

@AutoMappr([MapType<ObjectifDto, Objectif>(), MapType<Objectif, ObjectifDto>()])
class ObjectifMapper extends $ObjectifMapper {
  const ObjectifMapper();
}
