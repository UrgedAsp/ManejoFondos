import 'package:flutter/material.dart';
import 'package:manejo_fondos/helpers/format_currency.dart';
import 'package:manejo_fondos/models/models.dart';
import 'package:manejo_fondos/providers/providers.dart';
import 'package:provider/provider.dart';

class FinancesList extends StatelessWidget {
  final List<FinancesModel> items;

  const FinancesList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final accountProvider = Provider.of<AccountProvider>(context);
    final transactionProvider = Provider.of<TransactionProvider>(context);

    return DataTable(
      columns: const [
        DataColumn(
          label: Text('Nombre', style: TextStyle(color: Colors.white)),
        ),
        DataColumn(
          label: Text('Monto', style: TextStyle(color: Colors.white)),
        ),
        DataColumn(
          label: Text('Categoría', style: TextStyle(color: Colors.white)),
        ),
        DataColumn(
          label: Text('Acciones', style: TextStyle(color: Colors.white)),
        ),
      ],
      rows: items.map((item) {
        return DataRow(
          cells: [
            DataCell(
              Text(item.name, style: const TextStyle(color: Colors.white)),
            ),
            DataCell(
              Text(
                FormatCurrency().formatCOP(item.amount),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            DataCell(
              Text(
                item.category.toString().split('.')[1].toUpperCase(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            DataCell(
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Confirmar cancelación'),
                      content: const Text(
                        '¿Estás seguro de que deseas cancelar esta inscripción? Esta acción no se puede deshacer.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () =>
                              Navigator.of(context).pop(), // Cierra el diálogo
                          child: const Text('Cancelar'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            accountProvider.removeFinance(item);
                            transactionProvider.addTransaction(
                              finance: item,
                              action: ActionType.cancelado,
                            );

                            Navigator.of(context).pop(); // Cierra el diálogo

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Inscripción cancelada con éxito',
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: const Text('Confirmar'),
                        ),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text(
                  'Cancelar',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
