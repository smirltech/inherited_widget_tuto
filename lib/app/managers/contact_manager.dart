import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../models/contact.dart';

class ContactManager {
  final BehaviorSubject<List<Contact>> _contactsController =
      BehaviorSubject<List<Contact>>();
  final BehaviorSubject<int> _contactCountController = BehaviorSubject<int>();

  Stream<List<Contact>> get contacts => _contactsController.stream;
  Stream<int> get contactCounter => _contactCountController.stream;

  final List<Contact> _contacts = <Contact>[
/*    Contact(
        id: DateTime.now().millisecondsSinceEpoch,
        name: "Francis",
        email: "francis@gmail.com",
        phone: "1234567890"),
    Contact(
        id: DateTime.now().millisecondsSinceEpoch,
        name: "Jean",
        email: "jean@gmail.com",
        phone: "1234567890"),
    Contact(
        id: DateTime.now().millisecondsSinceEpoch,
        name: "Paul",
        email: "paul@gmail.com",
        phone: "1234567890"),
    Contact(
        id: DateTime.now().millisecondsSinceEpoch,
        name: "Marie",
        email: "marie@gmail.com",
        phone: "1234567890"),*/
  ];

  addContact(Contact contact) async {
    _contacts.add(contact);
    //print(_contacts.toString());
    _contactsController.sink.add(_contacts);
    // print(await contacts.toList());
  }

  editContact(Contact contact) async {
    Contact old = _contacts.firstWhere((c) => c.id == contact.id);
    _contacts.remove(old);
    _contacts.add(contact);
    _contactsController.sink.add(_contacts);
  }

  deleteContact(Contact contact) async {
    _contacts.remove(contact);
    _contactsController.sink.add(_contacts);
  }

  initData() async {
    contacts.listen((contacts) => _contactCountController.add(contacts.length));

    for (int i = 0; i <= _contacts.length; i++) {
      await Future.delayed(const Duration(milliseconds: 500));
      //  yield _contacts.sublist(0, i);
      _contactsController.sink.add(_contacts.sublist(0, i));
    }
  }

  ContactManager() {
    initData();
  }
}
