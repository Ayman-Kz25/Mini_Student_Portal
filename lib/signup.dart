import 'package:flutter/material.dart';
import 'package:task_02/login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final SizedBox gap = SizedBox(height: 20);
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController deptController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        foregroundColor: theme.primaryColor,
        elevation: 2,
        title: Text('Student Portal'),
        leading: IconButton(icon: Icon(Icons.school), onPressed: () {}),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Card(
            color: theme.colorScheme.inversePrimary,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Signup', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: theme.primaryColor),),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: idController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.badge_outlined),
                          labelText: 'ID',
                          border: OutlineInputBorder(borderSide: BorderSide(width: 2)),
                        ),
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'Enter your University Id';
                          }
                          if(value.length > 8){
                            return 'Id must contains at most 8 characters';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                      ),
                      gap,
                      TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person_outline),
                          labelText: 'Name',
                          border: OutlineInputBorder(borderSide: BorderSide(width: 2)),
                        ),
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'Enter your Name';
                          } if(value.length < 3){
                            return 'Enter a valid name';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                      ),
                      gap,
                      TextFormField(
                        controller: deptController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.account_balance_outlined),
                          labelText: 'Department',
                          border: OutlineInputBorder(borderSide: BorderSide(width: 2)),
                        ),
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'Enter your department name';
                          }
                          if(value.length < 5){
                            return 'Enter full department name';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                      ),
                      gap,
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(borderSide: BorderSide(width: 2)),
                        ),
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'Enter your email';
                          }
                          if(!value.contains('@') || !value.contains('.')){
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                      ),
                      gap,
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock_outline),
                          border: OutlineInputBorder(borderSide: BorderSide(width: 2)),
                        ),
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'Enter your password';
                          }
                          if(value.length < 8){
                            return 'Password must contains at least 8 characters';
                          }
                          return null;
                        },
                      ),
                      gap,
                      ElevatedButton(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(Icons.person_add),
                            SizedBox(width: 8),
                            Text('Signup'),
                          ],
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(
                                  id: idController.text,
                                  name: nameController.text,
                                  dept: deptController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                ),
                              ),
                            );
                          }
                        },
                        onHover: (value) {
                          theme.primaryColor;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
