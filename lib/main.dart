import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Home Page',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const CornerConfigurator(),
    );
  }
}

class CornerConfigurator extends StatefulWidget {
  const CornerConfigurator({super.key});

  @override
  _CornerConfiguratorState createState() => _CornerConfiguratorState();
}

class _CornerConfiguratorState extends State<CornerConfigurator> {
  double _topLeft = 0.0;
  double _topRight = 0.0;
  double _bottomLeft = 0.0;
  double _bottomRight = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(_topLeft),
                topRight: Radius.circular(_topRight),
                bottomLeft: Radius.circular(_bottomLeft),
                bottomRight: Radius.circular(_bottomRight),
              ),
            ),
          ),
          const SizedBox(height: 20),
          _buildSlider('TL', _topLeft, (value) {
            setState(() {
              _topLeft = value;
            });
          }),
          _buildSlider('TR', _topRight, (value) {
            setState(() {
              _topRight = value;
            });
          }),
          _buildSlider('BL', _bottomLeft, (value) {
            setState(() {
              _bottomLeft = value;
            });
          }),
          _buildSlider('BR', _bottomRight, (value) {
            setState(() {
              _bottomRight = value;
            });
          }),
        ],
      ),
    );
  }


  Widget _buildSlider(String label, double value, ValueChanged<double> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$label: ${value.toStringAsFixed(2)}'),
        Expanded(
          child: Slider(
            value: value,
            min: 0,
            max: 75,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
