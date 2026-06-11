import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:start_it_up/layer_technical/version/domain/mapper/version_mapper.dart';

import '../../../objectif/data/mapper/objectif_mapper.dart';
import '../../domain/entity/project.dart';
import '../dto/project_dto.dart';

import 'project_mapper.auto_mappr.dart';

@AutoMappr(
  [
    MapType<ProjectDto, Project>(
      fields: [Field('listObjectif', from: 'objectifs')],
    ),
    MapType<Project, ProjectDto>(
      fields: [Field('objectifs', from: 'listObjectif')],
    ),
  ],
  includes: [ObjectifMapper(), VersionMapper()],
)
class ProjectMapper extends $ProjectMapper {
  const ProjectMapper();
}
