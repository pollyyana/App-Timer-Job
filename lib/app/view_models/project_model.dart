import 'package:job_time/app/entities/project.dart';
import 'package:job_time/app/entities/project_status.dart';
// import 'package:job_time/app/entities/project_task.dart';

import 'project_task_model.dart';

class ProjectModel {
  final int? id;
  final String name;
  final int estimate;
  final ProjectStatus status;
  final List<ProjectTaskModel> tasks;

  ProjectModel({
    this.id,
    required this.name,
    required this.estimate,
    required this.status,
    required this.tasks,
  });

  factory ProjectModel.fromEntity(Project project) {
    project.task.loadSync();

    return ProjectModel(
      id: project.id,
      name: project.name,
      estimate: project.estimate,
      status: project.status,
      tasks: project.task.map(ProjectTaskModel.fromEntity).toList(),
    );
  }
}
