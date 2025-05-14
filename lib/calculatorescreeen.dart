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
          onTap:() => onBtnTap(value),
          child: Center(
            child: Text(value,style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25),)
            ),
        ),
      ),
    );
  }
  ///number 1 operand number1
  ///
  ///
  
  void onBtnTap(String value){
    if(value==Btn.del){
      delete();
      return;
    }
    if(value==Btn.clr){
      clearAll();
      return;
    }
appendValue(value);

  }
  // ########
  // clears all output
  void clearAll(){
    setState(() {
      number1 = "";
    operand = "";
    number2 = "";
    });
  }

  // delete one from the end
  void delete(){
    if(number2.isNotEmpty){
      // 1234=1232
      number2=number2.substring(0, number2.length - 1);
    }else if (operand.isNotEmpty){
      operand="";
    }else if (number1.isNotEmpty){
      number1 = number1.substring(0,number1.length - 1);
    }
    setState(() {
      
    });
  }
  // appends value to the end
  
  void appendValue(String value){
 // if is operand and not '.'
    if(value!=Btn.dot&&int.tryParse(value)==null){
    //operand pressed
    if(operand.isNotEmpty&&number2.isNotEmpty){
      //todo calaculate the eqaution before assigning 

    }
    operand = value;
  }
  // assign sin value to nmber 1 variable
  else if (number1.isEmpty || operand.isEmpty){
    // check if value is '.' | ex:number1 = '1.2'


    if(value==Btn.dot && number1.contains(Btn.dot)){return;}
    if(value==Btn.dot && (number1.isEmpty || number1==Btn.n0)){
      // ex:number 1='' | '0'
      value='0.'; 


    }
    number1 += value;


    
  }
  else if (number2.isEmpty || operand.isNotEmpty){

    if(value==Btn.dot && number2.contains(Btn.dot)){return;}
    if(value==Btn.dot && (number2.isEmpty || number2==Btn.n0)){
      value='0.'; 


    }
    number2 += value;


    
  }
    setState(() {
         


    });
  }

  }
   
  ///


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
