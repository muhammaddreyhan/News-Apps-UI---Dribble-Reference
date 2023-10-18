import 'package:flutter/material.dart';
import '../widgets/custom_tag.dart';
import 'package:google_fonts/google_fonts.dart';



class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  static const routeName = '/login';
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 150)),
            Image.network('https://upload.wikimedia.org/wikipedia/id/d/d0/UIN_MAULANA_MALIK_IBRAHIM.jpg', width: 250, height: 250),
        SizedBox(height: 20),
        // Image.asset(''),
        Text('LOGIN',
            style: GoogleFonts.inter(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)),
        SizedBox(height: 30),
        Text('Username',style: TextStyle(fontSize: 15),),
        SizedBox(height: 5),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: TextField(
            maxLength: 7,
            controller: _usernameController,
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.white),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
              SizedBox(height: 20),
              Text('Password',style: TextStyle(fontSize: 15),),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  obscureText: true,
                  controller: _passwordController,
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0,)),
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(16.0),
                  primary: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),

                ),
                  onPressed: (() {
                    String username = _usernameController.text;
                    Navigator.pushNamed(context, '/', arguments: username);
                  }),
                  child: Text('LOGIN', style: TextStyle(letterSpacing: 2,fontSize: 15),)),
            ],
        ),
    );
  }
}






