


import 'package:despertador/presentation/views/ajustes_screen.dart';
import 'package:despertador/presentation/views/alarmas_screen.dart';
import 'package:despertador/presentation/views/estadisticas_screen.dart';
import 'package:despertador/presentation/widgets/shared/custom_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final int index;
  const HomeScreen({super.key, required this.index});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      keepPage: true
    );
  }

  final views = <Widget>[
    AlarmasScreen(),
    EstadisticasScreen(),
    AjustesScreen()
  ];

  @override
  Widget build(BuildContext context) {

    if( pageController.hasClients ) {
      pageController.animateToPage(
          widget.index,
          duration: Duration( milliseconds: 250 ),
          curve: Curves.easeInOut
      );
    }

    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: views,
      ),

      bottomNavigationBar: CustomBottomNavigationBar( index: widget.index ),
    );

  }
}
