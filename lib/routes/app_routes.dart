import 'package:go_router/go_router.dart';
import 'package:weather_app/features/home/ui/screens/home_screen.dart';

final appRoutes = GoRouter(
  initialLocation: '/homescreen',
  routes: [
    GoRoute(
      path: '/homescreen',
      builder: (_, __) => const HomeScreen(),
      name: HomeScreen.name,
    )
  ],
);
