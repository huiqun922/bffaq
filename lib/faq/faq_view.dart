import 'package:bfweb/utils/global.dart';
import 'package:bfweb/utils/size_fit.dart';
import 'package:bfweb/utils/text_utils.dart';
import 'package:bfweb/utils/ui/app_bar.dart';
import 'package:bfweb/utils/ui/card.dart';
import 'package:bfweb/utils/ui/listview_cell.dart';
import 'package:flutter/material.dart';

import 'flutter_faq.dart';

class FAQView extends StatelessWidget {
  const FAQView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<String>? products = ['BF-5/BF-6', 'BF-20', 'BF-30/BF-40'];

    return Scaffold(
      // appBar: BFAppBar.back(titleStr: "FAQ",backAction: (){
      //   Navigator.pop(context);
      // },),
      body: CardView(
        padding: EdgeInsets.symmetric(horizontal: 8.scale),
        child: ListView.builder(
            itemCount: products!.length,
            itemBuilder: (ctx, index) {
              return ListViewCell(
                title: products[index],
                click: () {
                  //Route route = MaterialPageRoute(builder: (ctx)=>FAQViewDetail(type: index,));
                  Navigator.pushNamed(context, '/faq/detail', arguments: index);
                },
              );
            }),
      ),
    );
  }
}

class FAQViewDetail extends StatelessWidget {
  FAQViewDetail({super.key});
  int type = 0;
  List faqs = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    type = (ModalRoute.of(context)!.settings.arguments as int);
    bfLog("FAQViewDetail ${ModalRoute.of(context)!.settings.arguments}  $type");

    setupFAQ();
    return Scaffold(
      // appBar: BFAppBar.back(titleStr: "FAQ",backAction: (){
      //   Navigator.pop(context);
      // },),
      body: CardView(
        padding: EdgeInsets.symmetric(horizontal: 8.scale),
        child: ListView.builder(
            itemCount: faqs!.length,
            itemBuilder: (ctx, index) {
              return FAQ(
                question: faqs[index].q,
                answer: faqs[index].a,
                ansPadding:
                    EdgeInsets.symmetric(vertical: 10.scale, horizontal: 20),
                queStyle: TextUtils.mediumDartText(fontSize: 16),
                ansStyle: TextUtils.regularGrayText(fontSize: 14),
                queDecoration: const BoxDecoration(color: textWhiteColor),
                ansDecoration: const BoxDecoration(color: bgLightGrayColor),
              );
            }),
      ),
    );
  }

  /*
  BF-20:
Q:What is the PIN code? Why can’t connect to the APP?
A:You can't connect devices on your phone's system via PIN. App download and use requires acceptance of location terms. Connection method is to open the device first, then open the "Grill 5.0" App on the phone, search through the search page, click "hcitool scan", and search for "Grill BT5.0" in a few seconds, click to enter use.
Q:Why not wireless?
A:Wireless refers to the Bluetooth connection between the device and the phone, not the connection between the probe and the device. This has the advantage of not having to stare at the temperature display of the device all the time
Q:Why always disconnect the Bluetooth connection?
A:The product uses Bluetooth Low Energy (BLE) technology with Bluetooth 5.0 module (TI‘s CC2640). In an open and unobstructed environment, it can reach a distance of 70 meters; but it does not penetrate the wall well. The characteristic of this Bluetooth technology is that as long as the device is connected, no matter the signal strength, it can be used normally.
Q: LLL on the display
A: Temperature exceeds range: 33℉~572℉（1℃~300℃）or the probe is damaged
Q: Why does the display keep flashing after setting the temperature range?
A: Only when the current temperature is between the temperature range, the display can return to normal. If it is lower or higher than the temperature range, the device and mobile phone will alarm with the flashing display.
Q: Why no data is displayed after power on?
A: If the probe is not plugged into the socket after powering on, the device will not display temperature and auto power off after 3 minutes.

   */
  void setupFAQ() {
    if (type == 0 || type == 1) {
      faqs = [
        FAQModel(
            'Q: Why our App need to ask for your location (GPS)? It is safe?',
            'A:Because our app use Bluetooth function, and this is abided by the Framework Agreement of Android and iOS. Any Bluetooth app must request location permission. Our application won\'t ask and use your WLAN/Celluar, so turn on the location just because the Android and iOS\'s rule. We are unable see and receive your location.'),
        FAQModel('Q:What is the PIN code? Why can’t connect to the APP?',
            'A:You can\'t connect devices on your phone\'s system via PIN. App download and use requires acceptance of location terms. Connection method is to open the device first, then open the "Grill 5.0" App on the phone, search through the search page, click "hcitool scan", and search for "Grill BT5.0" in a few seconds, click to enter use.'),
        FAQModel('Q:Why not wireless?',
            'A:Wireless refers to the Bluetooth connection between the device and the phone, not the connection between the probe and the device. This has the advantage of not having to stare at the temperature display of the device all the time.'),
        FAQModel('Q:Why always disconnect the Bluetooth connection?',
            'A:The product uses Bluetooth Low Energy (BLE) technology with Bluetooth 5.0 module (TI‘s CC2640). In an open and unobstructed environment, it can reach a distance of 70 meters; but it does not penetrate the wall well. The characteristic of this Bluetooth technology is that as long as the device is connected, no matter the signal strength, it can be used normally.'),
        FAQModel('Q:LLL on the display',
            'A: Temperature exceeds range: 33℉~572℉（1℃~300℃）or the probe is damaged'),
        FAQModel(
            'Q: Why does the display keep flashing after setting the temperature range?',
            'A: Only when the current temperature is between the temperature range, the display can return to normal. If it is lower or higher than the temperature range, the device and mobile phone will alarm with the flashing display.'),
        FAQModel('Q:Why no data is displayed after power on?',
            'A: If the probe is not plugged into the socket after powering on, the device will not display temperature and auto power off after 3 minutes.'),
      ];
    }
    if (type == 1) {
      faqs.add(
        FAQModel('Q:How to charge?',
            'A:\n1.Can charge devices, including computers and mobile power, through ordinary chargers.\n2.Cannot use fast charger with excessive output power.'),
      );
    }
    if (type == 2) {
      faqs = [
        FAQModel(
            'Q: Why our App need to ask for your location (GPS)? It is safe?',
            'A:Because our app use Bluetooth function, and this is abided by the Framework Agreement of Android and iOS. Any Bluetooth app must request location permission. Our application won\'t ask and use your WLAN/Cellular, so turn on the location just because the Android and iOS\'s rule. We are unable see and receive your location.'),
        FAQModel(
            'Q: When the BF-30/40 and the smart device are paired successfully, can I close the APP during cooking/grilling?',
            'A:Do not close the APP, simply minimize it ensure the alarm will alert you when the temperature reaches the target temperature'),
        FAQModel(
            'Q: If the BFour thermometer have already been paired with smart device, do I need to re-pair them when I use the them again?',
            'A:No, if you\'ve paired, it will automatically connect when you open the APP and remove the probe from the booster.'),
        FAQModel(
            'Q: If I go out of range, how do I reconnect my smart device to the thermometer?',
            'A:The signal will reconnect automatically with your smart device once your smart device is back within range.'),
        FAQModel('Q: Can I use the thermometer in the microwave ?',
            'A:No , you can\'t use your thermometer in the microwave.'),
        FAQModel('Q: How should I disarm the booster\'s alarm sound?',
            'A:\n(1) When the booster reaches the target temperature, the booster will sound an alarm, and the alarm can be stopped by pressing the power button.\n(2) When the booster and the probe are disconnected,the booster will sound an alarm and the alarm can be stopped by pressing the power button twice.\n(3) When the booster temperature is out of temperature range to avoid probe damage, the booster will keep sounding the alarm until the temperature is in the normal range (32℉-212℉ /0℃-100℃).'),
        FAQModel(
            'Q: What should I do if no data is displayed after powering on?',
            'A: If the temperature is not displayed upon powering on, it may be due to the probe not being plugged into the socket properly. In such cases, you can reinsert the probe into the socket and remove it again to ensure proper display of the temperature.'),
        FAQModel('Q:Why can\'t it charge?',
            'A: Please check if the charging spring of the probe slot is loose, if it is loose, please contact us!'),
        FAQModel('Q:What should I do if I get a white screen?',
            'A: Please long press the power button to try to restart, if it still can\'t be solved, please contact us!'),
        FAQModel('Q:How much remote range should i expect?',
            'A: \n1.Connect in an outdoor open area with a wireless range of up to 200 ft (60 m) from the booster to the phone and up to 32 ft (10 ms) from the probe to the booster.\n2. The actual Bluetooth range also relates to the cell phone you are using and the cell phone\'s Bluetooth version.\n(Actual wireless range may vary on a case-by-case basis).'),
        FAQModel('Q:How to place the probes correctly on your BF-40?',
            'A: Black probes on the left, white probes on the right'),
        FAQModel('Q：How can I pair my smart devices withthe booster ?',
            'A：\n1 ) Enable Bluetooth on your smart device under the Settings section.\n2 ) Turn on GPS on your Android smart device.\n3 ) Remove the probe from the booster.\n4 ) Launch the BF Home APP in your smart device and press Add Device , A list of BF-40/30 devices will appear and select BF-40/30 from the list.then select the "Grill BT The APP will jump to the device list page which shows the real time temperature measured by the probe. Now your BF-40/30 is ready for use . You don\'t need to pair them again for future uses.'),
        FAQModel(
            'Q: Why does the supercharger sound an alarm and how do I disarm it?',
            'A:\n(1) When the probe reaches the target temperature, the booster will sound an alarm and can be disarmed by pressing the power button.\n(2) When the booster is disconnected from the probe, the booster will sound an alarm, press the power button twice to disarm the alarm.\n(3) When the probe is out of temperature range, the booster will sound an alarm until the temperature drops.'),
        FAQModel('Q:How is a cooking temperature graph created and stored?',
            'A:After you select the meat type and doneness and press Start "Start Cooking" button, the APP will record the internal temperature of the meat and create a temperature graph that you can save at any time.When an alarm is issued when the set temperature is reached, the temperature graph will be automatically saved to the history alarm record.')
      ];
    }
  }
}

class FAQModel {
  String q;
  String a;
  FAQModel(this.q, this.a);
}
