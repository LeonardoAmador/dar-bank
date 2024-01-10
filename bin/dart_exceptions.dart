import 'controllers/bank_controller.dart';
import 'models/account.dart';
import 'services/auth_service.dart';

void main() {
  AuthService authService = AuthService();
  BankController bank = BankController();

  Account account1 = Account(name: 'Leonardo', balance: 1200.00, authService: authService);
  Account account2 = Account(name: 'Ayxa', balance: 300.00, authService: authService);

  bank.addAccount(account: account1);
  bank.addAccount(account: account2);
}
