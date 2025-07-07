import 'package:flutter/material.dart';
import 'package:manejo_fondos/ui/layout/widgets/widgets.dart';
import 'package:manejo_fondos/ui/pages/pages.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  final List<Widget> _pages = [HomePage(), AddPage(), HistoryPage()];

  final List<NavItemData> _navItems = [
    NavItemData(Icons.account_balance, 'Mis fondos'),
    NavItemData(Icons.monetization_on, 'Fondos Disponibles'),
    NavItemData(Icons.history, 'Historial Transacciones'),
  ];

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 600;

    return Scaffold(
      backgroundColor: const Color(0xFF181A20),
      body: Row(
        children: [
          if (isWide)
            SideMenu(
              currentIndex: _currentIndex,
              navItems: _navItems,
              onItemTap: (index) => setState(() => _currentIndex = index),
            ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF181A20),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(18)),
              ),
              child: IndexedStack(index: _currentIndex, children: _pages),
            ),
          ),
        ],
      ),
      bottomNavigationBar: isWide
          ? null
          : BottomNavBar(
              currentIndex: _currentIndex,
              navItems: _navItems,
              onTap: (index) => setState(() => _currentIndex = index),
            ),
    );
  }
}
