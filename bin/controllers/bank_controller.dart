import '../db/db.dart';
import '../handlers/transfer_exception.dart';
import '../handlers/unauthorized_account_exception.dart';
import '../models/account.dart';

class BankController {
  static int _accountNumber = 0;

  int _generateAccountNumber(Account account) {
    if (!account.isAuthenticated) {
      throw UnauthorizedAccountException('You must authenticate your account!');
    } else {
      final int generatedAccountNumber = ++_accountNumber;
      account.accountNumber = generatedAccountNumber;

      return generatedAccountNumber;
    }
  }

  void addAccount({required Account account}) {
    try {
      final int generatedAccountNumber = _generateAccountNumber(account);
      print('Account added successfully with account number: $generatedAccountNumber');
    } catch (e) {
      print('Error adding account: $e');
    }
  }

  bool makeTransfer({ required String idSender, required String idReceiver, required double amount }) {
      try {
        if (!verifyId(idSender) || !verifyId(idReceiver)) {
          throw TransferException('Invalid sender or receiver ID');
        }

        final Account accountSender = database[idSender]!;
        final Account accountReceiver = database[idReceiver]!;

        _transferFunds(accountSender, accountReceiver, amount);
        return true;
    } catch (e) {
      print('Transfer failed: $e');
      return false;
    }
  }

  bool verifyId(String id) => database.containsKey(id);

  bool _transferFunds(Account sender, Account receiver, double amount) {
    if (!sender.isAuthenticated || sender.balance < amount) {
      throw TransferException('Insufficient funds or authentication failed');
    }

    sender.balance -= amount;
    receiver.balance += amount;

    return true;
  }
}