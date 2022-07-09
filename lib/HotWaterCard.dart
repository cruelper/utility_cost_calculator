import 'package:flutter/material.dart';
import 'package:utility_cost_calculator/CustomTextField.dart';

class HotWaterCard extends StatelessWidget {
  TextEditingController fareHotWaterController;
  TextEditingController currentHotWaterReadingsController;
  TextEditingController pastHotWaterReadingsController;

  HotWaterCard(
      this.fareHotWaterController,
      this.currentHotWaterReadingsController,
      this.pastHotWaterReadingsController,
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
                "Горячая вода",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Column(
            children: [
              CustomTextField("Тариф (р/куб.м)", fareHotWaterController),
              CustomTextField("Текущие показания (куб.м)", currentHotWaterReadingsController),
              CustomTextField("Предыдущие показания (куб.м)", pastHotWaterReadingsController),
            ],
          ),
        ],
      ),
    );
  }
}
