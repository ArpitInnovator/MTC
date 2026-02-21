import 'package:flutter/material.dart';
import 'package:mtc/theme/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }

  void showAddDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: AppTheme.mainGradient,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: .min,
                children: [
                  inputField(hint: 'Name', controller: nameController),
                  const SizedBox(height: 12),
                  inputField(hint: "Phone no.", controller: phoneController),
                  const SizedBox(height: 12),
                  inputField(hint: "Address", controller: addressController),
                  const SizedBox(height: 20),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF00A6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 12,
                      ),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pop(context);
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white, fontWeight: .bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget inputField({required String hint, TextEditingController? controller}) {
    return TextFormField(
      controller: controller,
      validator: (val) {
        if (val == null || val.trim().isEmpty) {
          return "$hint is missing";
        }
        return null;
      },

      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: AppTheme.mainGradient),
        child: Column(
          mainAxisAlignment: .center,
          children: [
            GestureDetector(
              onTap: () {
                showAddDialog(context);
              },
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Color(0xFF00F6FF),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.add, size: 40, color: Colors.black),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Add your first customer',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
