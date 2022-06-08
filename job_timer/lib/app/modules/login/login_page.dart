import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
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
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(primary: Colors.grey[100]),
                  child: Image.asset('assets/images/google.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
