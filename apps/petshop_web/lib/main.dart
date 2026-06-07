import 'package:flutter/material.dart';

void main() => runApp(const CustomerPortalApp());

class CustomerPortalApp extends StatelessWidget {
  const CustomerPortalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Petshop',
      home: Scaffold(
        appBar: AppBar(title: const Text('Petshop')),
        body: const Padding(
          padding: EdgeInsets.all(24),
          child: Text('Generated customer portal shell.

Capabilities:
- Browse and filter adoptable pets
- View pet profiles
- Submit adoption enquiries
- Manage listing status
- Expose health and catalogue endpoints'),
        ),
      ),
    );
  }
}
