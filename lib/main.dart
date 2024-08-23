import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app/IntroPage.dart';
import 'package:my_app/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  var bgcolor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        color: bgcolor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("BMI Calculator",
                  style: TextStyle(fontWeight: FontWeight.w700 , fontSize: 35),
                      ),
                SizedBox(height: 20,),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter your weight in KG'),
                    prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11,),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text('Enter your Height (in feet)'),
                    prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11,),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    label: Text('Enter your Height (in inch)'),
                    prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();

                  if(wt!="" && ft!="" && inch!=""){
                    var iWt = int.parse(wt);
                    var iFt = int.parse(ft);
                    var iInch = int.parse(inch);
                    var tInch = (iFt*12) + iInch;
                     var tCm = tInch*2.54;
                     var tM = tCm/100;
                     var bmi = iWt/(tM*tM);
                     var msg = "";
                     if(bmi>25){
                       msg = " Your are overweight!!";
                       bgcolor = Colors.red.shade200;
                     }else if(bmi<18){
                       msg = " Your are underweight!!";
                       bgcolor = Colors.blueGrey.shade200;
                     }else{
                       msg = "Your are Healthy!! ";
                       bgcolor = Colors.green.shade200;
                     }
                     setState(() {
                       result = "$msg \n Your BMI is:  ${bmi.toStringAsFixed(2)}";
                     });


                  }else{
                    setState(() {
                      result = "Please fill all the blanks!!";
                    });

                  }

                }, child: Text('Calculate')),
                Text(result , style: TextStyle(fontSize: 16),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
