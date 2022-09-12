import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  final IconData prefixIcon;
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  const TextFormWidget(
      {Key? key,
      required this.prefixIcon,
      required this.hintText,
      this.keyboardType = TextInputType.name,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        hintText: hintText,
        // errorText: 'Invalid',
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}