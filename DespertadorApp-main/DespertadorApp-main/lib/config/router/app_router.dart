

import 'package:despertador/presentation/screens/acerca_de_screen.dart';
import 'package:despertador/presentation/screens/add_alarm_screen.dart';
import 'package:despertador/presentation/screens/apariencia_screen.dart';
import 'package:despertador/presentation/screens/calendario_screen.dart';
import 'package:despertador/presentation/screens/cuenta_screen.dart';
import 'package:despertador/presentation/screens/edit_alarm_screen.dart';
import 'package:despertador/presentation/screens/home_screen.dart';
import 'package:despertador/presentation/screens/notifications_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(

    initialLocation: '/home/0',

    routes: [

      GoRoute(
        path: '/home/:page',
        builder: (context, state) {
          final index = int.parse( state.pathParameters['page'] ?? '0' );
          return HomeScreen(index: index);
        },
      ),

      GoRoute(
        path: '/add-alarm',
        builder: (context, state) => AddAlarmScreen(),
      ),

      GoRoute(
        path: '/edit-alarm/:alarmid',
        builder: (context, state) {
          final alarmid = state.pathParameters['alarmid'] ?? 'no-id';
          return EditAlarmScreen(alarmId: alarmid);

        },
      ),

      GoRoute(
        path: '/cuenta',
        builder: (context, state) => CuentaScreen(),
      ),

      GoRoute(
        path: '/notificaciones',
        builder: (context, state) => NotificationsScreen(),
      ),

      GoRoute(
        path: '/calendario',
        builder: (context, state) => CalendarioScreen(),
      ),

      GoRoute(
        path: '/apariencia',
        builder: (context, state) => AparienciaScreen(),
      ),

      GoRoute(
        path: '/acerca-de',
        builder: (context, state) => AcercaDeScreen(),
      ),


    ]

);