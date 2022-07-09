import 'package:flutter/material.dart';
import 'package:utility_cost_calculator/CustomTextField.dart';

class ElectricityCard extends StatelessWidget {
  TextEditingController fareElDayController;
  TextEditingController currentElReadingsDayController;
  TextEditingController pastElReadingsDayController;

  TextEditingController fareElNightController;
  TextEditingController currentElReadingsNightController;
  TextEditingController pastElReadingsNightController;

  ElectricityCard(
      this.fareElDayController,
      this.currentElReadingsDayController,
      this.pastElReadingsDayController,
      this.fareElNightController,
      this.currentElReadingsNightController,
      this.pastElReadingsNightController,
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
                "Электроэнергия",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          CustomTextField("Тариф день", fareElDayController),
          CustomTextField(
                "Текущие показания день", currentElReadingsDayController),
          CustomTextField(
                "Предыдущие показания день", pastElReadingsDayController),
          CustomTextField("Тариф ночь", fareElNightController),
          CustomTextField(
                "Текущие показания ночь", currentElReadingsNightController),
          CustomTextField(
                "Предыдущие показания ночь", pastElReadingsNightController),
        ],
      ),
    );
  }
}
