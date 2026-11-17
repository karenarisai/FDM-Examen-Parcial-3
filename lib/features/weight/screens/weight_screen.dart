import 'package:flutter/material.dart';
import 'package:fit_track/features/weight/models/weight_model.dart';
import 'package:fit_track/features/weight/screens/add_weight_screen.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({super.key});

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  List<WeightModel> _weights = [];

  void _navigateToAddWeightScreen() async {
    final newWeight = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddWeightScreen()),
    );

    if (newWeight != null && newWeight is WeightModel) {
      setState(() {
        _weights.add(newWeight);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Peso'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: _weights.isEmpty
          ? const Center(child: Text('No hay registros de peso.'),)
          : ListView.builder(
        itemCount: _weights.length,
        itemBuilder: (context, index) {
          final weight = _weights[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              leading: const Icon(Icons.monitor_weight),
              title: Text('Fecha: ${weight.fecha}'),
              subtitle: Text('Peso: ${weight.pesoKilos.toStringAsFixed(2)} kg'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddWeightScreen,
        child: const Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}