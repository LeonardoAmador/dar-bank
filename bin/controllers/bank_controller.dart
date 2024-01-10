import '../db/db.dart';
import '../models/account.dart';

class BankController {
  void addAccount({ required String id, required Account account }) {
    database[id] = account;
  }

  bool makeTransfer({ required String idSender, required String idReceiver, required double amount }) {
    if (!verifyId(idSender) || !verifyId(idReceiver)) {
      return false;
    }

    final Account accountSender = database[idSender]!;
    final Account accountReceiver = database[idReceiver]!;

    return transferFunds(accountSender, accountReceiver, amount);
  }

  bool verifyId(String id) {
    return database.containsKey(id);
  }

  bool transferFunds(Account sender, Account receiver, double amount) {
    if (!sender.isAuthenticated || sender.balance < amount) {
      return false;
    }

    sender.balance -= amount;
    receiver.balance += amount;

    return true;
  }
}
