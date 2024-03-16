import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebaseapp/login_c.dart';
import 'main_menu.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  Future<void> createAccount() async {
    String email=emailController.text.trim();
    String password=passwordController.text.trim();
    if(email =="" || password == ""){
      print('pleae required feiled enter');

    }else{
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context)=>MainMenu()));
            }on FirebaseAuthException catch(ex){
        print(ex.code.toString());
      }

    }


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('firebase app '),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body:Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('login',style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 50,),
              TextField(
                controller: emailController,
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'netflix@gmail.com',
                  prefixIcon: Icon(Icons.email),
                  labelText:'Enter your Email address',
                  border:OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(21)
                      )
                  ),
                ),
              ),
              SizedBox(height: 30,),
              TextField(
                controller: passwordController,
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  suffixIcon: IconButton(onPressed: (){ }, icon: Icon(Icons.remove_red_eye)),
                  hintText: 'ram@543',
                  prefixIcon: Icon(Icons.lock),
                  labelText:'Password',
                  border:OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(21)
                      )
                  ),
                ),
              ),
              SizedBox(height: 40,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                      fixedSize: Size(200, 50),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(21)
                      )
                  ),
                  onPressed: (){
                    createAccount();
                  }, child: Text('Login',style: TextStyle(
                color: Colors.black87),)),
              SizedBox(height: 30,),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));

              }, child: Text('Click for Creat an account',
                style: TextStyle(
                  fontSize: 15,
                fontWeight: FontWeight.bold),))
            ],
          ),
        ),
      ),
    );
  }
}
