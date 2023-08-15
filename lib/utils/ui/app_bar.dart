import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const double _kLeadingWidth = 21;
class BFAppBar extends AppBar{
  final String? titleStr;
  VoidCallback? backAction;
  VoidCallback? rightAction;


  BFAppBar({super.key,
    this.titleStr="",
    super.backgroundColor = Colors.transparent,
    super.centerTitle = true,
    super.elevation = 0,
    super.systemOverlayStyle = const SystemUiOverlayStyle(statusBarColor: Colors.transparent,statusBarBrightness:Brightness.light,statusBarIconBrightness:Brightness.dark )
  }):super(title: Text(titleStr!,style: const TextStyle(fontSize: 17,color: Color(0xff191919)),));

  BFAppBar.back({super.key,
    this.titleStr="",
    this.backAction,
    super.backgroundColor = Colors.transparent,
    super.centerTitle = true,
    super.elevation = 0,
    super.systemOverlayStyle = const SystemUiOverlayStyle(statusBarColor: Colors.transparent,statusBarBrightness:Brightness.light,statusBarIconBrightness:Brightness.dark ),
  }):super(title: Text(titleStr!,style: const TextStyle(fontSize: 17,color: Color(0xff191919)),),
  //leading: IconButton(onPressed: backAction, icon: const Icon(Icons.arrow_back_ios_new_outlined),color: const Color(0xff191919),)
    leading:TextButton(onPressed: backAction, child: Image.asset("assets/img/icons/back.png",height: _kLeadingWidth,width: _kLeadingWidth,))
  );

  BFAppBar.manager({super.key,
    this.titleStr="",
    this.backAction,
    @required this.rightAction,
    super.backgroundColor = Colors.transparent,
    super.centerTitle = true,
    super.elevation = 0,
    super.systemOverlayStyle = const SystemUiOverlayStyle(statusBarColor: Colors.transparent,statusBarBrightness:Brightness.light,statusBarIconBrightness:Brightness.dark ),
  }):super(title: Text(titleStr!,style: const TextStyle(fontSize: 17,color: Color(0xff191919)),),
      //leading: backAction==null?null:IconButton(onPressed: backAction, icon: const Icon(Icons.arrow_back_ios_new_outlined),color: const Color(0xff191919),),
      leading:backAction==null?null:TextButton(onPressed: backAction, child: Image.asset("assets/img/icons/more.png",height: _kLeadingWidth,width: _kLeadingWidth,)),
      actions: [
        TextButton(onPressed: rightAction, child: Image.asset("assets/img/icons/add.png",height: _kLeadingWidth,width: _kLeadingWidth,))
      ]
  );

  BFAppBar.add({super.key,
    this.titleStr="",
    this.backAction,
    @required this.rightAction,
    super.backgroundColor = Colors.transparent,
    super.centerTitle = true,
    super.elevation = 0,
    super.systemOverlayStyle = const SystemUiOverlayStyle(statusBarColor: Colors.transparent,statusBarBrightness:Brightness.light,statusBarIconBrightness:Brightness.dark ),
  }):super(title: Text(titleStr!,style: const TextStyle(fontSize: 17,color: Color(0xff191919)),),
      //leading: backAction==null?null:IconButton(onPressed: backAction, icon: const Icon(Icons.arrow_back_ios_new_outlined),color: const Color(0xff191919),),
    leading:backAction==null?null:TextButton(onPressed: backAction, child: Image.asset("assets/img/icons/back.png",height: _kLeadingWidth,width: _kLeadingWidth,)),
    actions: [
      TextButton(onPressed: rightAction, child: Image.asset("assets/img/icons/add.png",height: _kLeadingWidth,width: _kLeadingWidth,))
    ]
  );

  BFAppBar.share({super.key,
    this.titleStr="",
    this.backAction,
    @required this.rightAction,
    super.backgroundColor = Colors.transparent,
    super.centerTitle = true,
    super.elevation = 0,
    super.systemOverlayStyle = const SystemUiOverlayStyle(statusBarColor: Colors.transparent,statusBarBrightness:Brightness.light,statusBarIconBrightness:Brightness.dark ),
  }):super(title: Text(titleStr!,style: const TextStyle(fontSize: 17,color: Color(0xff191919)),),
      //leading: backAction==null?null:IconButton(onPressed: backAction, icon: const Icon(Icons.arrow_back_ios_new_outlined),color: const Color(0xff191919),),
      leading:backAction==null?null:TextButton(onPressed: backAction, child: Image.asset("assets/img/icons/back.png",height: _kLeadingWidth,width: _kLeadingWidth,)),
      actions: [
        TextButton(onPressed: rightAction, child: Image.asset("assets/img/icons/share.png",height: _kLeadingWidth,width: _kLeadingWidth,))
      ]
  );


  BFAppBar.more({super.key,
    this.titleStr="",
    this.backAction,
    required List<Widget>? rightWidgets,
    super.backgroundColor = Colors.transparent,
    super.centerTitle = true,
    super.elevation = 0,
    super.systemOverlayStyle = const SystemUiOverlayStyle(statusBarColor: Colors.transparent,statusBarBrightness:Brightness.light,statusBarIconBrightness:Brightness.dark ),
  }):super(title: Text(titleStr!,style: const TextStyle(fontSize: 17,color: Color(0xff191919)),),
      //leading: backAction==null?null:IconButton(onPressed: backAction, icon: const Icon(Icons.arrow_back_ios_new_outlined),color: const Color(0xff191919),),
      leading:backAction==null?null:TextButton(onPressed: backAction, child: Image.asset("assets/img/icons/back.png",height: _kLeadingWidth,width: _kLeadingWidth,)),
      actions: rightWidgets
  );

}