import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.minLines,
    required this.maxLines,
    required this.label,
    required this.controller,
  });
  final int minLines;
  final int maxLines;
  final String label;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(label),
      ),
      maxLines: maxLines,
      minLines: minLines,
    );
  }
}