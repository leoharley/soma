import 'package:flutter/material.dart';
import 'package:flutter_crud/homepage.dart';
import 'package:flutter_crud/loginpage.dart';
import 'registrationpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'App Soma Sustentabilidade',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: 
      Container(
         decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/fundo_1_app.png"), // <-- BACKGROUND IMAGE
              fit: BoxFit.cover,
            ),

          
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo2.png',
              height: 110,
   
              fit:BoxFit.fill),
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16.0),
              Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'CPF',
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      TextField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          labelText: 'Senha',
                        ),
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 46.0),
              ElevatedButton(
                style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: Size(200, 50)),
                onPressed: () async {
                  final email = _emailController.text;
                  final password = _passwordController.text;
                  final result = await loginUser(email, password);
                  if (result == 'Success') {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Login Success'),
                        content: const Text('Your Login was successful!'),
                        actions: [
                          TextButton(                            
                            onPressed: () {
                              Navigator.pop(context); // Close the dialog
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const HomePage()),
                              ); // Navigate back to LoginPage
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Error'),
                        content: const Text('Invalid email or password'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: const Text('Entrar',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white)),
              ),
              const SizedBox(height: 16.0),
              TextButton(
                style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: Size(200, 50)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegistrationPage()),
                  );
                },
                child: const Text('Cadastre-se',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}