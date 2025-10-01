import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testik/Database/db.dart';
import 'package:testik/design/colors.dart';
import 'package:testik/pages/Home/Home.dart';
import 'package:testik/pages/Registration/Registration.dart';
import 'package:testik/pages/regSig/Signup.dart';
import 'package:testik/services/AuthService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isCheckingAuth = true;
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    final authService = AuthService();
    final isLoggedIn = await authService.isLoggedIn();

    setState(() {
      _isCheckingAuth = false;
      _isLoggedIn = isLoggedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isCheckingAuth) {
      return MaterialApp(
        home: Scaffold(body: Center(child: CircularProgressIndicator())),
      );
    }

    return MaterialApp(
      home: Signup(),
      routes: {
        '/signup': (context) => Signup(),
        '/home': (context) => Home(),
        '/registration': (context) => Registration(),
      },
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      title: 'Testик',
      debugShowCheckedModeBanner: false,
    );
  }
}
