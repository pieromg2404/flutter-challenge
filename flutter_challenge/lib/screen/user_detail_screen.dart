import 'package:flutter/material.dart';
import '../models/user.dart';

class UserDetailScreen extends StatelessWidget {
  final User user;

  UserDetailScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Username: ${user.username}'),
            Text('Email: ${user.email}'),
            Text('Phone: ${user.phone}'),
            Text('Website: ${user.website}'),
            Text('Address: ${user.address.street}, ${user.address.suite}, ${user.address.city}, ${user.address.zipcode}'),
            Text('Company: ${user.company.name}, ${user.company.catchPhrase}, ${user.company.bs}'),
          ],
        ),
      ),
    );
  }
}
