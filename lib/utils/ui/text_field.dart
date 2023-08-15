import 'package:bfweb/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum InputType{
  text,
  number
}

class BFTextField extends StatefulWidget{
  final EdgeInsetsGeometry padding;
  final String value;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final bool showEyeIcon;
  final bool showUnderLine;
  final bool enable;
  final TextInputType? textInputType;
  final InputType inputType;
  final TextStyle? style;
  final int? maxLines;

  const BFTextField({super.key,
    this.padding = EdgeInsets.zero,
    this.value = "",
    this.hintText = "",
    this.enable = true,
    this.showEyeIcon = false,
    this.showUnderLine = true,
    this.textInputType,
    this.inputType = InputType.text,
    this.maxLines,
    this.style,
    this.onChanged
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BFTextFieldState();
  }
}

class _BFTextFieldState extends State<BFTextField>{

  TextEditingController controller = TextEditingController();
  bool obscureText = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.value = TextEditingValue(text: widget.value,
      selection:TextSelection.collapsed(offset: widget.value!.length??-1),
    );
    obscureText = widget.showEyeIcon;
  }

  @override
  void didUpdateWidget(covariant BFTextField oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    controller.value = TextEditingValue(text: widget.value,
      selection:TextSelection.collapsed(offset: widget.value!.length??-1),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
        padding: widget.padding,
        child: TextField(
          enabled: widget.enable,
          cursorColor: textDarkColor,
          textInputAction: TextInputAction.done,
          keyboardType: widget.textInputType,
          maxLines: widget.maxLines,
          style: widget.style??TextUtils.mediumDartText(fontSize: 16),
          decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle:
                  const TextStyle(color: Color(0xFFBFBFBF), fontSize: 14),
              border: widget.showUnderLine?const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffD6D6D6))):InputBorder.none,
              focusedBorder: widget.showUnderLine?const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffD6D6D6))):InputBorder.none,
            suffixIcon: widget.showEyeIcon?IconButton(
              icon: Icon(obscureText?Icons.visibility_off_outlined:Icons.visibility_outlined),
              color: const Color(0xffbfbfbf),
              onPressed: () {
                setState(() {
                  obscureText=!obscureText;
                });
              },
            ):null
          ),
          inputFormatters: inputFormatters(),
          onChanged: widget.onChanged,
          controller: controller,
          obscureText:obscureText,
        )
    );
  }

  List<TextInputFormatter> inputFormatters(){
    switch(widget.inputType){
      case InputType.text:
        return [];
      case InputType.number:
        return [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
        ];
      default:
        return [];
    }

  }

}