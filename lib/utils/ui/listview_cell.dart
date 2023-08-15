import 'package:bfweb/utils/global.dart';
import 'package:flutter/material.dart';

class ListViewCell extends StatefulWidget{

  ImageProvider? image;
  double? imageSize;
  String title;
  String? detailTitle;
  bool showArrow;
  EdgeInsetsGeometry? padding;
  VoidCallback? click;
  bool? isSelected;
  VoidCallback? selectAction;
  Widget? rightView;

  ListViewCell({super.key,
    this.image,
    double? imageSize,
    this.title="",
    this.detailTitle,
    this.showArrow=true,
    EdgeInsetsGeometry? padding,
    this.click,
    this.isSelected,
    this.selectAction,
    this.rightView
  }){
    this.padding = padding??EdgeInsets.fromLTRB(0, 8.scale, 0, 8.scale);
    this.imageSize = imageSize??(image==null?0:52);
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ListViewCellState();
  }
}

class _ListViewCellState extends State<ListViewCell> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //bfLog("object ${widget.padding}");
    return Column(
      children: [
      Padding(
        padding: widget.padding!,
        child:
            TextButton(onPressed: widget.click, child: contentView())),
            Divider(
              indent:widget.image==null && widget.imageSize==0 ? 8.scale:(widget.imageSize!+20.scale),
              endIndent: 12.scale,
              color: const Color(0xFFD6D6D6),
              height: 0.5,
            )
          ],
        );
  }

  Widget contentView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        header(),
        imageView(),
        Expanded(child: centerView()),
        widget.showArrow
            ? const Icon(
                Icons.arrow_forward_ios_outlined,
                color: textGrayColor,
                size: 18,
              )
            : Container()
      ],
    );
  }
  
  Widget header(){
    if(widget.isSelected==null) {
      return Container();
    }

    return TextButton(
        onPressed: widget.selectAction,
        child: IconButton(
            icon: Icon(
                widget.isSelected! ? Icons.check_circle : Icons.circle_outlined,
                color: bgDarkColor),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            constraints: const BoxConstraints(
              minWidth: 21,
              minHeight: 48,
            ),
            onPressed: widget.selectAction));
  }

  Widget imageView() {
    return widget.image == null && widget.imageSize == 0
        ? Container()
        : Container(
            padding: EdgeInsets.only(right: 12.scale),
            child: widget.image == null
                ? SizedBox(
              height: widget.imageSize,
              width: widget.imageSize,
            )
                : Image(
                    image: widget.image!,
                    height: widget.imageSize,
                    width: widget.imageSize,
                  ));
  }

  Widget titleView() {
    return widget.detailTitle == null
        ? Text(
            widget.title,
            style: TextUtils.mediumDartText(fontSize: 16),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: TextUtils.mediumDartText(fontSize: 16),
                textAlign: TextAlign.left,
              ),
              Text(
                widget.detailTitle!,
                maxLines: 3,
                style: TextUtils.regularGrayText(fontSize: 12),
              ),
            ],
          );
  }

  Widget centerView(){

    return widget.rightView==null?titleView():
        Row(
          children: [
            Expanded(child: titleView()),
            widget.rightView!
          ],
        );
  }
}