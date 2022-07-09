import 'package:flutter/material.dart';
import 'package:utility_cost_calculator/CustomTextField.dart';
import 'package:utility_cost_calculator/main.dart';

class GasCard extends StatefulWidget {
  TextEditingController fareGasController;
  TextEditingController currentGasReadingsController;
  TextEditingController pastGasReadingsController;
  BoolWrapper isGas;

  GasCard(this.fareGasController, this.currentGasReadingsController,
      this.pastGasReadingsController, this.isGas,
      {Key? key})
      : super(key: key);

  @override
  _GasCardState createState() => _GasCardState(fareGasController,
      currentGasReadingsController, pastGasReadingsController, isGas);
}

class _GasCardState extends State<GasCard> {
  TextEditingController fareGasController;
  TextEditingController currentGasReadingsController;
  TextEditingController pastGasReadingsController;
  BoolWrapper isGas;

  _GasCardState(
    this.fareGasController,
    this.currentGasReadingsController,
    this.pastGasReadingsController,
    this.isGas,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  const Text(
                    "Газ",
                    style: TextStyle(fontSize: 20),
                  ),
                  Switch(
                      value: isGas.getBool(),
                      onChanged: (value) {
                        setState(() {
                          isGas.setBool(!isGas.getBool());
                        });
                      }),
                ],
              ),
            ),
          ),
          Column(
            children: [
              CustomTextField.withState(
                    "Тариф (р/куб.м)", fareGasController, isGas.getBool()),
              CustomTextField.withState(
                    "Текущие показания (куб.м)", currentGasReadingsController, isGas.getBool()),
              CustomTextField.withState(
                    "Предыдущие показания (куб.м)", pastGasReadingsController, isGas.getBool()),
            ],
          ),
        ],
      ),
    );
  }
}
