part of 'workout_bloc.dart';

@immutable
abstract class WorkoutState {}

class WorkoutInitial extends WorkoutState {
  // final bool isChecked;

  // WorkoutInitial(this.isChecked);
}

class UpdatedExercise extends WorkoutState {
  final Exercise updatedExercise;

  UpdatedExercise(this.updatedExercise);
}

class UpdatedSet extends WorkoutState {
  final Set updatedSet;

  UpdatedSet(this.updatedSet);
}

class CounterState extends WorkoutState {
  final int count;

  CounterState(this.count);

}
