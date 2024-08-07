import 'package:flutter/material.dart';
import 'user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Loginpage(),
    );
  }
}

bool isSecuret = true;

Map<String, User> users = {
  "sh@gmail.com": User(email: 'sh@gmail.com', password: '1234'),
  "as@gmail.com": User(email: 'as@gmail.com', password: '5678'),
};

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(159, 230, 156, 248),
        centerTitle: true,
        title: const Text(
          "Login Page",
          style: TextStyle(fontSize: 30),
        ),
        leading: const Icon(
          Icons.settings,
          size: 30,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/login.png',
              width: 390,
              height: 350,
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      label: Text('Enter Email'),
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    obscureText: isSecuret,
                    decoration: InputDecoration(
                      label: const Text('Enter Password'),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isSecuret = !isSecuret;
                            });
                          },
                          icon: const Icon(Icons.remove_red_eye)),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      if (users.containsKey(emailController.text)) {
                        User user = users[emailController.text]!;
                        if (user.email == emailController.text &&
                            user.password == passwordController.text) {
                          print('logged');
                        } else {
                          print('email or password is wrong');
                        }
                      } else {
                        print('email or password is wrong');
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 193, 110, 220),
                          borderRadius: BorderRadius.circular(16)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Log in',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(width: 5),
                          Icon(Icons.login)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
