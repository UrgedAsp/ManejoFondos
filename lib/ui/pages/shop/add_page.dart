import 'package:flutter/material.dart';
import 'package:manejo_fondos/models/finances_model.dart';
import 'package:manejo_fondos/services/mock_finances_service.dart';
import 'package:manejo_fondos/ui/pages/shop/widgets/shop_list.dart';
import 'package:manejo_fondos/ui/shared/credits.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mockService = MockFinancesService();

    return SizedBox.expand(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(padding: EdgeInsets.all(20.0), child: Credits()),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: FutureBuilder<List<FinancesModel>>(
                future: mockService.getAvailableFunds(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text(
                        'Error al cargar los fondos.',
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text(
                        'No hay fondos disponibles en este momento.',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }

                  final items = snapshot.data!;

                  return Container(
                    alignment: Alignment.topCenter,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: ShopList(items: items),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
