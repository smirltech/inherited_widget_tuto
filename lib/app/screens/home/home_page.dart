import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:inherited_widget_tuto/app/core/provider.dart';
import 'package:inherited_widget_tuto/app/managers/contact_manager.dart';
import 'package:inherited_widget_tuto/app/models/contact.dart';
import 'package:inherited_widget_tuto/app/screens/home/components/contacts_counter.dart';
import 'package:inherited_widget_tuto/app/screens/home/components/contacts_list.dart';

import '../contact/add_contact.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //ContactManager cm = ContactManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: const [
          ContactsCounter(),
          SizedBox(width: 16),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Center(child: Text('Contacts Manager')),
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Add Contact'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddContact(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: const ContactsList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const AddContact()));
        },
        tooltip: 'Add Contact',
        child: const Icon(Icons.add),
      ),
    );
  }
}
