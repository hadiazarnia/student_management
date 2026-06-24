import 'package:flutter/material.dart';
import 'package:student_management/data.dart';

class AddStudentScreen extends StatelessWidget {
  const AddStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _firstNameController = TextEditingController();
    TextEditingController _lastNameController = TextEditingController();
    TextEditingController _courseController = TextEditingController();
    TextEditingController _scoreController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Add New Student')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          try {
            final newStudentData = await addStudent(
              _firstNameController.text,
              _lastNameController.text,
              _courseController.text,
              int.parse(_scoreController.text),
            );
            Navigator.pop(context, newStudentData);
          } catch (e) {
            debugPrint(e.toString());
          }
        },
        label: Row(children: [Icon(Icons.done), Text('Save')]),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: _firstNameController,
                decoration: InputDecoration(label: Text('First Name')),
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 8),
              TextField(
                controller: _lastNameController,
                decoration: InputDecoration(label: Text('Last Name')),
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 8),
              TextField(
                controller: _courseController,
                decoration: InputDecoration(label: Text('Course')),
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 8),
              TextField(
                controller: _scoreController,
                decoration: InputDecoration(label: Text('Score')),
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
