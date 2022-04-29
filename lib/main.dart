import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:test_case_smena/config/app_router.dart';
import 'config/app_bloc_observer.dart';
import 'config/app_router.gr.dart';
import 'config/injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getIt.registerSingleton<AppRouter>(AppRouter());
  BlocOverrides.runZoned(() async {
    await configureInjection(Environment.prod);
    runApp(const MyApp());
  }, blocObserver: AppBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // theme: ThemeData(
      //   primarySwatch: Colors.green,
      //   backgroundColor: Colors.white,
      // ),
      routerDelegate: getIt<AppRouter>().delegate(),
      routeInformationParser: getIt<AppRouter>().defaultRouteParser(),
      debugShowCheckedModeBanner: false,
    );
  }
}
