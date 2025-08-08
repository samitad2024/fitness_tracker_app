import 'package:fitness_tracker_app/screens/workout_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class onboardingScreen extends StatelessWidget {
  const onboardingScreen({super.key});

  get showNextButton => null;
  

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Welcome to Fitness Tracker",
          body: "Track your fitness journey with ease and motivation.",
          image: const FlutterLogo(size: 100),
        ),
        PageViewModel(
            title: "Set Your Goals",
            body: "Define your fitness goals and stay on track.",
            image: const FlutterLogo(size: 100)),
        PageViewModel(
          title: "Monitor Your Progress",
          body: "Keep an eye on your achievements and improvements.",
          image: const FlutterLogo(size: 100),
        ),
      ],
      showNextButton: true,
      next: const Text("Next"),
      done: const Text("Done"),
      onDone: () => _onDone(context),
    );
  }

  void _onDone(BuildContext context) async {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const WorkoutListScreen()),
    );
  }
}
