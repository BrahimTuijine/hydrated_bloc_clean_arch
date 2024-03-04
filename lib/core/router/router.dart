import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_enc/core/gen/injection.dart';
import 'package:test_enc/features/post/presentation/blocs/exemple/exemple_bloc.dart';
import 'package:test_enc/features/post/presentation/views/post_screen.dart';

import '../../main.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: getIt<ExempleBloc>().state is ExempleLoaded ? '/post' : '/home',
    routes: [
      GoRoute(
        path: '/home',
        builder: (BuildContext context, GoRouterState state) => const Home(),
      ),
      GoRoute(
        name: 'post',
        path: '/post',
        builder: (BuildContext context, GoRouterState state) =>
            const PostScreen(),
      ),
    ],
  );
}
