import 'package:flutter/material.dart';
import 'package:watch_store/components/themes.dart';
import 'package:watch_store/route/routes.dart';
import 'package:watch_store/screens/auth/cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store/screens/auth/send_sms_screen.dart';
import 'package:watch_store/utils/shared_preferences.dart';
// import 'package:watch_store/screens/mainScreen/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesManager().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Watch Store",
        routes: routes,
        theme: lightTheme(),
        home: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            // if (state is LoggedInState) {
            //   return const MainScreen();
            // } else if (state is LoggedOutState) {
            //   return SendSmsScreen();
            // } else {
            return SendSmsScreen();
            // }
          },
        ),
      ),
    );
  }
}
