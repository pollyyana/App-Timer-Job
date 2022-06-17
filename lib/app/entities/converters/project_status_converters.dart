import 'package:isar/isar.dart';
import 'package:job_time/app/entities/project_status.dart';

class ProjectStatusConverters extends TypeConverter<ProjectStatus, int> {
  const ProjectStatusConverters();

  @override
  ProjectStatus fromIsar(int object) {
    return ProjectStatus.values[object];
  }

  @override
  int toIsar(ProjectStatus object) {
    return object.index;
  }
}
