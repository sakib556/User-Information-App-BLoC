import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:test_rest_api_flutter/repository/user_repository.dart';
import 'package:test_rest_api_flutter/views/auth/intro_pages.dart';
import 'package:test_rest_api_flutter/views/auth/login_screen.dart';
import 'package:test_rest_api_flutter/views/style/app_colors.dart';

class IntroScreen extends StatefulWidget {
  final UserRepository userRepository;
  const IntroScreen({Key? key, required this.userRepository}) : super(key: key);

  @override
   State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  bool clicked = false;
  void afterIntroComplete() {
    setState(() {
      clicked = true;
    });
  }

 
  @override
  Widget build(BuildContext context) {
    return clicked
        ? LoginScreen(
            userRepository: widget.userRepository,
          )
        : IntroductionScreen(
            pages: introPages,
            onDone: () {
              afterIntroComplete();
            },
            onSkip: () {
              afterIntroComplete();
            },
            showSkipButton: true,
            skip: const Text('Skip',
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.grey)),
            next: const Icon(Icons.navigate_next),
            done: const Text("DONE",
                style: TextStyle(fontWeight: FontWeight.w600)),
            dotsDecorator: DotsDecorator(
                size: const Size.square(7.0),
                activeSize: const Size(20.0, 5.0),
                activeColor: AppColors.mainColor,
                color: Colors.black12,
                spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          );
  }
}

