import 'package:calculator/provider/mainProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> buttons = [
      "AC", "( )", "%", "÷",
      "7", "8", "9", "X",
      "4", "5", "6", "-",
      "1", "2", "3", "+",
      "0", ".", "=",
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Consumer<MainProvider>(
          builder: (context,value,child) {
            return Column(
              children: [
                Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Text(value.displayText,style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold
                  ),),
                ),
                SizedBox(height: 10,),
                GridView.builder(
                  itemCount: buttons.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing:30,
                    childAspectRatio: 1,
                    mainAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    return ElevatedButton(
                      onPressed: () {
                        Provider.of<MainProvider>(context,listen: false).buttonPressed(buttons[index]);
                        print(buttons[index]);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _getButtonColor(buttons[index]),

                      ),
                      child: Text(
                        buttons[index],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          }
        ),
      ),
    );
  }

  Color? _getButtonColor(String buttonText) {
    switch (buttonText) {
      case "AC":

      case "( )":
      case "%":
      return Colors.grey[700];

      case "÷":
      case "X":
      case "-":
      case "+":
      case "=":
        return Colors.orange;
      default:
        return Colors.grey[900];
    }
  }
}

