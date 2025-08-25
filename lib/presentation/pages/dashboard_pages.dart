import 'package:flutter/material.dart';
import '../routes.dart';

class DashboardPages  extends StatefulWidget{
  const DashboardPages({super.key});
@override
  State<DashboardPages> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPages> {
 String _currentRoute = '/home'; // ruta inicial



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Aceti-Oxigeno")),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _getSelectedIndex(),
            onDestinationSelected: (int index) {
              setState(() {
                switch (index) {
                  case 0:
                    _currentRoute = '/home';
                    break;
                  case 1:
                    _currentRoute = '/reports';
                    break;
                  case 2:
                    _currentRoute = '/settings';
                    break;
                }
              });
            },
            labelType: NavigationRailLabelType.all,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text("Inicio"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bar_chart),
                label: Text("Reportes"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings),
                label: Text("Configuración"),
              ),
            ],
          ),
          Expanded(
            child: appRouter[_currentRoute]!(context)
          )
        ],
      ),
    );
  }

  int _getSelectedIndex() {
    switch (_currentRoute) {
      case '/home':
        return 0;
      case '/reports':
        return 1;
      case '/settings':
        return 2;
      default:
        return 0;
    }
  }
}