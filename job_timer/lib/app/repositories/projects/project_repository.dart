import 'package:job_time/app/entities/project.dart';

abstract class ProjectRepository {
  Future<void> register(Project project);
}
