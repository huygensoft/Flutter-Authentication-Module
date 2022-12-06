// ignore_for_file: prefer_const_constructors, must_be_immutable, sort_child_properties_last

import 'package:flutter/material.dart';


class SignupButton extends StatelessWidget {
  String? text;
  AssetImage? imageIcon;
  VoidCallback? onPressed;

  SignupButton({Key? key, this.text, this.imageIcon, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
         SizedBox(width:15),
          Text(text!,
              style: TextStyle(
                  fontFamily: "Nunito",
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600)),
        ],
      ),
      style: ElevatedButton.styleFrom(
        elevation: 0, backgroundColor: Colors.transparent,
        fixedSize: const Size(350, 60),
        shape: StadiumBorder(side: BorderSide(color: Colors.black, width: 1.5)),
      ),
    );
  }
}
