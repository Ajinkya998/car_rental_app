import 'package:car_rental/firebase_options.dart';
import 'package:car_rental/presentation/bloc/car_bloc.dart';
import 'package:car_rental/presentation/bloc/car_events.dart';
import 'package:car_rental/presentation/pages/onboarding_page.dart';
import 'package:car_rental/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initialiseDepedency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CarBloc>()..add(LoadCar()),
      child: const MaterialApp(
        title: 'Car Rental Application',
        debugShowCheckedModeBanner: false,
        home: OnboardingPage(),
      ),
    );
  }
}
