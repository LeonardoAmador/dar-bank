import 'controllers/bank_controller.dart';
import 'models/account.dart';

void main() {
  Account account1 = Account(name: 'John Doe', balance: 100.0, isAuthenticated: true);
  print('Account 1 UID: ${account1.uid}');
}
