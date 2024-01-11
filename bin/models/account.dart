import 'package:uuid/uuid.dart';
import '../db/db.dart';

class Account {
  final String _uid;
  late int _accountNumber;
  String _name;
  double _balance;
  bool _isAuthenticated;

  Account({
    required String name,
    required double balance,
    bool isAuthenticated = false,
  })  : _uid = Uuid().v4(),
        _accountNumber = -1,
        _name = name,
        _balance = balance,
        _isAuthenticated = isAuthenticated {
    addToDatabase();
  }

  String get uid => _uid;

  int get accountNumber => _accountNumber;

  void set accountNumber(int newNumber) {
    _accountNumber = newNumber;
  }

  String get name => _name;

  void set name(String newName) {
    _name = newName;
  }

  double get balance => _balance;

  void set balance(double newBalance) {
    _balance = newBalance;
  }

  bool get isAuthenticated => _isAuthenticated;

  void set isAuthenticated(bool newCondition) {
    _isAuthenticated = newCondition;
  }

  void addToDatabase() {
    if (!database.containsKey(_uid)) {
      database[_uid] = this;
    } else {
      print('Account with UID $_uid already exists in the database.');
    }
  }
}
