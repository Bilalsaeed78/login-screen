import 'package:alogoace_assignment/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_rounded),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Expanded(
              child: Form(
                key: loginController.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Log in',
                      style: TextStyle(
                          fontSize: 32.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32.0),
                    TextFormField(
                      controller: loginController.emailController,
                      decoration: const InputDecoration(
                        hintText: 'jane@example.com',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    Obx(() {
                      return TextFormField(
                        controller: loginController.passwordController,
                        obscureText: loginController.isPasswordHidden.value,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(loginController.isPasswordHidden.value
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed:
                                loginController.togglePasswordVisibility,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                      );
                    }),
                    const SizedBox(height: 16.0),
                    Obx(() {
                      return loginController.isLoading.value
                          ? const Center(child: CircularProgressIndicator())
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black, 
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(0), 
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                textStyle: const TextStyle(
                                    fontSize: 16.0, color: Colors.white),
                              ),
                              onPressed: loginController.login,
                              child: const Text('LOG IN',
                                  style: TextStyle(color: Colors.white)),
                            );
                    }),
                    const SizedBox(height: 16.0),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.black),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0), 
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        textStyle:
                            const TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                      onPressed: () {
                      },
                      child: const Text('SIGN UP',
                          style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
