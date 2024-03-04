import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_enc/core/gen/injection.dart';
import 'package:test_enc/features/post/presentation/blocs/exemple/exemple_bloc.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = getIt<ExempleBloc>().state as ExempleLoaded;
    return Scaffold(
      appBar: AppBar(
        title: Text(getIt<ExempleBloc>().state.toString()),
      ),
      body: Column(
        children: [
          BlocBuilder<ExempleBloc, ExempleState>(
            builder: (context, state) {
              if (state is ExempleError) {
                Center(child: Text(state.message));
              } else if (state is ExempleLoaded) {
                return Center(child: Text(state.result.title.toString()));
              }
              return const CircularProgressIndicator();
            },
          ),
          const SizedBox(
            height: 50,
          ),
          Text(data.result.body.toString()),
        ],
      ),
    );
  }
}
