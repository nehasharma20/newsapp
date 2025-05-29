import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'core/services/shared_prefs.dart';
import 'viewmodels/auth_viewmodel.dart';
import 'viewmodels/news_viewmodel.dart';
import 'viewmodels/bookmark_viewmodel.dart';
import 'views/auth/login_screen.dart';
import 'views/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedPrefs.init();
  runApp(const MyApp());
}
//news
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => NewsViewModel()),
        ChangeNotifierProvider(create: (_) => BookmarkViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter News App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Consumer<AuthViewModel>(
          builder:
              (context, auth, _) =>
                  auth.isLoggedIn ? const HomeScreen() : const LoginScreen(),
        ),
      ),
    );
  }
}
