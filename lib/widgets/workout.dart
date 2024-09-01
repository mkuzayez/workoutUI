import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workout_ui/models/text_styling.dart';
import 'package:workout_ui/models/workout.dart';
import 'package:workout_ui/widgets/exercise_card.dart';
import 'package:workout_ui/video_player.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_ui/bloc/workout_bloc.dart';

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
              child: const SizedBox(),
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
              BlocBuilder<WorkoutBloc, WorkoutState>(
                builder: (context, state) {
                    return AppText(
                      text: "${context.read<WorkoutBloc>().counter()}/${widget.workout.exercises.length}",
                      size: "large",
                      color: const Color.fromARGB(255, 255, 100, 0),
                    );
                 
                },
              ),
            ],
          ),
        ),
        for (int index = 0; index < widget.workout.exercises.length; index++)
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, screenSize.width * 0.015),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    AppText(
                      text: widget.workout.exercises[index].name,
                      size: "medium",
                    ),
                    const Spacer(),
                    BlocBuilder<WorkoutBloc, WorkoutState>(
                      builder: (context, state) {
                        final exercise = widget.workout.exercises[index];
                        return IconButton(
                          padding: const EdgeInsets.all(0),
                          constraints: const BoxConstraints(),
                          icon: const Icon(
                            Icons.check_box_outlined,
                          ),
                          onPressed: () {
                            context.read<WorkoutBloc>().add(
                                  ToggleMainCheckButton(
                                    exercise,
                                  ),
                                );
                          },
                          color: exercise.isDone
                              ? const Color.fromARGB(255, 255, 100, 0)
                              : Colors.white,
                        );
                      },
                    )
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.fromLTRB(0, 0, 0, screenSize.width * 0.015),
                  child: AppText(
                    text: widget.workout.exercises[index].protip,
                    size: "small",
                    color: Colors.grey[600],
                  ),
                ),
                ExerciseCard(
                  exercise: widget.workout.exercises[index],
                )
              ],
            ),
          )
      ],
    );
  }
}
