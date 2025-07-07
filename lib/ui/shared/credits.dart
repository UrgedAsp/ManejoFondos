import 'package:flutter/material.dart';
import 'package:manejo_fondos/helpers/format_currency.dart';
import 'package:manejo_fondos/providers/account_provider.dart';
import 'package:provider/provider.dart';

class Credits extends StatelessWidget {
  const Credits({super.key});

  @override
  Widget build(BuildContext context) {
    final balance = context.watch<AccountProvider>().balance;

    return Text(
      'Saldo disponible: COP ${FormatCurrency().formatCOP(balance)}',
      style: TextStyle(fontSize: 18, color: Colors.white),
    );
  }
}
