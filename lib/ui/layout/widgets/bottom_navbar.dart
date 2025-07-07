import 'package:flutter/material.dart';
import 'package:manejo_fondos/ui/layout/widgets/nav_item_data.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final List<NavItemData> navItems;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.navItems,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF23262F),
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedIconTheme: const IconThemeData(
          color: Color(0xFF00FFD1),
          size: 30,
        ),
        unselectedIconTheme: const IconThemeData(
          color: Colors.white70,
          size: 26,
        ),
        selectedItemColor: const Color(0xFF00FFD1),
        unselectedItemColor: Colors.white70,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 13,
        ),
        currentIndex: currentIndex,
        onTap: onTap,
        items: navItems
            .map((item) => BottomNavigationBarItem(
                  icon: Icon(item.icon),
                  label: item.label,
                ))
            .toList(),
      ),
    );
  }
}