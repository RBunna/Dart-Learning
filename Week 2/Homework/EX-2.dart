class BankAccount {
  // TODO
  String _name;
  int _id;
  double _balance;

  BankAccount(this._id, this._name) : this._balance = 0;

  String get name => this._name;
  int get id => this._id;
  double get balance => this._balance;

  void credit(double amount) {
    amount > 0
        ? this._balance += amount
        : throw ("Credit amount must be bigger than 0");
  }

  void withdraw(double amount) {
    amount > 0 && amount <= this._balance
        ? this._balance -= amount
        : throw ("Improper/invalid withdrawal");
  }
}

class Bank {
  // TODO
  String name;
  List<BankAccount> accounts;

  Bank({required this.name}) : this.accounts = <BankAccount>[];

  BankAccount createAccount(int id, String name) {
    if (this.accounts.every((element) => element._id != id)) {
      this.accounts.add(BankAccount(id, name));
      return this.accounts.last;
    } else {
      throw ("ID $id is already exist");
    }
  }
}

void main() {
  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
