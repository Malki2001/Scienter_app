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
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final specialDigitRegex = RegExp(r'[!@#$%^&()_+{}\[\]:;<>,.?~\\-]');
  final numericRegex = RegExp(r'[0-9]');
  final uppercaseRegex = RegExp(r'[A-Z]');
  final lowercaseRegex = RegExp(r'[a-z]');
  final mobileRegex = RegExp(r'^07[0-9]{8}$');

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
    } else if (!mobileRegex.hasMatch(mobile)) {
      return "* Mobile Number is invalid.";
    } else if (mobile.length != 10) {
      return "* Mobile Number must contain 10 characters";
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

  String? onConfirmPasswordChanged(String? confirmPassword) {
    if (confirmPassword!.isEmpty) {
      return "* Confirm Password is required.";
    }
    if (confirmPassword != passwordController.text) {
      return "* Passwords do not match";
    } else {
      return null;
    }
  }

  String? validateAgreement(bool? value) {
    if (value == null || !value) {
      return '* You must agree to the terms and conditions.';
    }
    return null;
  }

  bool isLoading = false;
  List<String> countryNames = [];
  bool isAgreed = false;
  String? agreementError;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      setState(() {
        isLoading = true;
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
            countryController.text = countryNames[0];
            isLoading = false;
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
      isLoading: isLoading,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          },
        ),
      ),
      children: [

        const SizedBox(height: 20),

        const CustomHeading(title: "Create Your Account"),

        const SizedBox(height: 30),

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

                const SizedBox(height: 15),

                CustomTextField(
                    controller: lNameController,
                    labelText: 'Last Name',
                    hintText: 'Enter Your Last Name',
                    validator: (value) => onNameChanged(value),
                    icon: const Icon(Icons.person_outline)),


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
                    const Text('Male'),
                    Radio<String>(
                      value: 'Female',
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value;
                        });
                      },
                    ),
                    const Text('Female'),
                  ],
                ),

                CustomTextField(
                    controller: mobileController,
                    labelText: 'Mobile Number',
                    hintText: 'Enter Your Mobile Number',
                    validator: (value) => onMobileChanged(value),
                    icon: const Icon(Icons.email)),

                const SizedBox(height: 15),

                CustomTextField(
                    controller: emailController,
                    labelText: 'Email',
                    hintText: 'Enter Your Email',
                    validator: (value) => onEmailChanged(value),
                    icon: const Icon(Icons.email)),

                const SizedBox(height: 15),

                CustomDropdown(
                    dataList: countryNames, controller: countryController),

                const SizedBox(height: 15),

                CustomTextField(
                    controller: passwordController,
                    isObscure: true,
                    labelText: 'Password',
                    hintText: 'Enter Your Password',
                    validator: (value) => onPasswordChanged(value),
                    icon: const Icon(Icons.lock)),

                const SizedBox(height: 15),

                CustomTextField(
                    controller: confirmPasswordController,
                    isObscure: true,
                    labelText: 'Confirm Password',
                    hintText: 'Confirm Your Password',
                    validator: (value) => onConfirmPasswordChanged(value),
                    icon: const Icon(Icons.lock)),

                const SizedBox(height: 10),

                Row(
                  children: [
                    Checkbox(
                      value: isAgreed,
                      onChanged: (value) {
                        setState(() {
                          isAgreed = value ?? false;
                          agreementError = validateAgreement(isAgreed);
                        });
                      },
                    ),
                    const Expanded(
                        child: Text(
                      "Agree with Terms & Conditions",
                      style: TextStyle(color: Colors.black),
                    ))
                  ],
                ),

                CustomButton(
                    title: "Sign Up",
                    onTap: () {
                      String? errorMessage = validateAgreement(isAgreed);
                      if (formKey.currentState!.validate() &&
                          errorMessage == null) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );
                      } else {
                        String displayMessage = errorMessage ??
                            "Please fill out all fields correctly.";
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(displayMessage)),
                        );
                      }
                    }),
              ],
            )),
      ],
    );
  }
}
