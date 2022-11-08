import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final HController = TextEditingController();
  final WController = TextEditingController();

  double? bmi;
  String result = 'กรุณาใส่น้ำหนักและความสูง';

  void calculate() {
    final double? height = double.tryParse(HController.value.text);
    final double? weight = double.tryParse(WController.value.text);

    if (height == null || height <= 0 || weight == null || weight <= 0) {
      setState(() {
        result = "กรุณาใส่น้ำหนักและความสูงให้ถูกต้อง";
      });
      return;
    }

    setState(() {
      bmi = weight / ((height / 100) * (height / 100));
      if (bmi! < 18.5) {
        result = "คุณผอมเกินไป";
      } else if (bmi! < 25) {
        result = 'คุณมีน้ำหนักเหมาะสม';
      } else if (bmi! < 30) {
        result = 'คุณมีความอ้วน';
      } else {
        result = 'คุณมีความอ้วนมาก';
      }
    });
  }

  void clearData() {
    setState(() {
      result = 'กรุณาใส่น้ำหนักและความสูง';
      bmi = 0;
      HController.clear();
      WController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        appBarTheme: AppBarTheme(
          // iconTheme: IconThemeData(color: Colors.red),
          color: Color.fromARGB(255, 255, 210, 75),
          foregroundColor: Colors.black,
        ),
        fontFamily: 'Ubuntu',
        // primarySwatch: Colors.amber,
      ),
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 243, 196),
        appBar: AppBar(
          title: Text('BMI App'),
        ),
        body: Container(
          margin: EdgeInsets.all(16.0),
          child: Center(
              child: Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            color: Colors.white,
            elevation: 10.0,
            child: Container(
              padding: EdgeInsets.all(20.0),
              width: 350,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'โปรแกรมคำนวณค่า BMI',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Text(
                      bmi == null ? '0' : bmi!.toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      result,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      labelText: 'น้ำหนัก (กิโลกรัม)',
                      enabledBorder: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                        borderSide: BorderSide(color: Colors.blueGrey),
                      ),
                      focusedBorder: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                        borderSide: BorderSide(color: Colors.blueGrey),
                      ),
                      // border: OutlineInputBorder(
                      //     borderSide: BorderSide(color: Colors.blueGrey)),
                    ),
                    controller: WController,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      labelText: 'ความสูง (เซนติเมตร)',
                      enabledBorder: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                        borderSide: BorderSide(color: Colors.blueGrey),
                      ),
                      focusedBorder: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                        borderSide: BorderSide(color: Colors.blueGrey),
                      ),
                    ),
                    controller: HController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: clearData,
                          child: Text(
                            'ล้างข้อมูล',
                            style: TextStyle(color: Colors.blueGrey),
                          ),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: Color.fromARGB(255, 255, 255, 255),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            side: BorderSide(color: Colors.amber, width: 1),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: calculate,
                          child: Text(
                            'คำนวณ',
                            style: TextStyle(color: Colors.blueGrey),
                          ),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: Color.fromARGB(255, 255, 229, 125),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ])
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}
