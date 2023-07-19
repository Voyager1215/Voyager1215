import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController _email; //creating link to get
  late final TextEditingController _password; //user id and pass

  @override
  void initState() {
    _email = TextEditingController(); //linking it to
    _password = TextEditingController(); //to the firebase
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose(); //when init state is performed
    _password.dispose(); //always run dispose function
    // ignore: todo
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ARAKSHAN'),
      ),
      body: Column(children: [
        TextField(
          //space to fill email
          controller: _email,
          keyboardType: TextInputType.emailAddress,
          enableSuggestions: false,
          autocorrect: false,
          decoration: const InputDecoration(hintText: 'E-mail or Username'),
        ),
        TextField(
            //space to fill password
            controller: _password,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(hintText: 'Password')),
        TextButton(
          onPressed: () async {
            await Firebase.initializeApp(
              options: DefaultFirebaseOptions.currentPlatform,
            );
            final email = _email.text;
            final password = _password.text;

            final userCredential =
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: email,
              password: password,
            );
            print(userCredential);
          },
          child: const Text('LESGOO'),
        )
      ]),
    );
  }
}
