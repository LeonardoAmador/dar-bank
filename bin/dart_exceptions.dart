import 'controllers/bank_controller.dart';
import 'models/account.dart';
import 'services/auth_service.dart';

void main() {
  AuthService authService = AuthService();
  BankController bank = BankController();

  Account account1 = Account(name: 'Leonardo', balance: 200.00);
  Account account2 = Account(name: 'Ayxa', balance: 200.00);

  authService.authenticateAccount(account1.uid);
  authService.authenticateAccount(account2.uid);

  bank.addAccount(account: account1);
  bank.addAccount(account: account2);

  bank.makeTransfer(idSender: account1.uid, idReceiver: account2.uid, amount: 200);

  print(account1.balance);
  print(account2.balance);
}
