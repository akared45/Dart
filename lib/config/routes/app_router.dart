import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../di.dart';
import '../../features/post_detail/presentation/bloc/post_bloc.dart';
import '../../features/post_detail/presentation/pages/post_page.dart';
import 'app_routes.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.root,
    routes: [
      GoRoute(
        path: AppRoutes.root,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<PostBloc>(),
          child: const PostPage(),
        ),
      ),

      GoRoute(
        path: AppRoutes.postDetail,
        builder: (context, state) {
          return const Scaffold(
            body: Center(child: Text("Post Detail Screen")),
          );
        },
      ),
    ],

    errorBuilder: (context, state) =>
        const Scaffold(body: Center(child: Text("404 - Trang không tồn tại"))),
  );
}
