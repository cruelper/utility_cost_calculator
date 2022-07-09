import 'package:flutter/material.dart';
import 'package:utility_cost_calculator/AlertWithResult.dart';
import 'package:utility_cost_calculator/ColdWaterCard.dart';
import 'package:utility_cost_calculator/ElectricityCard.dart';
import 'package:utility_cost_calculator/HotWaterCard.dart';
import 'package:utility_cost_calculator/GasCard.dart';

void main() => runApp(const UtilityCostCalculatorApp());

class UtilityCostCalculatorApp extends StatelessWidget {
  const UtilityCostCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Калькулятор стоимости ЖКХ',
      home: UtilityCostCalculatorForm(),
    );
  }
}

// Define a custom Form widget.
class UtilityCostCalculatorForm extends StatefulWidget {
  const UtilityCostCalculatorForm({super.key});

  @override
  State<UtilityCostCalculatorForm> createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyCustomFormState extends State<UtilityCostCalculatorForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final _formKey = GlobalKey<FormState>();

  final fareElDayController = TextEditingController();
  final currentElReadingsDayController = TextEditingController();
  final pastElReadingsDayController = TextEditingController();
  final fareElNightController = TextEditingController();
  final currentElReadingsNightController = TextEditingController();
  final pastElReadingsNightController = TextEditingController();

  final fareHotWaterController = TextEditingController();
  final currentHotWaterReadingsController = TextEditingController();
  final pastHotWaterReadingsController = TextEditingController();

  final fareColdWaterController = TextEditingController();
  final currentColdWaterReadingsController = TextEditingController();
  final pastColdWaterReadingsController = TextEditingController();

  final fareGasController = TextEditingController();
  final currentGasReadingsController = TextEditingController();
  final pastGasReadingsController = TextEditingController();
  BoolWrapper isGas = BoolWrapper();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    fareElDayController.dispose();
    currentElReadingsDayController.dispose();
    pastElReadingsDayController.dispose();
    fareElNightController.dispose();
    currentElReadingsNightController.dispose();
    pastElReadingsNightController.dispose();
    fareHotWaterController.dispose();
    currentHotWaterReadingsController.dispose();
    pastHotWaterReadingsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: const Text('Калькулятор стоимости ЖКХ'),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Column(
                  children: [
                    ElectricityCard(
                        fareElDayController,
                        currentElReadingsDayController,
                        pastElReadingsDayController,
                        fareElNightController,
                        currentElReadingsNightController,
                        pastElReadingsNightController),
                    HotWaterCard(
                        fareHotWaterController,
                        currentHotWaterReadingsController,
                        pastHotWaterReadingsController),
                    ColdWaterCard(
                        fareColdWaterController,
                        currentColdWaterReadingsController,
                        pastColdWaterReadingsController),
                    GasCard(fareGasController, currentGasReadingsController,
                        pastGasReadingsController, isGas),
                    Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      child: SizedBox(
                        width: 300.0,
                        child: ElevatedButton(

                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                double elDay = getDouble(fareElDayController) *
                                    (getDouble(currentElReadingsDayController) - getDouble(pastElReadingsDayController));
                                double elNight = getDouble(fareElNightController) *
                                    (getDouble(currentElReadingsNightController) - getDouble(pastElReadingsNightController));

                                double hotWater = getDouble(fareHotWaterController) *
                                    (getDouble(currentHotWaterReadingsController) - getDouble(pastHotWaterReadingsController));
                                double coldWater = getDouble(fareColdWaterController) *
                                    (getDouble(currentColdWaterReadingsController) - getDouble(pastColdWaterReadingsController));

                                double gas = 0;
                                if (isGas.getBool()){
                                  gas = getDouble(fareGasController) *
                                      (getDouble(currentGasReadingsController) - getDouble(pastGasReadingsController));
                                }

                                showAlertDialog(context, elDay + elNight, hotWater + coldWater, gas);
                              }
                            },
                            child: const Text("Рассчитать")),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}

double getDouble(TextEditingController controller){
  return double.parse(controller.text);
}

class BoolWrapper {
  bool _value = true;
  bool getBool() => _value;
  void setBool(bool value){
    this._value = value;
  }
}