import "package:workout_ui/models/workout.dart";

List<Workout> workouts = [
  Workout(
    name: "Chest Workout",
    protip:
        "Pro Tip: \nFocus on sitting \"back\" and down, Keep you knees \"pushed\" outwards.",
    exercises: <Exercise>[
      Exercise(
        name: "Standerds Push-Ups",
        protip:
            "Pro Tip: \nFocus on sitting \"back\" and down, Keep you knees \"pushed\" outwards.",
        isDone: false,
        sets: [
          Set(reps: 10, kgs: 10, isChecked: false),
          Set(reps: 10, kgs: 10, isChecked: false),
        ],
      ),
      Exercise(
        name: "Chest Dips",
        protip: "Pro Tip: \nKeep your knees \"pushed\" outwards.",
        isDone: false,
        sets: [
          Set(reps: 10, kgs: 10, isChecked: false),
          Set(reps: 10, kgs: 10, isChecked: false),
          Set(reps: 10, kgs: 10, isChecked: false),
          Set(reps: 10, kgs: 10, isChecked: false),
          Set(reps: 10, kgs: 10, isChecked: false),
        ],
      ),
      Exercise(
        name: "Bench Press",
        protip:
            "Pro tip: \nTry and keep your elbows at around a 90-degree angle.",
        isDone: false,
        sets: [
          Set(reps: 10, kgs: 10, isChecked: false),
          Set(reps: 10, kgs: 10, isChecked: false),
          Set(reps: 10, kgs: 10, isChecked: false),
          Set(reps: 10, kgs: 10, isChecked: false),
          Set(reps: 10, kgs: 10, isChecked: false),
        ],
      ),
      Exercise(
        name: "Dumbbell Bench",
        protip:
            "Pro tip: \nBe sure to use your core stability throughout the movement.",
        isDone: false,
        sets: [
          Set(reps: 10, kgs: 10, isChecked: false),
          Set(reps: 10, kgs: 10, isChecked: false),
        ],
      ),
    ],
  ),
];
