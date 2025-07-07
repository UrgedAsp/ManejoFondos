import 'package:flutter/material.dart';
import 'package:manejo_fondos/helpers/format_currency.dart';
import 'package:manejo_fondos/models/finances_model.dart';
import 'package:manejo_fondos/ui/pages/shop/widgets/form_finance.dart';

class ShopList extends StatelessWidget {
  final List<FinancesModel> items;

  const ShopList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {

    return DataTable(
      columns: const [
        DataColumn(
          label: Text('Nombre', style: TextStyle(color: Colors.white)),
        ),
        DataColumn(
          label: Text('Monto mínimo', style: TextStyle(color: Colors.white)),
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
                    builder: (context) => FormFinanceDialog(finance: item),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
                ),
                child: const Text(
                  'Inscribirse',
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