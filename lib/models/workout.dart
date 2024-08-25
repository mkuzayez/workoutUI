class Workout {
  const Workout({
    required this.name,
    required this.protip,
    required this.exercises,
  });

  final String name;
  final String protip;
  final List<Exercise> exercises;
}

class Exercise {
  Exercise({
    required this.name,
    required this.protip,
    required this.isDone,
    required this.sets,
  });

  final String name;
  final String protip;
  bool isDone;
  final List<Set> sets;
}

class Set {
  Set({required this.reps, required this.kgs, required this.isChecked});

   int reps;
   double kgs;
   bool isChecked;
}
