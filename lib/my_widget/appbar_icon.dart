import 'package:flutter/material.dart';

class AppbarIcon extends StatelessWidget {
  const AppbarIcon({super.key,required this.iconData});

 final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Container(height: 40,
        width: 40,
        margin:const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            boxShadow:const [
              BoxShadow(color: Colors.grey, blurRadius: 5),
            ],
            color: Colors.white),
        child: Icon(
          iconData,
          size: 20,
        ));
  }
}
