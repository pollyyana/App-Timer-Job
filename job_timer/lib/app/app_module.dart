// import 'dart:js';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_time/app/modules/splash/splash_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes =>
      [ChildRoute('/', child: ((context, args) => const SplashPage()))];
}
