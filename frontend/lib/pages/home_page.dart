import 'package:flutter/material.dart';
import 'package:mtc/theme/app_theme.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                _showAddDialog(context);
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

void _showAddDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // user must tap Save or Close
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
          child: Column(
            mainAxisSize: .min,
            children: [
              _inputField("Name"),
              const SizedBox(height: 12),
              _inputField("Phone no."),
              const SizedBox(height: 12),
              _inputField("Address"),
              const SizedBox(height: 20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF00A6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                onPressed: () {
                  Navigator.pop(context); // close dialog
                },
                child: const Text("Save",
                 style: TextStyle(
                  color: Colors.white,
                  fontWeight: .bold ,
                  ),
                  ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget _inputField(String hint) {
  return TextField(
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
