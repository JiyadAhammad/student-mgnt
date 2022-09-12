import 'package:flutter/material.dart';
import 'package:student/constant/color/colors.dart';
import 'package:student/constant/size/sized_box.dart';
import 'package:student/presentation/form_widget/widget/text_form_widget.dart';

final nameController = TextEditingController();
final ageController = TextEditingController();
final domainController = TextEditingController();
final phoneController = TextEditingController();

class Formwidget extends StatelessWidget {
  const Formwidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kblack,
        title: const Text(
          'Add Details',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const CircleAvatar(
                radius: 80,
                backgroundColor: kblack,
              ),
              kheight20,
              TextFormWidget(
                hintText: 'Enter Name',
                prefixIcon: Icons.person,
                controller: nameController,
              ),
              kheight,
              TextFormWidget(
                prefixIcon: Icons.numbers,
                keyboardType: const TextInputType.numberWithOptions(),
                hintText: 'Enter Age',
                controller: ageController,
              ),
              kheight,
              TextFormWidget(
                prefixIcon: Icons.domain_verification,
                hintText: 'Enter Domain',
                controller: domainController,
              ),
              kheight,
              TextFormWidget(
                prefixIcon: Icons.phone_android,
                keyboardType: const TextInputType.numberWithOptions(),
                hintText: 'Phone No :',
                controller: phoneController,
              ),
              kheight20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blueGrey)),
                      onPressed: () {},
                      child: const Text(
                        'Cancel',
                      ),
                    ),
                  ),
                  kwidth20,
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'ok',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
