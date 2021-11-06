import 'package:flutter/cupertino.dart' show BorderRadius, BoxDecoration, BoxFit, BuildContext, Center, Column, Container, DecorationImage, EdgeInsets, ExactAssetImage, Expanded, Key, MainAxisAlignment, MediaQuery, Radius, Row, SingleChildScrollView, State, StatefulWidget, TextEditingController, Widget;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
import 'package:translationchat/constants/colors.dart';
import 'package:translationchat/constants/images.dart';
import 'package:translationchat/shared/components/buttonglobal.dart';
import 'package:translationchat/shared/components/sizedboxglobal.dart';
import 'package:translationchat/shared/components/textglobal.dart';



class CheckNumberPhone extends StatefulWidget {
  const CheckNumberPhone({Key? key}) : super(key: key);
  @override
  CheckNumberPhoneState createState() => CheckNumberPhoneState ();
}

class CheckNumberPhoneState extends State<CheckNumberPhone> {
  // const _SignUpState({Key? key}) : super(key: key);const MyHomePage({Key? key, required this.title}) : super(key: key);

  late final TextEditingController controller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body:SingleChildScrollView(
            padding: const EdgeInsets.all(0),
            child:   Container(
              height: MediaQuery.of(context).size.height,
              child: Center(
                  child: Column(children: [
                    Container(

                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      decoration: BoxDecoration(
                        color: lightCyan,
                        image: const DecorationImage(image: ExactAssetImage(map2), fit: BoxFit.cover,),
                      ),child: Column(children: [
                      Expanded(child: Container()),
                      textGlobalWhiteBold18(context: context,text: "مرر شاشه هاتفك"),
                      textGlobalWhiteBold14(context: context,text: "ضع كاميرا هاتفك اعلي الكود ثم مرر هاتفك"),
                      Expanded(child: Container()),
                    ],),
                    ),
                    Expanded(child: Container()),
                        SizedBox(
                          height: 200,

                          child: SfBarcodeGenerator(

                            value: 'www.syncfusion.com',
                            symbology: QRCode(),
                            showValue: false,
                          ),
                        ),
                    Expanded(child: Container()),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(mainAxisAlignment: MainAxisAlignment.end,children: [

                            textGlobalBlackBold13(context: context,text: "رقم الهاتف المحمول"),
                            sizedBoxGlobalWidth20(),
                            Icon(Icons.phone_android_sharp,color: darkCyan,),

                          ],),
                        ),
                        buttonGlobal(context: context,text: "مرر")

                    ,Expanded(child: Container()),















                    //GlobalTextField(controller: controller, hint: hint)

                  ],)),
            )));

  }



}