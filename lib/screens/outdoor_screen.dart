import 'package:flutter/material.dart';

class OutdoorScreen extends StatefulWidget {
  const OutdoorScreen({super.key});

  @override
  State<OutdoorScreen> createState() => _OutdoorScreenState();
}

class _OutdoorScreenState extends State<OutdoorScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Outdoor games'),
    );
  }
}
