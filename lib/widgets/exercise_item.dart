import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workout_ui/models/text_styling.dart';
import 'package:workout_ui/models/workout.dart';
import 'package:workout_ui/widgets/exercise_card.dart';
import 'package:workout_ui/provider/counter.dart';

class ExerciseItem extends ConsumerStatefulWidget {
  const ExerciseItem({
    super.key,
    required this.exercise,
  });

  final Exercise exercise;

  @override
  ConsumerState<ExerciseItem> createState() => _ExerciseItemState();
}

class _ExerciseItemState extends ConsumerState<ExerciseItem> {
  void toggleMainCheckButton(Exercise exercise) {
    setState(() {
      if (!widget.exercise.isDone) {
        widget.exercise.isDone = true;
        for (int i = 0; i < exercise.sets.length; i++) {
          exercise.sets[i].isChecked = true;
        }
        ref.read(counterProvider.notifier).counter();
      } else {
        widget.exercise.isDone = false;
        for (int i = 0; i < exercise.sets.length; i++) {
          exercise.sets[i].isChecked = false;
        }
        ref.read(counterProvider.notifier).counter();
      }
    });
  }

  void toggleCheckButton(Exercise exercise, Set set) {
    set.isChecked = !set.isChecked;
    bool isFinished = exercise.sets.every((element) => element.isChecked);
    setState(() {
      exercise.isDone = isFinished;
      ref.read(counterProvider.notifier).counter();
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, screenSize * 0.015),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppText(
                text: widget.exercise.name,
                size: "medium",
              ),
              const Spacer(),
              IconButton(
                padding: const EdgeInsets.all(0),
                constraints: const BoxConstraints(),
                icon: const Icon(Icons.check_box_outlined,),
                onPressed: () {
                  toggleMainCheckButton(widget.exercise);
                },
                color: widget.exercise.isDone
                    ? const Color.fromARGB(255, 255, 100, 0)
                    : Colors.white,
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, screenSize * 0.015),
            child: AppText(
              text: widget.exercise.protip,
              size: "small",
              color: Colors.grey[600],
            ),
          ),
          ExerciseCard(
              exercise: widget.exercise, toggleCheckButton: toggleCheckButton)
        ],
      ),
    );
  }
}
