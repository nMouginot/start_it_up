import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';

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
  includes: [ObjectifMapper()],
)
class ProjectMapper extends $ProjectMapper {
  const ProjectMapper();
}
