import 'package:browse_it/core/di/di_container.dart';
import 'package:browse_it/features/home/presentation/BLoC/bloc/home_bloc.dart';
import 'package:browse_it/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  setup();
  runApp(
    BlocProvider(
      create: (context) => HomeBloc(),
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        builder: (_, child) {
          return const MyApp();
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Browse It',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
