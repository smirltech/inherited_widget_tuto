import 'package:flutter/material.dart';

import '../../core/provider.dart';
import '../../managers/contact_manager.dart';
import '../../models/contact.dart';

class AddContact extends StatefulWidget {
  const AddContact({Key? key}) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  // ContactManager cm = ContactManager();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final _globalKey = GlobalKey<FormState>();

  @override
  dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    //  _globalKey.currentState!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ContactManager cm = Provider.of<ContactManager>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            key: _globalKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Phone',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    if (_globalKey.currentState!.validate()) {
                      cm.addContact(
                        Contact(
                          id: DateTime.now().millisecondsSinceEpoch,
                          name: _nameController.text,
                          email: _emailController.text,
                          phone: _phoneController.text,
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Add Contact'),
                ),
              ],
            )),
      ),
    );
  }
}
