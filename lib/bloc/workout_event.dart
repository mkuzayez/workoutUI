part of 'workout_bloc.dart';

@immutable
abstract class WorkoutEvent {}

class ToggleMainCheckButton extends WorkoutEvent {
  final Exercise exercise;

  ToggleMainCheckButton(this.exercise);
}

class ToggleCheckButton extends WorkoutEvent {
  final Set set;
  final Exercise exercise;

  ToggleCheckButton(this.exercise, this.set);
}

class Counter extends WorkoutEvent {
  final int counter;

  Counter(this.counter);
}
