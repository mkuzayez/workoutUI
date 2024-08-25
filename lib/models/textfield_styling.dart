import 'package:flutter/material.dart';

class AppTextfield extends StatelessWidget {
  const AppTextfield({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final TextEditingController value = TextEditingController();

    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        width: 80,
        height: 20,
        child: TextFormField(
          controller: value,
          initialValue: text,
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
                Radius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
