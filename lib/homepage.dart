import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  String _result = '';
  Color _resultColor = Colors.black;

  String _weightError = '';
  String _heightError = '';

  void _calculateBMI() {
    final String weightText = _weightController.text;
    final String heightText = _heightController.text;

    _weightError = '';
    _heightError = '';

    if (weightText.isEmpty && heightText.isEmpty) {
      setState(() {
        _weightError = 'Harap masukkan berat badan!';
        _heightError = 'Harap masukkan tinggi badan!';
      });
      return;
    } else if (weightText.isEmpty) {
      setState(() {
        _weightError = 'Harap masukkan berat badan!';
      });
      return;
    } else if (heightText.isEmpty) {
      setState(() {
        _heightError = 'Harap masukkan tinggi badan!';
      });
      return;
    }

    final double weight = double.parse(weightText);
    final double height = double.parse(heightText) / 100;
    final double bmi = weight / (height * height);

    String category;
    if (bmi < 18.5) {
      category = 'Underweight';
      _resultColor = Colors.yellow;
    } else if (bmi >= 18.5 && bmi <= 25) {
      category = 'Normal';
      _resultColor = Colors.green;
    } else {
      category = 'Overweight';
      _resultColor = Colors.red;
    }

    setState(() {
      _result = 'BMI: ${bmi.toStringAsFixed(2)}\nCategory: $category';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator BMI'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          
          Positioned.fill(
            child: Image.asset(
              'assets/images/laut.jpg',
              fit: BoxFit.cover,
            ),
          ),
          
        
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black54, Colors.black26],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          
          
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Hitung BMI Anda',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                
               
                TextField(
                  controller: _heightController,
                  decoration: InputDecoration(
                    labelText: 'Tinggi (cm)',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.lightBlue,
                        width: 2.0,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
               
                if (_heightError.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      _heightError,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                      ),
                    ),
                  ),
                SizedBox(height: 20),
               
                
                TextField(
                  controller: _weightController,
                  decoration: InputDecoration(
                    labelText: 'Berat (kg)',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.lightBlue,
                        width: 2.0,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
               
                if (_weightError.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      _weightError,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                      ),
                    ),
                  ),
                SizedBox(height: 20),
                
                ElevatedButton(
                  onPressed: _calculateBMI,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Hitung BMI',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white, 
                    ),
                  ),
                ),
                SizedBox(height: 20),
                
                Text(
                  _result,
                  style: TextStyle(
                    fontSize: 24,
                    color: _resultColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
