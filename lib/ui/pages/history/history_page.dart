import 'package:flutter/material.dart';
import 'package:manejo_fondos/providers/providers.dart';
import 'package:manejo_fondos/ui/pages/history/widgets/history_list.dart';
import 'package:manejo_fondos/ui/shared/credits.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TransactionProvider>(context);

    final items = provider.transactions;

    return SizedBox.expand(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: const EdgeInsets.all(20.0), child: Credits()),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: (items.isEmpty)
                        ? Text(
                            'No hay historial.',
                            style: TextStyle(color: Colors.white),
                          )
                        : HistoryList(items: items.reversed.toList()),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
