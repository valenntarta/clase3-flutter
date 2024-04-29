import 'package:flutter_application_2/entities/pelicula.dart';
import 'package:flutter_application_2/screens/login_screen.dart';
import 'package:flutter_application_2/screens/home_screen.dart';
import 'package:flutter_application_2/screens/peli_detail_screen.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final appRouter = GoRouter(routes: [
  GoRoute(
    name: LoginScreen.name,
    path: '/',
    builder: (context, state) =>  const LoginScreen(),
  ),
  GoRoute(
    name: HomeScreen.name,
    path: '/home',
    builder: (context, state) => HomeScreen(),
  ),
  GoRoute(
    name: PeliDetailScreen.name,
    path: '/peli_detail_screen',
    builder: (context, state) => PeliDetailScreen(peli: state.extra as Pelicula),
  ),
]);