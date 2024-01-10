import '../db/db.dart';
import '../models/account.dart';

class AuthService {
  bool _accountExists(String accountId) {
    return database.containsKey(accountId);
  }

  bool authenticateAccount(String accountId) {
    try {
      if (!_accountExists(accountId)) {
        return false;
      }

      final Account account = database[accountId]!;
      account.isAuthenticated = true;
      print('User authenticated successfully!');
      return true;
    } catch (e) {
      print('Couldn\'t authenticate: $e');
      return false;
    }
  }
}