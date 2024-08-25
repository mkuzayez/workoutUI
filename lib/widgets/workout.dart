import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workout_ui/models/text_styling.dart';
import 'package:workout_ui/models/workout.dart';
import 'package:workout_ui/provider/counter.dart';
import 'package:workout_ui/widgets/exercise_item.dart';
import 'package:workout_ui/widgets/video_player.dart';

class WorkoutWidget extends ConsumerStatefulWidget {
  const WorkoutWidget({super.key, required this.workout});

  final Workout workout;

  @override
  ConsumerState<WorkoutWidget> createState() => _WorkoutWidgetState();
}

class _WorkoutWidgetState extends ConsumerState<WorkoutWidget> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
              0, screenSize.width * 0.018, 0, screenSize.width * 0.018),
          child: SizedBox(
            height: 211,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              clipBehavior: Clip.hardEdge,
              child: const ExerciseVideoAppinio(),
            ),
          ),
        ),
        AppText(text: widget.workout.name, size: "large"),
        Padding(
          padding: EdgeInsets.fromLTRB(
              0, screenSize.width * 0.018, 0, screenSize.width * 0.018),
          child: AppText(
            // protip
            text: widget.workout.protip,
            size: "small",
            color: Colors.grey[600],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
              0, screenSize.width * 0.025, 0, screenSize.width * 0.025),
          child: Row(
            children: [
              const AppText(text: "Exercises", size: "large"),
              const Spacer(),
              AppText(
                text:
                    "${ref.watch(counterProvider)}/${widget.workout.exercises.length}",
                size: "large",
                color: const Color.fromARGB(255, 255, 100, 0),
              ),
            ],
          ),
        ),
        for (int index = 0; index < widget.workout.exercises.length; index++)
          ExerciseItem(
            exercise: widget.workout.exercises[index],
          )
      ],
    );
  }
}
