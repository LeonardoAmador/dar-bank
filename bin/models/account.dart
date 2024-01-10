import 'package:uuid/uuid.dart';
import '../services/auth_service.dart';

class Account {
  String uid;
  String name;
  double balance;
  bool isAuthenticated;
  final AuthService authService;

  Account({
    required this.name,
    required this.balance,
    this.isAuthenticated = false,
    required this.authService,
  }) : uid = Uuid().v4();

  void editBalance({required double value}) {
    balance += value;
  }

  void authenticate(String accountId) {
    authService.authenticateAccount(accountId);
  }
}
