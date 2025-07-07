import 'package:flutter/material.dart';
import 'package:manejo_fondos/ui/layout/widgets/nav_item_data.dart';

class SideMenu extends StatelessWidget {
  final int currentIndex;
  final List<NavItemData> navItems;
  final ValueChanged<int> onItemTap;

  const SideMenu({
    super.key,
    required this.currentIndex,
    required this.navItems,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      decoration: const BoxDecoration(
        color: Color(0xFF23262F),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(2, 0)),
        ],
      ),
      child: Column(
        children: List.generate(navItems.length, (index) {
          final selected = currentIndex == index;
          return Material(
            color: selected
                ? const Color(0xFF00FFD1).withAlpha((0.18 * 255).toInt())
                : Colors.transparent,
            child: InkWell(
              onTap: () => onItemTap(index),
              borderRadius: BorderRadius.circular(8),
              child: Container(
                height: 64,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Icon(
                      navItems[index].icon,
                      color: selected
                          ? const Color(0xFF00FFD1)
                          : Colors.white70,
                      size: selected ? 32 : 28,
                    ),
                    const SizedBox(width: 18),
                    Expanded(
                      child: Text(
                        navItems[index].label,
                        style: TextStyle(
                          color: selected
                              ? const Color(0xFF00FFD1)
                              : Colors.white70,
                          fontWeight: selected
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}


