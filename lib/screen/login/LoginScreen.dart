// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';
import 'package:login_flutter_animacao/screen/login/widgets/form_container.dart';
import 'package:login_flutter_animacao/screen/login/widgets/sign_up_buttom.dart';
import 'package:login_flutter_animacao/screen/login/widgets/stagger_animation.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

import '../home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen())
        );
      }
    });
  }

        @override
        void dispose()
    {
      _animationController.dispose();
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      timeDilation = 1;
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/fundoazul.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 70, bottom: 32),
                        child: Image.asset(
                          "images/tickicon.png",
                          width: 150,
                          height: 150,
                          fit: BoxFit.contain,
                        ),
                      ),
                      FormContainer(),
                      SignUpButtom(),
                    ],
                  ),
                  StaggerAnimation(
                    controller: _animationController,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }
