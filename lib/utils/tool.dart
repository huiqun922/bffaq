part of global;

/// Prints a string representation of the object to the console.
void bfLog(Object? object) {
  print(object);
}

const Color bgColor = Color(0xFFF6F7F8);

const Color bgLightGrayColor = Color(0xFFF6F6F6);
const Color bgGrayColor = Color(0xFFEFEFEF);
const Color bgDarkColor = Color(0xFF3D3E41);
const Color bgAlarmColor = Color(0xFFE05454);

const Color textWhiteColor = Color(0xFFFFFFFF);
const Color textGrayColor = Color(0xFF666666);
const Color textDarkColor = Color(0xFF191919);

int safeInt(var obj){
  if(obj==null){
    return 0;
  }
  if(obj is num){
    return obj.toInt();
  }
  if(obj is String){
    try {
      return int.parse(obj);
    }catch(e){
      return 0;
    }
  }
  return 0;
}


