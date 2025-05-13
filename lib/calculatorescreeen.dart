import 'package:calculator/buttons_value.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          
          children: [
            // Output
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.all(16),
                  child: Text("0",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 48
                  ),textAlign: TextAlign.end,
                  ),
                ),
              ),
            ),
        
        
            // buttons
            Wrap(
              children:Btn.buttonValues.map(
                (value) => SizedBox(
                  width:screenSize.width/4 ,
                  height:screenSize.width/5 ,

                  child: buildButton(value)),
                ).toList(),
              
              )
        
        
          ],
        ),
      ),
    );
  }
  
  Widget buildButton(value) {
    return Text(value);
  }
}