import 'package:flutter/material.dart';
import 'package:utility_cost_calculator/CustomTextField.dart';

class ColdWaterCard extends StatelessWidget {
  TextEditingController fareColdWaterController;
  TextEditingController currentColdWaterReadingsController;
  TextEditingController pastColdWaterReadingsController;

  ColdWaterCard(
      this.fareColdWaterController,
      this.currentColdWaterReadingsController,
      this.pastColdWaterReadingsController,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Холодная вода",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Column(
            children: [
              CustomTextField("Тариф", fareColdWaterController),
              CustomTextField("Текущие показания", currentColdWaterReadingsController),
              CustomTextField("Предыдущие показания", pastColdWaterReadingsController),
            ],
          ),
        ],
      ),
    );
  }
}
