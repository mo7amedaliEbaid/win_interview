```
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const AgeCalculatorApp());
}

class AgeCalculatorApp extends StatelessWidget {
  const AgeCalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Age Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const AgeCalculatorScreen(),
    );
  }
}

class AgeCalculatorScreen extends StatefulWidget {
  const AgeCalculatorScreen({Key? key}) : super(key: key);

  @override
  _AgeCalculatorScreenState createState() => _AgeCalculatorScreenState();
}

class _AgeCalculatorScreenState extends State<AgeCalculatorScreen> {
  DateTime? selectedDate;
  String? ageDetails;

  void _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        ageDetails = _calculateAge(picked);
      });
    }
  }

  String _calculateAge(DateTime birthDate) {
    final today = DateTime.now();

    int years = today.year - birthDate.year;
    int months = today.month - birthDate.month;
    int days = today.day - birthDate.day;

    // Adjust for negative months
    if (months < 0) {
      years--;
      months += 12;
    }

    // Adjust for negative days
    if (days < 0) {
      final previousMonth = DateTime(today.year, today.month - 1, 1);
      final daysInPreviousMonth = DateTime(today.year, today.month, 0).day;
      months--;
      if (months < 0) {
        years--;
        months += 12;
      }
      days += daysInPreviousMonth;
    }

    String ageString = '';
    if (years > 0) ageString += '$years years ';
    if (months > 0) ageString += '$months months ';
    if (days > 0) ageString += '$days days';

    return ageString.isEmpty ? '0 days' : ageString.trim();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Age Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (selectedDate != null)
              Text(
                'Selected Date: ${DateFormat('yyyy-MM-dd').format(selectedDate!)}',
                style: const TextStyle(fontSize: 18),
              ),
            const SizedBox(height: 20),
            if (ageDetails != null)
              Text(
                'Your Age: $ageDetails',
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickDate,
              child: const Text('Select Your Birthday'),
            ),
          ],
        ),
      ),
    );
  }
}
```
