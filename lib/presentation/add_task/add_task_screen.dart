import 'package:api_test/application/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/custom_textfield.dart';

class ScreenAddTask extends StatelessWidget {
  const ScreenAddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo '),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        children: [
          CustomTextField(
            controller: titleController,
            label: 'Title',
            minLines: 1,
            maxLines: 2,
          ),
          CustomTextField(
            controller: descriptionController,
            label: 'Discription',
            minLines: 3,
            maxLines: 6,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 20),
            child: ElevatedButton(
              onPressed: () {
                // print("*******************${titleController.text}");
                // print("*******************${descriptionController.text}");
                Provider.of<HomeProvider>(context, listen: false)
                    .onSubmit(titleController.text, descriptionController.text);
                titleController.clear();
                descriptionController.clear();
              },
              style: ElevatedButton.styleFrom(fixedSize: const Size(100, 40)),
              child: const Text('Add'),
            ),
          )
        ],
      ),
    );
  }
}

TextEditingController titleController = TextEditingController();
TextEditingController descriptionController = TextEditingController();
