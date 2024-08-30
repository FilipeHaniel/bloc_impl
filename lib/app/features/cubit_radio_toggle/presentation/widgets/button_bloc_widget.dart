import 'package:flutter/material.dart';

class ButtonBlocWidget extends StatelessWidget {
  final String buttonName;
  final Function() action;

  const ButtonBlocWidget({
    required this.buttonName,
    required this.action,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 5),
          ),
          child: Center(
            child: Text(buttonName),
          ),
        ),
      ),
    );
  }
}
