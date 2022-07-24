import 'package:flutter/material.dart';

import '../../../core/provider.dart';
import '../../../managers/contact_manager.dart';
import '../../../models/contact.dart';
import '../../contact/edit_contact.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ContactManager cm = Provider.of<ContactManager>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder(
        stream: cm.contacts,
        builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Text('No connection');
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.active:
            case ConnectionState.done:
              List<Contact>? contacts = snapshot.data;
              if (contacts!.isEmpty) {
                return const Center(child: Text('No contacts'));
              }
              return ListView.separated(
                  itemBuilder: (_, idx) {
                    Contact contact = contacts[idx];
                    return ListTile(
                      onTap: () {
                        //  Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (_) => EditContact(contact: contact)));
                      },
                      leading: CircleAvatar(
                        child: Text(contact.name.substring(0, 1),
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: Colors.white)),
                      ),
                      title: Text(contact.name,
                          style: Theme.of(context).textTheme.headline6),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text(contact.email ?? '')),
                          Text(contact.phone ?? '')
                        ],
                      ),
                      trailing: SizedBox(
                        width: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: IconButton(
                                icon: const Icon(Icons.edit),
                                color: Colors.blue,
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) =>
                                          EditContact(contact: contact)));
                                },
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: IconButton(
                                icon: const Icon(Icons.delete),
                                color: Colors.red,
                                onPressed: () => cm.deleteContact(contact),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, idx) => const Divider(),
                  itemCount: contacts.length);
          }
        },
      ),
    );
  }
}
