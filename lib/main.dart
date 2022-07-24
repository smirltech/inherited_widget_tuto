import 'package:flutter/material.dart';
import 'package:inherited_widget_tuto/app/core/provider.dart';
import 'package:inherited_widget_tuto/app/managers/contact_manager.dart';

import 'app/screens/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<ContactManager>(
      data: ContactManager(),
      child: MaterialApp(
        title: 'Contacts Manager - Provider',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        themeMode: ThemeMode.dark,
        home: const HomePage(title: 'Contacts Manager - Provider'),
      ),
    );
  }
}
