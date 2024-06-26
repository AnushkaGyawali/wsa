import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import '../services/api_service.dart';

class AuthProvider with ChangeNotifier {
  User? _user;
  ApiService _apiService = ApiService();

  User? get user => _user;

  Future<void> register(String username, String password, List<String> emergencyContacts) async {
    await _apiService.registerUser(username, password, emergencyContacts);
  }

  Future<void> login(String username, String password) async {
    String token = await _apiService.loginUser(username, password);
    _user = User(id: '', username: username, token: token);
    notifyListeners();
  }

  Future<void> logout() async {
    _user = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    notifyListeners();
  }
}
