import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoarding extends StatelessWidget {
  static const String routeName = '/onboarding';
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: 'Welcome to My App',
            body: 'This is the first page of the onboarding process.',
            image: Image.asset('assets/images/Illustration_Onboarding_1.png'),
          ),
          PageViewModel(
            title: 'Discover Features',
            body: 'Learn about the features of our app.',
            image: Image.asset('assets/images/Illustration_Onboarding_2.png'),
          ),
          PageViewModel(
            title: 'Get Started',
            body: 'Let\'s get started using the app!',
            image: Image.asset('assets/images/Illustration_Onboarding_3.png'),
          ),
        ],
        onDone: () {
          Navigator.pushReplacementNamed(context, '/');
        },
        showSkipButton: true,
        skip: const Text('Skip'),
        next: const Icon(Icons.arrow_forward),
        done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      ),
    );
  }
}
