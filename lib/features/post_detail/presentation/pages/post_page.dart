import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/post_bloc.dart';
import '../bloc/post_event.dart';
import '../bloc/post_state.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post Detail (Clean Arch)')),
      body: Center(
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostInitial) {
              return ElevatedButton(
                onPressed: () => context.read<PostBloc>().add(GetPostEvent(1)),
                child: const Text('Lay du lieu'),
              );
            } else if (state is PostLoading) {
              return const CircularProgressIndicator();
            } else if (state is PostLoaded) {
              final post = state.post;
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.title,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const Divider(),
                    Text(
                      post.body,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              );
            } else if (state is PostError) {
              return Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
