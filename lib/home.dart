import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workout_ui/bloc/workout_bloc.dart';
import 'package:workout_ui/data/dummy_data.dart';
import 'package:workout_ui/widgets/workout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const int workoutIdx = 0;

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: Container(
        width: double.maxFinite,
        color: const Color.fromARGB(245, 21, 21, 21),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(35, 15, 35, 15),
          child: ElevatedButton(
            clipBehavior: Clip.hardEdge,
            onPressed: () {},
            style: ButtonStyle(
              fixedSize: WidgetStatePropertyAll(
                Size(screenSize.width * 0.8, screenSize.height * 0.07),
              ),
              backgroundColor: const WidgetStatePropertyAll(
                Color.fromARGB(255, 255, 100, 0),
              ),
              shape: const WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
              ),
            ),
            child: const Text(
              "Next Workout",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: const Color.fromARGB(255, 21, 21, 21),
      body: SizedBox(
        height: double.maxFinite,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22, 50, 22, 100),
            child: ProviderScope(
              child: BlocProvider(
                create: (context) => WorkoutBloc()..counter(),
                child: WorkoutWidget(
                  workout: workouts[workoutIdx],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
