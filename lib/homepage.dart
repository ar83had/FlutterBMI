import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final wController = TextEditingController();
  final fController = TextEditingController();
  final iController = TextEditingController();

  String result = "";
  Color bgColor = Colors.amber;
  bool isEmpty=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        title: const Text("Your BMI"),
      ),
      body: Container(
        color: bgColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                const Text(
                  "BMI Calculator",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            
                const SizedBox(height: 40),
            
                SizedBox(
                  width: 300,
                  child: Column(
                    spacing: 16,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
            
                      /// Weight
                      TextField(
                        controller: wController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Enter Weight (kg)",
                          prefixIcon: Icon(Icons.line_weight),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value){
                          setState(() {
                            bgColor=Colors.amber;
                          });
                        },
                      ),
                      
                      /// Height in Feet
                      TextField(
                        controller: fController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Enter Height (Feet)",
                          prefixIcon: Icon(Icons.height),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value){
                          setState(() {
                            bgColor=Colors.amber;
                          });
                        },
                      ),
                      
                      /// Height in Inches
                      TextField(
                        controller: iController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Enter Height (Inch)",
                          prefixIcon: Icon(Icons.height),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value){
                          setState(() {
                            bgColor=Colors.amber;
                          });
                        },
                      ),
            
                      /// Button
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {
            
                            String weightText = wController.text.trim();
                            String feetText = fController.text.trim();
                            String inchText = iController.text.trim();
            
                            if (weightText.isNotEmpty &&
                                feetText.isNotEmpty &&
                                inchText.isNotEmpty) {
            
                              double weight = double.parse(weightText);
                              double feet = double.parse(feetText);
                              double inch = double.parse(inchText);
            
                              /// Convert height to meters
                              double totalHeight =
                                  (((feet * 12) + inch) * 2.54) / 100;
            
                              double totalBmi =
                                  weight / pow(totalHeight, 2);
            
                              String category = "";
            
                              if (totalBmi < 18.5) {
                                category = "Underweight";
                                bgColor=Colors.blue.shade500;
                              } else if (totalBmi < 25) {
                                category = "Normal";
                                bgColor=Colors.green.shade500;
                              } else if (totalBmi < 30) {
                                category = "Overweight";
                                bgColor = Colors.orange.shade500;
                              } else {
                                category = "Obese";
                                bgColor = Colors.red.shade500;
                              }
            
                              setState(() {
                                result =
                                    "Your BMI is ${totalBmi.toStringAsFixed(2)}\nCategory: $category";
                              });
            
                            } else {
                              setState(() {
                                result = "Please fill all input fields";
                              });
                            }
                          },
                          child: const Text("Calculate"),
                        ),
                      ),
            
                      /// Result
                      Text(
                        result,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
