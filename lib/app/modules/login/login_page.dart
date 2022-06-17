// import 'package:asuka/asuka.dart';
import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_time/app/modules/login/controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller;

  const LoginPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return BlocListener<LoginController, LoginState>(
      bloc: controller,
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == LoginStatus.failure) {
          final message = state.errorMessage ?? 'Erro ao realizar login';
          AsukaSnackbar.alert(message).show();
        }
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 30, 52, 59),
                Color(0XFF0167B2),
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png'),
                SizedBox(
                  height: screenSize.height * .1,
                ),
                SizedBox(
                  width: screenSize.width * .8,
                  height: 49,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.singIn();
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.grey[100]),
                    child: Image.asset('assets/images/google.png'),
                  ),
                ),
                BlocSelector<LoginController, LoginState, bool>(
                  bloc: controller,
                  selector: (state) => state.status == LoginStatus.loading,
                  builder: (context, show) {
                    return Visibility(
                      visible: show,
                      child: const Padding(
                        padding: EdgeInsets.only(top: 15.0),
                        child: Center(
                          child: CircularProgressIndicator.adaptive(
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
