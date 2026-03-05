import 'package:flutter/material.dart';

enum UserRole { client, admin }

class AuthProvider extends ValueNotifier<UserRole?> {
  AuthProvider(super.value);

  void login(UserRole role) {
    value = role;
  }

  void logout() {
    value = null;
  }
}

final authProvider = AuthProvider(null);
