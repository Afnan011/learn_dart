import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(SgpaCalculatorApp());

class SgpaCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SGPA Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SgpaCalculatorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SgpaCalculatorScreen extends StatefulWidget {
  @override
  _SgpaCalculatorScreenState createState() => _SgpaCalculatorScreenState();
}

class _SgpaCalculatorScreenState extends State<SgpaCalculatorScreen> {
  final List<String> subjects = ["MFCA", "OSC", "DS", "CN", "DAA", "DS_LAB", "CN_LAB", "RMI"];
  List<double> marks = List.filled(8, 0);
  double sgpa = 0;

  bool checkMarks()
  {
    for(var d in marks)
      {
        if(d == 0.0) {
          return false;
        }
      }

    return true;
  }

  void calculateSGPA() {

    if(checkMarks() == false)
      {
        setState(() {});
        return;
      }

    double totalCredits = 23;
    List<double> grade = List.filled(8, 0);

    for (int i = 0; i < 8; i++) {
      if (marks[i] >= 0 && marks[i] <= 49) {
        grade[i] = 0;
      } else if (marks[i] >= 50 && marks[i] <= 54) {
        grade[i] = 5;
      } else if (marks[i] >= 55 && marks[i] <= 59) {
        grade[i] = 6;
      } else if (marks[i] >= 60 && marks[i] <= 69) {
        grade[i] = 7;
      } else if (marks[i] >= 70 && marks[i] <= 79) {
        grade[i] = 8;
      } else if (marks[i] >= 80 && marks[i] <= 89) {
        grade[i] = 9;
      } else if (marks[i] >= 90 && marks[i] <= 100) {
        grade[i] = 10;
      }
    }

    sgpa = ((grade[0] * 4) +
        (grade[1] * 4) +
        (grade[2] * 3) +
        (grade[3] * 3) +
        (grade[4] * 4) +
        (grade[5] * 1.5) +
        (grade[6] * 1.5) +
        (grade[7] * 2)) /
        totalCredits;

    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SGPA Calculator"),
        centerTitle: true,

      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    'Enter Marks for Each Subject:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  for (int i = 0; i < subjects.length; i++)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        onChanged: (value) => marks[i] = double.tryParse(value) ?? 0,
                        decoration: InputDecoration(
                            labelText: subjects[i],
                            labelStyle: const TextStyle(fontSize: 16),
                            contentPadding: const EdgeInsets.all(8),
                            border: const OutlineInputBorder(),
                          alignLabelWithHint: true
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(3), // Restrict to 3 digits
                        ],
                      ),
                    ),

                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                        calculateSGPA();
                    },
                    child: const Text('Calculate SGPA'),
                  ),

                  const SizedBox(height: 20),
                  (sgpa != 0 && checkMarks())
                      ? Text(
                    'Your SGPA: ${sgpa.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                      : const Text(
                      "Enter all Marks",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}