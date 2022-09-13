import 'package:flutter/material.dart';
import 'package:student/constant/color/colors.dart';

class DeleteDialogWidget extends StatelessWidget {
  const DeleteDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
        child: Text(
          "Alert!!!",
        ),
      ),
      content: const Text("Do You Want To Delete"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            "Cancel",
            style: TextStyle(
              color: kblack,
            ),
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kblack),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            "Ok",
            style: TextStyle(
              color: kwhite,
            ),
          ),
        ),
      ],
    );
  }
}
