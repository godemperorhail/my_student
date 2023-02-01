import 'package:mystudent/model/account.dart';

class DataAccount {
  List<Account> dataAccount() {
    List<Account> lstAccount = [
      Account(id: "1", username: "nguyen1", password: "12345678"),

      Account(id: "2", username: "nguyen2", password: "12345678"),
    ];
    return lstAccount;
  }
}
