import 'package:start_it_up/layer_fonctional/objectif/domain/entity/objectif.dart';

import '../../../../layer_technical/version/domain/version.dart';
import '../../domain/entity/project.dart';

List<String> _listProjectName = ["YOTTACITY", "Kalydian", "Tour de site"];

List<Project> staticListProject() {
  List<Project> toGenerateProjectList = List.empty(growable: true);

  for (
    int projectIndex = 0;
    projectIndex < _listProjectName.length;
    projectIndex++
  ) {
    final String projectName = _listProjectName[projectIndex];

    if (toGenerateProjectList
            .where((project) => project.name == projectName)
            .length >
        0) {
      continue;
    }

    toGenerateProjectList.add(
      Project(
        id: projectIndex,
        name: projectName,
        version: Version.faker(projectIndex),
        listObjectif: List.generate(
          projectIndex + 1,
          (objIndex) => Objectif.faker(objIndex),
        ),
      ),
    );
  }

  return toGenerateProjectList;
}
