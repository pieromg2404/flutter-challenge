import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_controller.dart';
import '../models/user.dart';

class AddEditUserScreen extends StatefulWidget {
  final User? user;

  AddEditUserScreen({this.user});

  @override
  State<AddEditUserScreen> createState() => _AddEditUserScreenState();
}

class _AddEditUserScreenState extends State<AddEditUserScreen> {
  final UserController userController = Get.find();

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _websiteController = TextEditingController();
  final _streetController = TextEditingController();
  final _suiteController = TextEditingController();
  final _cityController = TextEditingController();
  final _zipcodeController = TextEditingController();
  final _geoLatController = TextEditingController();
  final _geoLngController = TextEditingController();
  final _companyNameController = TextEditingController();
  final _catchPhraseController = TextEditingController();
  final _bsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      _nameController.text = widget.user!.name;
      _usernameController.text = widget.user!.username;
      _emailController.text = widget.user!.email;
      _phoneController.text = widget.user!.phone;
      _websiteController.text = widget.user!.website;
      _streetController.text = widget.user!.address.street;
      _suiteController.text = widget.user!.address.suite;
      _cityController.text = widget.user!.address.city;
      _zipcodeController.text = widget.user!.address.zipcode;
      _geoLatController.text = widget.user!.address.geo.lat;
      _geoLngController.text = widget.user!.address.geo.lng;
      _companyNameController.text = widget.user!.company.name;
      _catchPhraseController.text = widget.user!.company.catchPhrase;
      _bsController.text = widget.user!.company.bs;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user == null ? 'Add User' : 'Edit User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter username';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Phone'),
              ),
              TextFormField(
                controller: _websiteController,
                decoration: const InputDecoration(labelText: 'Website'),
              ),
              TextFormField(
                controller: _streetController,
                decoration: const InputDecoration(labelText: 'Street'),
              ),
              TextFormField(
                controller: _suiteController,
                decoration: const InputDecoration(labelText: 'Suite'),
              ),
              TextFormField(
                controller: _cityController,
                decoration: const InputDecoration(labelText: 'City'),
              ),
              TextFormField(
                controller: _zipcodeController,
                decoration: const InputDecoration(labelText: 'Zipcode'),
              ),
              TextFormField(
                controller: _geoLatController,
                decoration: const InputDecoration(labelText: 'Geo Latitude'),
              ),
              TextFormField(
                controller: _geoLngController,
                decoration: const InputDecoration(labelText: 'Geo Longitude'),
              ),
              TextFormField(
                controller: _companyNameController,
                decoration: const InputDecoration(labelText: 'Company Name'),
              ),
              TextFormField(
                controller: _catchPhraseController,
                decoration: const InputDecoration(labelText: 'Catch Phrase'),
              ),
              TextFormField(
                controller: _bsController,
                decoration:
                    const InputDecoration(labelText: 'Business Strategy'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    User newUser = User(
                      id: widget.user?.id ?? 0,
                      name: _nameController.text,
                      username: _usernameController.text,
                      email: _emailController.text,
                      phone: _phoneController.text,
                      website: _websiteController.text,
                      address: Address(
                        street: _streetController.text,
                        suite: _suiteController.text,
                        city: _cityController.text,
                        zipcode: _zipcodeController.text,
                        geo: Geo(
                          lat: _geoLatController.text,
                          lng: _geoLngController.text,
                        ),
                      ),
                      company: Company(
                        name: _companyNameController.text,
                        catchPhrase: _catchPhraseController.text,
                        bs: _bsController.text,
                      ),
                    );

                    if (widget.user == null) {
                      userController.addUser(newUser);
                    } else {
                      userController.editUser(widget.user!.id, newUser);
                    }

                    Get.back();
                  }
                },
                child: Text(widget.user == null ? 'Add' : 'Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
