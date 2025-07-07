import 'package:flutter/material.dart';
import 'package:manejo_fondos/helpers/format_currency.dart';
import 'package:manejo_fondos/models/models.dart';

class HistoryList extends StatelessWidget {
  final List<TransactionModel> items;
  const HistoryList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
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
          label: Text('Fecha', style: TextStyle(color: Colors.white)),
        ),
        DataColumn(
          label: Text('Registro', style: TextStyle(color: Colors.white)),
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
              Text(item.date.toString(), style: TextStyle(color: Colors.white)),
            ),
            DataCell(
              Text(
                item.action.toString().split('.')[1],
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
