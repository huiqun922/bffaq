
import 'package:bfweb/utils/global.dart';
import 'package:flutter/material.dart';

class CardView extends StatelessWidget{
  Widget? child;
  EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry? margin;
  double? width;
  double? height;


  CardView({super.key,this.width,this.height,
    this.child,EdgeInsetsGeometry? padding,EdgeInsetsGeometry? margin}){
     this.margin =  margin??EdgeInsets.symmetric(vertical: 8.scale,horizontal: 12.scale);
     this.padding = padding??EdgeInsets.symmetric(vertical: 25.scale,horizontal: 30.scale);
   }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: padding,
      margin: margin,
      width: width,
      height: height,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.scale),
        shape: BoxShape.rectangle,
        boxShadow: const [
          BoxShadow(
            color: Color(0x0c36363A),
            offset: Offset(0, 1),
            blurRadius:10,
          ),
        ],
      ),
      child: child,
    );
  }

}