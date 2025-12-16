import 'package:daiel/features/splach/presntation/view/splach_view.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const SplachView(),
    ),]
);