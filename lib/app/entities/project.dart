import 'package:isar/isar.dart';
import 'package:job_time/app/entities/converters/project_status_converters.dart';
import 'package:job_time/app/entities/project_status.dart';
import 'package:job_time/app/entities/project_task.dart';

part 'project.g.dart';

@Collection()
class Project {
  @Id()
  int? id;

  late String name;
  late int estimate;

  @ProjectStatusConverters()
  late ProjectStatus status;

  final task = IsarLinks<ProjectTask>();
}
