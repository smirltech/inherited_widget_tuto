import 'package:flutter/material.dart';

import '../../../core/provider.dart';
import '../../../managers/contact_manager.dart';

class ContactsCounter extends StatelessWidget {
  const ContactsCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ContactManager cm = Provider.of<ContactManager>(context);
    return Chip(
      backgroundColor: Colors.red,
      label: StreamBuilder<int>(
          builder: (context, snapshot) {
            return Text('${snapshot.data ?? 0}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white));
          },
          stream: cm.contactCounter),
    );
  }
}
