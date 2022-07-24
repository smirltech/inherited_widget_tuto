import 'package:flutter/material.dart';

import '../../core/provider.dart';
import '../../managers/contact_manager.dart';
import '../../models/contact.dart';

class EditContact extends StatefulWidget {
  EditContact({Key? key, required this.contact}) : super(key: key);
  Contact contact;
  @override
  State<EditContact> createState() => _EditContactState();
}

class _EditContactState extends State<EditContact> {
  // ContactManager cm = ContactManager();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final _globalKey = GlobalKey<FormState>();

  initState() {
    _nameController.text = widget.contact.name;
    _emailController.text = widget.contact.email ?? '';
    _phoneController.text = widget.contact.phone ?? '';
    super.initState();
  }

  @override
  dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ContactManager cm = Provider.of<ContactManager>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Contact'),
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
                      cm.editContact(
                        widget.contact
                          ..name = _nameController.text
                          ..email = _emailController.text
                          ..phone = _phoneController.text,
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Edit Contact'),
                ),
              ],
            )),
      ),
    );
  }
}
