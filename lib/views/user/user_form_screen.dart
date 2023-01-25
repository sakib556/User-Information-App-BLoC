import 'package:flutter/material.dart';
import 'package:test_rest_api_flutter/repository/user_repository.dart';

class UserFormScreen extends StatefulWidget {
  const UserFormScreen({super.key});

  @override
  State<UserFormScreen> createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  String response = "Response will show here.";
  final TextEditingController nameController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text("Name :"),
                  const SizedBox(width: 10,),
                  SizedBox(
                    width: 220,
                    child: TextField(
                      controller: nameController,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text("Title :"),
                  const SizedBox(width: 10,),
                  SizedBox(
                    width: 220,
                    child: TextField(
                      controller: titleController,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: () async {
                    response = await UserRepository.createUser(
                        nameController.text, titleController.text);
                    setState(() {});
                  },
                  child: const Text("Enter Data")),
              Text(response, textAlign: TextAlign.center)
            ],
          ),
        ),
      ),
    );
  }
}
