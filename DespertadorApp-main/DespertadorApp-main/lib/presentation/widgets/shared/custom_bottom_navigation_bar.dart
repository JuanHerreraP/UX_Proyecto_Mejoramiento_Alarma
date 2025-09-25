
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int index;
  const CustomBottomNavigationBar({super.key, required this.index});

  void onTapped( BuildContext context, int value ) {

    switch( value ) {
      case 0:
        context.go('/home/0');
        break;
      case 1:
        context.go('/home/1');
        break;
      case 2:
        context.go('/home/2');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) => onTapped( context, value ),
        currentIndex: index,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.watch_later), label: 'Alarmas' ),
          BottomNavigationBarItem(icon: Icon(Icons.stacked_bar_chart), label: 'Estadisticas' ),
          BottomNavigationBarItem(icon: Icon(Icons.content_paste_go), label: 'Ajustes' ),
        ]
    );
  }
}
