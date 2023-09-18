import 'package:flutter/material.dart';
import 'package:verifyface/screens/verify_identity/verify.dart';
import 'package:verifyface/utills/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Verify your identity',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        backgroundColor: AppColors.background,
        scaffoldBackgroundColor: AppColors.background,
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: AppColors.text, fontSize: 18),
          bodyText2: TextStyle(color: AppColors.text2, fontSize: 10),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary,
          iconTheme: IconThemeData(
            color: AppColors.text,
          ),
        ),
      ),
      home: const VerifyScreen(),
    );
  }
}
