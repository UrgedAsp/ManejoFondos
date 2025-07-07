import 'package:flutter/material.dart';
import 'package:manejo_fondos/models/models.dart';
import 'package:manejo_fondos/providers/providers.dart';
import 'package:provider/provider.dart';

class FormFinanceDialog extends StatefulWidget {
  final FinancesModel finance;
  const FormFinanceDialog({super.key, required this.finance});

  @override
  State<FormFinanceDialog> createState() => _FormFinanceDialogState();
}

class _FormFinanceDialogState extends State<FormFinanceDialog> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  String _notificationMethod = 'correo';

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final accountProvider = Provider.of<AccountProvider>(context);
    final transactionProvider = Provider.of<TransactionProvider>(context);
    final availableBalance = accountProvider.getBalance();

    return AlertDialog(
      title: const Text('Inscribir en fondo'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Monto a inscribir',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un monto';
                  }

                  final double? enteredAmount = double.tryParse(value);
                  if (enteredAmount == null) {
                    return 'Monto inválido';
                  }

                  if (enteredAmount < widget.finance.amount) {
                    return 'El mínimo es ${widget.finance.amount.toStringAsFixed(2)}';
                  }

                  if (enteredAmount > availableBalance) {
                    return 'Saldo insuficiente. Tienes ${availableBalance.toStringAsFixed(2)}';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 16),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Método de notificación:'),
              ),
              RadioListTile<String>(
                title: const Text('Correo electrónico'),
                value: 'correo',
                groupValue: _notificationMethod,
                onChanged: (value) {
                  setState(() => _notificationMethod = value!);
                },
              ),
              RadioListTile<String>(
                title: const Text('SMS'),
                value: 'sms',
                groupValue: _notificationMethod,
                onChanged: (value) {
                  setState(() => _notificationMethod = value!);
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final enteredAmount = double.parse(_amountController.text);

              accountProvider.addFinance(widget.finance.name, enteredAmount, widget.finance.category);
              transactionProvider.addTransaction(
                finance: widget.finance,
                action: ActionType.suscrito,
              );
              Navigator.of(context).pop(); // Cerrar diálogo
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Inscripción por \$${enteredAmount.toStringAsFixed(2)} enviada. Método: $_notificationMethod',
                  ),
                ),
              );
            }
          },
          child: const Text('Confirmar'),
        ),
      ],
    );
  }
}
