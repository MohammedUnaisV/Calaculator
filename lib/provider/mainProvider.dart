import 'package:flutter/cupertino.dart';

class MainProvider extends ChangeNotifier {
  String _displayText = '';
  String _result = '';
  String _operator = '';
  double num1 = 0;
  double num2 = 0;

  String get displayText => _displayText;

  void buttonPressed(String buttonText) {
    if (buttonText == 'AC') {
      _clear();
    } else if (buttonText == '+' || buttonText == '-' || buttonText == 'X' || buttonText == '÷') {
      _operator = buttonText;
      num1 = double.parse(_displayText);
      _displayText = '';
    } else if (buttonText == '=') {
      num2 = double.parse(_displayText);
      _calculate();
    } else {
      _displayText += buttonText;
    }

    notifyListeners();
  }

  void _clear() {
    _displayText = '';
    _result = '';
    _operator = '';
    num1 = 0;
    num2 = 0;
  }

  void _calculate() {
    switch (_operator) {
      case '+':
        _result = (num1 + num2).toString();
        break;
      case '-':
        _result = (num1 - num2).toString();
        break;
      case 'X':
        _result = (num1 * num2).toString();
        break;
      case '÷':
        _result = (num1 / num2).toString();
        break;
    }
    _displayText = _result;
  }
}
