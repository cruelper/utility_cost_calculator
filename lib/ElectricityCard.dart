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
          CustomTextField("Тариф день (р/кВт*ч)", fareElDayController),
          CustomTextField(
                "Текущие показания день (кВт*ч)", currentElReadingsDayController),
          CustomTextField(
                "Предыдущие показания день (кВт*ч)", pastElReadingsDayController),
          CustomTextField("Тариф ночь (р/кВт*ч)", fareElNightController),
          CustomTextField(
                "Текущие показания ночь (кВт*ч)", currentElReadingsNightController),
          CustomTextField(
                "Предыдущие показания ночь (кВт*ч)", pastElReadingsNightController),
        ],
      ),
    );
  }
}
