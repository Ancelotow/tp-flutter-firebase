// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tp_flutter_firebase/posts_screen/blocs/post_bloc.dart';
import 'package:tp_flutter_firebase/posts_screen/post_screen.dart';
import 'package:tp_flutter_firebase/posts_screen/repository/post_repository.dart';
import 'package:tp_flutter_firebase/posts_screen/widgets/post_item.dart';

import 'mock/empty_post_repository.dart';
import 'mock/error_post_repository.dart';
import 'mock/loading_post_repository.dart';
import 'mock/success_post_repository.dart';




void main() {
  testWidgets('Loading list', (WidgetTester tester) async {
    await tester.pumpWidget(
      RepositoryProvider(
        create: (context) => LoadingPostRepository() as PostRepository,
        child: BlocProvider(
          create: (context) => PostBloc(
            RepositoryProvider.of<PostRepository>(context),
          ),
          child: const MaterialApp(
            home: PostScreen(),
          ),
        ),
      ),
    );
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Success empty list', (WidgetTester tester) async {
    await tester.pumpWidget(
      RepositoryProvider(
        create: (context) => EmptyPostRepository() as PostRepository,
        child: BlocProvider(
          create: (context) => PostBloc(
            RepositoryProvider.of<PostRepository>(context),
          ),
          child: const MaterialApp(
            home: PostScreen(),
          ),
        ),
      ),
    );
    await tester.pump();
    expect(find.text("No posts found\nPlease add some posts"), findsOneWidget);
  });

  testWidgets('Success list', (WidgetTester tester) async {
    await tester.pumpWidget(
      RepositoryProvider(
        create: (context) => SuccessPostRepository() as PostRepository,
        child: BlocProvider(
          create: (context) => PostBloc(
            RepositoryProvider.of<PostRepository>(context),
          ),
          child: const MaterialApp(
            home: PostScreen(),
          ),
        ),
      ),
    );
    await tester.pump();
    expect(find.byType(PostItem), findsOneWidget);
  });

  testWidgets('Error list', (WidgetTester tester) async {
    await tester.pumpWidget(
      RepositoryProvider(
        create: (context) => ErrorPostRepository() as PostRepository,
        child: BlocProvider(
          create: (context) => PostBloc(
            RepositoryProvider.of<PostRepository>(context),
          ),
          child: const MaterialApp(
            home: PostScreen(),
          ),
        ),
      ),
    );
    await tester.pump();
    expect(find.text("Oops.. Something went wrong !"), findsOneWidget);
  });
}
