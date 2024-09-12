import 'package:flutter/material.dart';
import 'package:units_converter/units_converter.dart';
import 'package:ase456_group_project/lists/units.dart';

class Unit extends StatefulWidget {
  const Unit({Key? key}) : super(key: key);

  @override
  State<Unit> createState() => _UnitState();
}

class _UnitState extends State<Unit> {
  double _leftAmount = 0.0;
  double _rightAmount = 0.0;
  Type _unitType = AMOUNT_OF_SUBSTANCE;
  Enum _rightUnit = AMOUNT_OF_SUBSTANCE.femtomoles;
  Enum _leftUnit = AMOUNT_OF_SUBSTANCE.micromoles;

  final _leftController = TextEditingController();
  final _rightController = TextEditingController();

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double boxWidth = MediaQuery.of(context).size.width * 0.4;
    final double fullWidth = MediaQuery.of(context).size.width * 0.9;
    const double rowSpacer = 40.0;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: fullWidth,
                  child: DropdownButton<Type>(
                    value: _unitType,
                    isExpanded: true,
                    items: unitTypes.map((Type unit) {
                      return DropdownMenuItem<Type>(
                        value: unit,
                        child: Center(
                            child: Text(unit.toString().split('.').last)),
                      );
                    }).toList(),
                    onChanged: (Type? newValue) {
                      setState(() {
                        _unitType = newValue!;
                        _leftUnit = getUnitType(
                            _unitType, unitTypeUnits[newValue]![0])!;
                        _rightUnit = getUnitType(
                            _unitType, unitTypeUnits[newValue]![1])!;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: rowSpacer),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: boxWidth,
                      child: DropdownButton<String>(
                        value: getUnitString(_leftUnit),
                        isExpanded: true,
                        items: unitTypeUnits[_unitType]!.map((String unit) {
                          return DropdownMenuItem<String>(
                            value: unit,
                            child: Center(child: Text(unit)),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _leftUnit = getUnitType(_unitType, newValue!)!;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: boxWidth,
                      child: TextField(
                        controller: _leftController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Amount',
                        ),
                        onSubmitted: (String value) async {
                          if (value.isEmpty) return;
                          try {
                            double inputValue = double.parse(value);
                            if (inputValue <= 0) {
                              throw const FormatException(
                                  "Input must be a positive number");
                            }
                            _leftAmount = inputValue;
                            final convertedAmount = _leftAmount.convertFromTo(
                                _leftUnit, _rightUnit);
                            setState(() {
                              _rightAmount = convertedAmount!;
                              _leftController.text = value;
                              _rightController.text =
                                  convertedAmount.toString();
                            });
                          } catch (e) {
                            _showSnackBar(
                                "Invalid input. Please enter a positive number.");
                          }
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: boxWidth,
                      child: DropdownButton<String>(
                        value: getUnitString(_rightUnit),
                        isExpanded: true,
                        items: unitTypeUnits[_unitType]!.map((String unit) {
                          return DropdownMenuItem<String>(
                            value: unit,
                            child: Center(child: Text(unit)),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _rightUnit = getUnitType(_unitType, newValue!)!;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: boxWidth,
                      child: TextField(
                        controller: _rightController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Amount',
                        ),
                        onSubmitted: (String value) async {
                          if (value.isEmpty) return;
                          try {
                            double inputValue = double.parse(value);
                            if (inputValue <= 0) {
                              throw const FormatException(
                                  "Input must be a positive number");
                            }
                            _rightAmount = inputValue;
                            final convertedAmount = _rightAmount.convertFromTo(
                                _rightUnit, _leftUnit);
                            setState(() {
                              _leftAmount = convertedAmount!;
                              _rightController.text = value;
                              _leftController.text = convertedAmount.toString();
                            });
                          } catch (e) {
                            _showSnackBar(
                                "Invalid input. Please enter a positive number.");
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
