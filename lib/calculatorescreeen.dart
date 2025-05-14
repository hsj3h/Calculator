import 'package:calculator/buttons_value.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String number1 = "";   //0-9
  String operand = "";  //+ - * /
  String number2 = "";  //. 0-9
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
                reverse: true,
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "$number1$operand$number2".isEmpty?"0"
                    :"$number1$operand$number2",
                    
                  style: const TextStyle(
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
                  width:value==Btn.n0?screenSize.width/2
                  :(screenSize.width/4 ),
                  height:screenSize.width/5 ,

                  child: buildButton(value)),
                ).toList(),
              
              )
        
        
          ],
        ),
      ),
    );
  }
  // #####
  Widget buildButton(value) {
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: Material(
        color:getBtnColor(value),
        
        clipBehavior: Clip.hardEdge,
        shape: OutlineInputBorder(
          borderSide:const BorderSide(
            color: Colors.yellow
            ),
          borderRadius: BorderRadius.circular(100)
        ),
        child: InkWell(
          onTap:() {} ,
          child: Center(
            child: Text(value,style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25),)
            ),
        ),
      ),
    );
  }
  Color getBtnColor(value){
    return 
    [Btn.del,Btn.clr].contains(value)?Colors.blueAccent
        :[
          Btn.per,
          Btn.multiply,
          Btn.add,
          Btn.subtract,
          Btn.divide,
          Btn.calculate,
          ].contains(value)
          ?Colors.red
          :Colors.pink;
  }
}