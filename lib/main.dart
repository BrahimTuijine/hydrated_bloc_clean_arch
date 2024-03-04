import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_enc/features/post/presentation/blocs/exemple/exemple_bloc.dart';
import 'core/hive/open_box.dart';
import 'core/router/router.dart';
import 'core/bootstrap/bootstrap.dart';
import 'core/environment/environment.dart';
import 'core/gen/injection.dart';

Box? box;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  box = await openBox('testEnc');
  await dotenv.load(fileName: Env.fileName);
  configureDependencies();

  bootstrap(() => const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ExempleBloc>(),
      child: MaterialApp.router(
        theme: ThemeData(useMaterial3: false),
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: child,
          );
        },
        routerConfig: AppRouter.router,
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BrickHouse'),
      ),
      body: Column(
        children: [
          BlocConsumer<ExempleBloc, ExempleState>(
            listener: (BuildContext context, ExempleState state) {
              if (state is ExempleLoaded) {
                context.pushNamed('post');
              }
            },
            builder: (context, state) {
              if (state is ExempleError) {
                Center(child: Text(state.message));
              }
              return ElevatedButton(
                onPressed: () {
                  context.read<ExempleBloc>().add(const Exemple());
                },
                child: const Text(
                  "Elevated Button",
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
