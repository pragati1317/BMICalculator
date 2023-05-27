import 'package:flutter/material.dart';

import 'main.dart';
class ResultPage extends StatelessWidget {
  const ResultPage({Key? key, required this.result}) : super(key: key);

  final String result;
  @override
  Widget build(BuildContext context) {
 return Scaffold(
     body:Center(child:
 Column(children:[
    Text('Result', style:TextStyle(fontSize:32,fontWeight:FontWeight.bold,color:Colors.blue),),
   const SizedBox(width:20,),
   Text(result, style:TextStyle(fontSize:24, fontWeight: FontWeight.bold,),),
   Container(
     child:LayoutBuilder(builder:(context,constraints) {
       if(18 > int.parse(result)){
         return Text('UnderWeight,Eat some food', style:TextStyle(color:Colors.yellow, fontWeight:FontWeight.bold, fontSize:30),);
       }else if(18<=int.parse(result) && (int.parse(result)<24))
         {
           return Text('Normal,Welldone', style:TextStyle(color:Colors.green, fontWeight:FontWeight.bold, fontSize:30),);
         }
       else
         {
           return Text("Overweighted \n Eat Less, WorK Hard\n", style:TextStyle(color:Colors.red, fontWeight:FontWeight.bold, fontSize:30),);
         }
     })
   ),
   ElevatedButton(
     onPressed: (){
       Navigator.push(
           context,
           MaterialPageRoute(builder:(context)=> LandingPage())
       );
     },
     child: const Text('Back'),
     style: ElevatedButton.styleFrom(
       padding:const EdgeInsets.all(16),
       textStyle:const TextStyle(fontSize:20),
       backgroundColor:Colors.pink,
     ),
   ),
 ],),),
 );
  }
}
