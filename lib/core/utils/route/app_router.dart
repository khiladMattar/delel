import 'package:daiel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:daiel/features/auth/presentation/views/forgot_password_view.dart';
import 'package:daiel/features/auth/presentation/views/sing_in_view.dart';
import 'package:daiel/features/auth/presentation/views/sing_up_view.dart';
import 'package:daiel/features/home/data/models/historical_periods_model.dart';
import 'package:daiel/features/home/presentaion/views/historical_periods_details_view.dart';
import 'package:daiel/features/home/presentaion/views/home_view.dart';
import 'package:daiel/features/home/presentaion/widgetsold/home_nav_bar_widget.dart';
import 'package:daiel/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:daiel/features/splach/presntation/view/splach_view.dart';
import 'package:flutter/src/widgets/async.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        create: (context) => AuthCubit(),
        child: const SingupView(),
      ),
    ),
     GoRoute(
      path: "/singIn",
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(),
        child: const SingInView(),
      ),
    ),
     GoRoute(
      path: "/home",
      builder: (context, state) => const HomeView(),
    ),
     GoRoute(
      path: "/homeNavBar",
      builder: (context, state) => const HomeNavBarWidget(),
    ),
    GoRoute(
      path: "/forgotPassword",
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(),
        child: const ForgotPasswordView(),
      ),
    ),
       GoRoute(
      path: "/historicalPeriodsDetailsView",
      builder: (context, state) => HistoricalPeriodsDetailsView(
          model: state.extra as HistoricalPeriodsModel),
    ),
    ]
);