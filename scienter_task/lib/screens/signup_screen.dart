import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:scienter_task/component/custom_dropdown.dart';
import 'package:scienter_task/component/main_layout.dart';
import 'package:scienter_task/screens/login_screen.dart';

import '../component/custom_button.dart';
import '../component/custom_heading.dart';
import '../component/custom_textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();

  String? selectedGender = 'Male';

  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();

  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final specialDigitRegex = RegExp(r'[!@#$%^&()_+{}\[\]:;<>,.?~\\-]');
  final numericRegex = RegExp(r'[0-9]');
  final uppercaseRegex = RegExp(r'[A-Z]');
  final lowercaseRegex = RegExp(r'[a-z]');
  final MobileRegex = RegExp(r'^07[0-9]{8}$');

  String? onNameChanged(String? name) {
    if (name!.isEmpty) {
      return "* Name is required.";
    } else {
      return null;
    }
  }

  String? onMobileChanged(String? mobile) {
    if (mobile!.isEmpty) {
      return "* Mobile Number is required.";
    } else if (!MobileRegex.hasMatch(mobile)) {
      return "* Mobile Number is invalid.";
    } else {
      return null;
    }
  }

  String? onEmailChanged(String? email) {
    if (email!.isEmpty) {
      return "* Email is required.";
    } else if (!emailRegExp.hasMatch(email)) {
      return "* Email is invalid.";
    } else {
      return null;
    }
  }

  String? onPasswordChanged(String? password) {
    if (password!.isEmpty) {
      return "* Password is required.";
    }
    if (password.length <= 8 && password.length >= 30) {
      return "* Password must be 6 characters long.";
    } else if (!numericRegex.hasMatch(password)) {
      return "* Password must contain at least one number.";
    } else if (!uppercaseRegex.hasMatch(password)) {
      return "* Password must contain at least uppercase letter.";
    } else if (!lowercaseRegex.hasMatch(password)) {
      return "* Password must contain at least lowercase letter.";
    } else if (!specialDigitRegex.hasMatch(password)) {
      return '* Password must contain at least one special digit.';
    } else {
      return null;
    }
  }

  bool isloading = false;
  List<String> countryNames = [];

  @override
  void initState() {
    super.initState();
    if (mounted) {
      setState(() {
        isloading = true;
      });
    }
    fetchCountryNames();
  }

  Future<void> fetchCountryNames() async {
    final url = Uri.parse('https://restcountries.com/v3.1/all?fields=name');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        if (mounted) {
          setState(() {
            countryNames = data
                .map((country) => country['name']['common'].toString())
                .toSet()
                .toList();
            countryController.text= countryNames[0];
            isloading = false;
          });
        }
      } else {
        print('Failed to load country names');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      isLoading: isloading,
      appBar: AppBar(
        elevation: 0.0,
        // backgroundColor: Color.fromRGBO(66, 245, 191, 1),

        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Color.fromRGBO(120, 6, 84, 1)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      children: [
        const SizedBox(height: 80),
        CustomHeading(title: "Create Your Account"),
        const SizedBox(height: 50),
        Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextField(
                    controller: fNameController,
                    labelText: 'First Name',
                    hintText: 'Enter Your First Name',
                    validator: (value) => onNameChanged(value),
                    icon: const Icon(Icons.person_outline)),

                SizedBox(height: 17),

                CustomTextField(
                    controller: lNameController,
                    labelText: 'Last Name',
                    hintText: 'Enter Your Last Name',
                    validator: (value) => onNameChanged(value),
                    icon: const Icon(Icons.person_outline)),

                // SizedBox(height: ),

                Row(
                  children: [
                    const Text(
                      'Select Gender:',
                      style: TextStyle(fontSize: 14),
                    ),
                    Radio<String>(
                      value: 'Male',
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value;
                        });
                      },
                    ),
                    Text('Male'),
                    Radio<String>(
                      value: 'Female',
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value;
                        });
                      },
                    ),
                    Text('Female'),
                  ],
                ),

                CustomTextField(
                    controller: mobileController,
                    labelText: 'Mobile Number',
                    hintText: 'Enter Your Mobile Number',
                    validator: (value) => onMobileChanged(value),
                    icon: const Icon(Icons.email)),

                SizedBox(height: 17),

                CustomTextField(
                    controller: emailController,
                    labelText: 'Email',
                    hintText: 'Enter Your Email',
                    validator: (value) => onEmailChanged(value),
                    icon: const Icon(Icons.email)),

                SizedBox(height: 17),

                CustomDropdown(
                    dataList: countryNames, controller: countryController),

                SizedBox(height: 17),
                CustomTextField(
                    controller: passwordController,
                    isObscure: true,
                    labelText: 'Password',
                    hintText: 'Enter Your Password',
                    validator: (value) => onPasswordChanged(value),
                    icon: const Icon(Icons.lock)),

                SizedBox(height: 10), // Add space before the Facebook button

                CustomButton(
                    title: "Sign Up",
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      }
                    }),
              ],
            )),
      ],
    );
  }
}
