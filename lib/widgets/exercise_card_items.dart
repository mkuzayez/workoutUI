import 'package:flutter/material.dart';
import 'package:workout_ui/models/workout.dart';

class Sets extends StatelessWidget {
  const Sets({super.key, required this.exercise});

  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (int i = 0; i < exercise.sets.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 13.5, 0, 13.5),
            child: Text(
              "${i + 1}",
              style:
                  const TextStyle(fontSize: 16.5, fontWeight: FontWeight.w600),
            ),
          ),
      ],
    );
  }
}

class Reps extends StatelessWidget {
  const Reps({super.key, required this.exercise});

  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (int i = 0; i < exercise.sets.length; i++)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 80,
              height: 35,
              child: TextFormField(
                textAlignVertical: TextAlignVertical.top,
                initialValue: "${exercise.sets[i].reps}",
                style: TextStyle(
                    height: 0,
                    fontSize: screenSize.width * 0.037,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class Kgs extends StatelessWidget {
  const Kgs({super.key, required this.exercise});

  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (int i = 0; i < exercise.sets.length; i++)
          Form(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 80,
                height: 35,
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.top,
                  initialValue: "${exercise.sets[i].kgs}",
                  style: TextStyle(
                      fontSize: screenSize.width * 0.037,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class Checks extends StatefulWidget {
  const Checks(
      {super.key, required this.exercise, required this.toggleCheckButton});

  final Exercise exercise;
  final void Function(Exercise exercise, Set set) toggleCheckButton;

  @override
  State<Checks> createState() => _ChecksState();
}

class _ChecksState extends State<Checks> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (int i = 0; i < widget.exercise.sets.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 1.5, 0, 1.5),
            child: IconButton(
              color: widget.exercise.sets[i].isChecked
                  ? const Color.fromARGB(255, 255, 100, 0)
                  : Colors.white,
              padding: const EdgeInsets.all(0),
              constraints: const BoxConstraints(),
              onPressed: () {
                widget.toggleCheckButton(
                    widget.exercise, widget.exercise.sets[i]);
              },
              icon: const Icon(
                Icons.check_box_outlined,
              ),
            ),
          ),
      ],
    );
  }
}


// InkWell(
//               onTap: () {
//                 widget.toggleCheckButton(
//                     widget.exercise, widget.exercise.sets[i]);
//               },
//               child: Icon(
//                 Icons.check_box_rounded,
//                 color: widget.exercise.sets[i].isChecked
//                     ? const Color.fromARGB(255, 255, 100, 0)
//                     : Colors.white,
//               ),
//             ),


            // padding: EdgeInsets.zero,
            // constraints: const BoxConstraints(),
            // icon: const Icon(Icons.check_box_rounded),
            // onPressed: () {
            //   widget.toggleCheckButton(
            //       widget.exercise, widget.exercise.sets[i]);
            // },
            // color: widget.exercise.sets[i].isChecked
            //     ? const Color.fromARGB(255, 255, 100, 0)
            //     : Colors.white,