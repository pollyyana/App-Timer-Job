import 'package:flutter/material.dart';
// import 'package:job_time/app/core/ui/job_timer_icons.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0XFF0092B9),
              Color(0XFF0167B2),
            ],
          ),
        ),
        child: Center(child: Image.asset('assets/images/logo.png')),
      ),
    );
  }
}
// Container(),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               decoration: InputDecoration(label: Text('input xx')),
//             ),
//           ),
//           ElevatedButton(onPressed: () {}, child: Text('BOTAO')),
//           Icon(
//             JobTimerIcons.angle_double_right,
//             size: 50,
//           ),