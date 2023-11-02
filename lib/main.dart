import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  var bgColor = Colors.white10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text('yourBMI')),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI',
                    style:
                        TextStyle(fontSize: 34, fontWeight: FontWeight.w400)),
                SizedBox(height: 21),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    hintText: 'Enter your weight in Kg',
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    hintText: 'Enter your height in feet',
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    hintText: 'Enter your height(in Inch)',
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11),
                ElevatedButton(
                  onPressed: () {
                    var wt = wtController.text;
                    var ft = ftController.text;
                    var it = inController.text;
                    if (wt != "" && ft != "" && it != "") {
                      var iWt = double.parse(wt);
                      var ift = double.parse(ft);
                      var iit = int.parse(it);
                      var tInch = (ift * 12) + iit; // Calculate total inches
                      var tCm = tInch * 2.54; // Convert inches to centimeters
                      var tM = tCm / 100; // Convert centimeters to meters
                      var bmi = iWt / (tM * tM); // Calculate BMI
                      var msg = "";
                      if (bmi > 25) {
                        msg = "You are Overweight";
                        bgColor = Colors.orange.shade200;
                      } else if (bmi < 18) {
                        msg = "You are Underweight";
                        bgColor = Colors.red.shade500;
                      } else {
                        msg = "You are healthy";
                        bgColor = Colors.green.shade200;
                      }
                      setState(() {
                        result =
                            "$msg \n Your BMI is: ${bmi.toStringAsFixed(2)}"; // Display BMI
                      });
                    } else {
                      setState(() {
                        result = "Please fill all the blanks";
                      });
                    }
                  },
                  child: Text('Calculate'),
                ),
                SizedBox(height: 11),
                Text(result, style: TextStyle(fontSize: 16))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
