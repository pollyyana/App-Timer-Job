// ignore_for_file: prefer_final_fields

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:job_time/app/entities/project_status.dart';
import 'package:job_time/app/services/projects/project_service.dart';
import 'package:job_time/app/view_models/project_model.dart';

part 'project_register_state.dart';

class ProjectRegisterController extends Cubit<ProjectRegisterStatus> {
  ProjectService _projectService;

  ProjectRegisterController({required ProjectService projectService})
      : _projectService = projectService,
        super(ProjectRegisterStatus.initial);

  Future<void> register(String name, int estimate) async {
    try {
      emit(ProjectRegisterStatus.loading);
      final project = ProjectModel(
          name: name,
          estimate: estimate,
          status: ProjectStatus.em_andamento,
          tasks: []);
      await _projectService.register(project);
      emit(ProjectRegisterStatus.success);
    } catch (e, s) {
      log('erro ao salvar', error: e, stackTrace: s);
      emit(ProjectRegisterStatus.failure);
    }
  }
}
