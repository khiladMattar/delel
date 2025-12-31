import 'package:daiel/core/services/service_locator.dart';
import 'package:daiel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:daiel/features/auth/presentation/views/sing_in_view.dart';
import 'package:daiel/features/auth/presentation/views/sing_up_view.dart';
import 'package:daiel/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:daiel/features/splach/presntation/view/splach_view.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
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
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<AuthCubit>(),
        child: const SingupView(),
      ),
    ),
     GoRoute(
      path: "/singIn",
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<AuthCubit>(),
        child: const SingInView(),
      ),
    ),
    ]
);