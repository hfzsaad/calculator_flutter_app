import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/calculation_controller.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import '../widget/custom_button.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<String> buttons = [
    "C", "DEL", "%", "/", "9", "8", "7", "x", "6", "5", "4", "-",
    "3", "2", "1", "+", "0", ".", "ANS", "=",
  ];

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CalculateController>();

    return Scaffold(
      backgroundColor: LightColors.scaffoldBackgroundColor,
      body: Column(
        children: [
          GetBuilder<CalculateController>(builder: (controller) {
            return outPutSection(controller);
          }),
          inPutSection(controller),
        ],
      ),
    );
  }

  Widget inPutSection(CalculateController controller) {
    return Expanded(
      flex: 2,
      child: Container(
        padding: const EdgeInsets.all(Dimens.spaceXSmall),
        decoration: const BoxDecoration(
          color: LightColors.sheetBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimens.spaceXXlarge),
            topRight: Radius.circular(Dimens.spaceXXlarge),
          ),
        ),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: buttons.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return CustomButton(
                  buttonTapped: () {
                    controller.clearInputAndOutput();
                  },
                  color: LightColors.leftOperatorColor,
                  textColor: Colors.black,
                  text: buttons[index],
                );
              case 1:
                return CustomButton(
                  buttonTapped: () {
                    controller.deleteBtnAction();
                  },
                  color: LightColors.leftOperatorColor,
                  textColor: Colors.black,
                  text: buttons[index],
                );
              case 19:
                return CustomButton(
                  buttonTapped: () {
                    controller.equalPressed();
                  },
                  color: LightColors.leftOperatorColor,
                  textColor: Colors.black,
                  text: buttons[index],
                );
              default:
                return CustomButton(
                  buttonTapped: () {
                    controller.onBtnTapped(buttons, index);
                  },
                  color: LightColors.btnBackgroundColor,
                  textColor: Colors.white,
                  text: buttons[index],
                );
            }
          },
        ),
      ),
    );
  }

  Widget outPutSection(CalculateController controller) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: Dimens.spaceXlarge, top: Dimens.spaceXXXXXlarge),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    controller.userInput ?? '',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: Dimens.textXXLarge,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    controller.userOutput ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: Dimens.textSLarge + Dimens.textSLarge,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String y) {
    return y == "%" || y == "/" || y == "x" || y == "-" || y == "+" || y == "=";
  }
}
