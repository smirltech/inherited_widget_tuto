class Contact {
  int id;
  String name;
  String? email;
  String? phone;

  Contact({required this.id, required this.name, this.email, this.phone});

  @override
  String toString() {
    return 'Contact{id: $id, name: $name, email: $email, phone: $phone}';
  }
}
