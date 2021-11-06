import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:intro_slider/scrollbar_behavior_enum.dart';
import 'package:translationchat/constants/colors.dart';
import 'package:translationchat/shared/components/textglobal.dart';




class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);



  @override
  IntroScreenState createState() => new IntroScreenState();
}


class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();
for(int i=0;i<3;i++) {
  slides.add(
      Slide(


        pathImage: "assests/Group 911.png",
        description:
        "لن تحتاج الي تعلم لغات جديده لتواصل معهم",
        styleDescription:
         GoogleFonts.cairo(
            color: Colors.black,
            fontWeight:  FontWeight.bold,
            fontSize: 16,
          ),


backgroundColor: Colors.white,

        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight,
        onCenterItemPress: () {},
      ),
    );
}


  }

  void onDonePress() {
    // Do what you want
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => HomeScreen()),
    // );
  }

  Widget renderNextBtn() {
    return  textGlobalWhiteBold14(context: context,text: "تخطي");
  }

  Widget renderDoneBtn() {
    return textGlobalWhiteBold14(context: context,text: "انهاء");
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: white,
    );
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
      backgroundColor: MaterialStateProperty.all<Color>(darkCyan),
      overlayColor: MaterialStateProperty.all<Color>(darkCyan),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  IntroSlider(
      // List slides
      slides: this.slides,




      // Next button
      renderNextBtn: this.renderNextBtn(),
      nextButtonStyle: myButtonStyle(),

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      doneButtonStyle: myButtonStyle(),

      // Dot indicator
      colorDot:greyDark,
      colorActiveDot: darkCyan,
      sizeDot: 13.0,


      // Show or hide status bar
   //   hideStatusBar: true,
      backgroundColorAllSlides: Colors.white,

      // Scrollbar
      verticalScrollbarBehavior: scrollbarBehavior.SHOW_ALWAYS,
    );
  }
}