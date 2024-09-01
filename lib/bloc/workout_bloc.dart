import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:workout_ui/models/workout.dart';
import 'package:workout_ui/data/dummy_data.dart';

part 'workout_event.dart';
part 'workout_state.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  WorkoutBloc() : super(WorkoutInitial()) {
    on<ToggleMainCheckButton>(toggleMainCheckButton);
    on<ToggleCheckButton>(toggleCheckButton);
  }

  int counter() {
    return workouts
        .expand((workout) => workout.exercises)
        .where((exercise) => exercise.isDone)
        .length;
  }

  void toggleMainCheckButton(
      ToggleMainCheckButton event, Emitter<WorkoutState> emit) {
    Exercise exercise = event.exercise;

    if (!exercise.isDone) {
      exercise.isDone = !exercise.isDone;

      for (int i = 0; i < exercise.sets.length; i++) {
        exercise.sets[i].isChecked = true;
      }
    } else {
      exercise.isDone = !exercise.isDone;
      for (int i = 0; i < exercise.sets.length; i++) {
        exercise.sets[i].isChecked = exercise.isDone;
      }
    }
    
    emit(UpdatedExercise(exercise));

  }

  void toggleCheckButton(ToggleCheckButton event, Emitter<WorkoutState> emit) {
    Exercise exercise = event.exercise;
    Set set = event.set;
    if (!set.isChecked) {
      set.isChecked = true;
      bool isFinished = exercise.sets.every((element) => element.isChecked);
      exercise.isDone = isFinished;
    } else {
      set.isChecked = false;
      bool isFinished = exercise.sets.every((element) => element.isChecked);
      exercise.isDone = isFinished;
    }
    emit(UpdatedSet(set));
  }
}
