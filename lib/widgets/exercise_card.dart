import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workout_ui/models/workout.dart';
import 'package:workout_ui/widgets/exercise_card_items.dart';
import 'package:workout_ui/models/text_styling.dart';

class ExerciseCard extends ConsumerStatefulWidget {
  const ExerciseCard(
      {super.key, required this.exercise,});

  final Exercise exercise;

  @override
  ConsumerState<ExerciseCard> createState() => _ExerciseCardState();
}

class _ExerciseCardState extends ConsumerState<ExerciseCard> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: 200,
      width: screenSize.width,
      child: Card(
        elevation: 12,
        color: const Color.fromARGB(255, 32, 32, 34),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            screenSize.width * 0.020,
            screenSize.width * 0.035,
            screenSize.width * 0.000,
            screenSize.width * 0.040,
          ),
          child: SizedBox(
            width: screenSize.width,
            child: ListView(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              shrinkWrap: true,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 0, 45, 20),
                          child: AppText(
                            text: "#",
                            color: Color.fromARGB(255, 255, 100, 0),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(21, 0, 20, 20),
                          child: AppText(
                            text: "REPS",
                            color: Color.fromARGB(255, 255, 100, 0),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(40, 0, 50, 20),
                          child: AppText(
                            text: "KGS",
                            color: Color.fromARGB(255, 255, 100, 0),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                          child: AppText(
                            text: "",
                            color: Color.fromARGB(255, 255, 100, 0),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Sets(exercise: widget.exercise),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                          child: Reps(exercise: widget.exercise),
                        ),
                        Kgs(exercise: widget.exercise),
                        Checks(
                            exercise: widget.exercise,)
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
