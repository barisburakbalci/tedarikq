import 'package:flutter/material.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({super.key});

  @override
  State<SalesScreen> createState() => SalesScreenState();
}

class SalesScreenState extends State<SalesScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isBigCompany = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        helperText: ' ',
                      ),
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }

                        return null;
                      }),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Surname',
                        helperText: ' ',
                      ),
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }

                        return null;
                      }),
                    ),
                    CheckboxListTile(
                      title: const Text('Deneme'),
                      value: isBigCompany,
                      onChanged: ((value) {
                        setState(() {
                          isBigCompany = value ?? false;
                        });
                      }),
                    ),
                    SwitchListTile(
                      title: const Text('Deneme'),
                      value: isBigCompany,
                      onChanged: ((value) {
                        setState(() {
                          isBigCompany = value;
                        });
                      }),
                    ),
                    ElevatedButton(
                      onPressed: (() {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Form is proccessing')),
                          );
                        }
                      }),
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
