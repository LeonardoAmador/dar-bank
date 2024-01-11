import 'package:uuid/uuid.dart';
import '../db/db.dart';
class Account {
  String uid;
  String name;
  double balance;
  bool isAuthenticated;
  int accountNumber;

  Account({
    required this.name,
    required this.balance,
    this.isAuthenticated = false,
  }) : uid = Uuid().v4(), accountNumber = -1 {
    addToDatabase();
  }

  void editBalance({required double value}) {
    balance += value;
  }

  void setAccountNumber(int number) {
    accountNumber = number;
  }

  void addToDatabase() {
    if (!database.containsKey(uid)) {
      database[uid] = this;
    } else {
      print('Account with UID $uid already exists in the database.');
    }
  }
}
