

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController cpasswordController=TextEditingController();

  Future<void> createAccount() async {
    String email=emailController.text.trim();
    String password=passwordController.text.trim();
    String cpassword=cpasswordController.text.trim();

    if(email=="" || password=="" || cpassword==""){
      print('Please fill details correctly');

    }else if(password!= cpassword){
      print('password do not match ');

    }else{
      try{
        UserCredential userCredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email, password: password);
        print('user created');
        if(userCredential.user !=null){
          Navigator.pop(context);
        }
      }on FirebaseAuthException catch(ex){
        print(ex.code.toString());

      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login page'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body:Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 15.0),
          child: Column(
            children: [
              Text('Creat an account',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 20,),
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
                  hintText: 'red@543',
                  prefixIcon: Icon(Icons.lock),
                  labelText:'Password',
                  border:OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(21)
                      )
                  ),
                ),
              ),
              SizedBox(height: 30,),
              TextField(
                obscureText: true,
                controller: cpasswordController,
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  suffixIcon: IconButton(onPressed: (){ }, icon: Icon(Icons.remove_red_eye)),
                  hintText: 'red@543',
                  prefixIcon: Icon(Icons.lock),
                  labelText:'Confirm Password',
                  border:OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(21)
                      )
                  ),
                ),
              ),
              SizedBox(height: 50,),
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
                  }, child: Text('Create account',style: TextStyle(
                color: Colors.black87,
              ),))
            ],
          ),
        ),
      ),
    );
  }
}
