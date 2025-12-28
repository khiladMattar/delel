import 'package:daiel/features/auth/presentation/views/sing_in.dart';
import 'package:daiel/features/auth/presentation/views/sing_up.dart';
import 'package:daiel/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:daiel/features/splach/presntation/view/splach_view.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const SplachView(),
    ),
    GoRoute(
      path: "/OnBoarding",
      builder: (context, state) => const OnBoardingView(),
    ),
    GoRoute(
      path: "/singUP",
      builder: (context, state) => const SingupView(),
    ),
     GoRoute(
      path: "/singIn",
      builder: (context, state) => const SingInView(),
    ),
    ]
);