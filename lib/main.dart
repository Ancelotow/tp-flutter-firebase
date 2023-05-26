import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_flutter_firebase/posts_screen/blocs/post_bloc.dart';
import 'package:tp_flutter_firebase/posts_screen/data_source/firestore_post_data_source.dart';
import 'package:tp_flutter_firebase/posts_screen/post_screen.dart';
import 'package:tp_flutter_firebase/posts_screen/repository/firestore_post_repository.dart';
import 'package:tp_flutter_firebase/posts_screen/repository/post_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) =>
          FirestorePostRepository(FirestorePostDataSource()) as PostRepository,
      child: Builder(
        builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => PostBloc(
                  RepositoryProvider.of<PostRepository>(context),
                ),
              ),
            ],
            child: MaterialApp(
              title: 'Posts',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const PostScreen(),
            ),
          );
        },
      ),
    );
  }
}
