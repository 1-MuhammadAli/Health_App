
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_app/widgets/icon_widget.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'utils/date_utils.dart' as date_util;

class Analytics extends StatefulWidget {
  const Analytics({super.key});

  @override
  State<Analytics> createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {

  double width = 0.0;
  double height = 0.0;
  late ScrollController scrollController;
  List<DateTime> currentMonthList = List.empty();
  DateTime currentDateTime = DateTime.now();

  @override
  void initState() {
    currentMonthList = date_util.DateUtils.daysInMonth(currentDateTime);
    currentMonthList.sort((a, b) => a.day.compareTo(b.day));
    currentMonthList = currentMonthList.toSet().toList();
    scrollController =
        ScrollController(initialScrollOffset: 70.0 * currentDateTime.day);
    super.initState();
  }

  Widget titleView() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Text(
        date_util.DateUtils.months[currentDateTime.month - 1] +
            ' ' +
            currentDateTime.year.toString(),
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }

  Widget hrizontalCapsuleListView() {
    return Container(
      width: width,
      height: 95,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: currentMonthList.length,
        itemBuilder: (BuildContext context, int index) {
          return capsuleView(index);
        },
      ),
    );
  }

  Widget capsuleView(int index) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              currentDateTime = currentMonthList[index];
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: (currentMonthList[index].day != currentDateTime.day)
                    ? const Color(0xffBBF246)
                    : Colors.black,
                    // gradient: LinearGradient(
                    //     colors: (currentMonthList[index].day != currentDateTime.day)
                    //         ? [
                    //       Colors.white.withOpacity(0.8),
                    //       Colors.white.withOpacity(0.7),
                    //       Colors.white.withOpacity(0.6)
                    //     ]
                    //         : [
                    //       HexColor("ED6184"),
                    //       HexColor("EF315B"),
                    //       HexColor("E2042D")
                    //     ],
                    //     begin: const FractionalOffset(0.0, 0.0),
                    //     end: const FractionalOffset(0.0, 1.0),
                    //     stops: const [0.0, 0.5, 1.0],
                    //     tileMode: TileMode.clamp),
                    // boxShadow: const [
                    //   BoxShadow(
                    //     offset: Offset(4, 4),
                    //     blurRadius: 4,
                    //     spreadRadius: 2,
                    //     color: Colors.black12,
                    //   )
                    // ]
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        date_util.DateUtils
                            .weekdays[currentMonthList[index].weekday - 1],
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color:
                            (currentMonthList[index].day != currentDateTime.day)
                                ? Colors.black
                                : Colors.white),
                      ),
                      Text(
                        currentMonthList[index].day.toString(),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color:
                            (currentMonthList[index].day != currentDateTime.day)
                                ? Colors.black
                            //HexColor("465876")
                                : Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              currentMonthList[index].day != currentDateTime.day ?
              Container() : Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.black,
                ),
              ),
            ],
          ),
        )
    );
  }

  Widget topView() {
    return SizedBox(
      width: width,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            titleView(),
            hrizontalCapsuleListView(),
          ]),
    );
  }
  
  Widget caloriesView(){
    return Container(
      width: width*0.4,
      height: height*0.107,
      padding: EdgeInsets.only(top: height*0.01,left: width*0.01, bottom: height*0.01),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          width: 2,
          color: Colors.grey,
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Text("Active calories",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 20.0,
          ),),
          SizedBox(height: height * 0.01,),
          Text("645 Cal",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          ),)
        ],
      ),
    );
  }

  Widget trainingTimeView(){
    return Container(
      width: width*0.4,
      height: height*0.2,
      padding: EdgeInsets.only(top: height*0.01,bottom: height*0.01),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color(0xffEAECFF),
      ),
      child: Column(

        children: [
          Center(
            child: Text("Training Time",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black
            ),),
          ),
          SizedBox(height: 20.0,),
          Center(
            child: SleekCircularSlider(
              onChange: (double value) {
                // callback providing a value while its being changed (with a pan gesture)
              },
              onChangeStart: (double startValue) {
                // callback providing a starting value (when a pan gesture starts)
              },
              onChangeEnd: (double endValue) {
                // ucallback providing an ending value (when a pan gesture ends)
              },
              initialValue: 80,
              max: 100,
              appearance: CircularSliderAppearance(
                counterClockwise: true,
                angleRange: 360,
                startAngle: 270,
                size: height*0.11,
                customColors: CustomSliderColors(
                  progressBarColor: const Color(0xffA48AED),
                  trackColor: Colors.white,
                  hideShadow: true,
                  dotColor: Colors.transparent,
                ),
                customWidths: CustomSliderWidths(
                  progressBarWidth: 10,
                  trackWidth: 10,
                ),
                infoProperties: InfoProperties(
                    bottomLabelText: "%",
                    bottomLabelStyle: const TextStyle(
                        color: Colors.black,
                      fontSize: 20
                    ),
                    mainLabelStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                    modifier: (double value) {
                      final roundedValue =
                      value.ceil().toInt().toString();
                      return '$roundedValue ';
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget cyclingView(){
    return Container(
      width: width*0.5,
      height: height*0.32,
      padding: EdgeInsets.only(top: height*0.01),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.black,
      ),
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(left: width*0.015),
            child: Row(
              children: [
                IconWidget(image: "images/cycling.png", color: const Color(0xffFFFFFF)),
                SizedBox(width: width*0.015,),
                const Text("Cycling",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),)
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(height*0.01),
            child: Container(
              height: height*0.23,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage('images/map.png'),
                      fit: BoxFit.cover
                  )
                ),
            ),
          ),
        ],
      ),
    );
  }

  Widget heartRate(){
    return Container(
      width: width*0.53,
      height: height*0.26,
      padding: EdgeInsets.only(top: height*0.01),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color(0xffFFEBEB),
      ),
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(left: width*0.015),
            child: Row(
              children: [
                IconWidget(image: "images/heart.png", color: const Color(0xffF9B9B9)),
                SizedBox(width: width*0.015,),
                const Text("Hearth Rate",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),)
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(height*0.01),
            child: Container(
              height: height*0.17,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: AssetImage('images/graph.png'),
                      fit: BoxFit.cover
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget sleepView(){
    return Container(
      width: width*0.5,
      height: height*0.2,
      padding: EdgeInsets.only(top: height*0.01),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color(0xffEFE2FF),
      ),
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(left: width*0.015),
            child: Row(
              children: [
                IconWidget(image: "images/sleep.png", color: const Color(0xffD6BBF8)),
                SizedBox(width: width*0.015,),
                const Text("Sleep",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),)
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(height*0.01),
            child: Container(
              height: height*0.10,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: AssetImage('images/sleep_graph.png'),
                      fit: BoxFit.cover
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget waterView(){
    return Container(
      width: width*0.4,
      height: height*0.2,
      padding: EdgeInsets.only(top: height*0.01),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color(0xffD8E6EC),
      ),
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(left: width*0.015),
            child: Row(
              children: [
                IconWidget(image: "images/water1.png", color: const Color(0xffAED1E0)),
                SizedBox(width: width*0.015,),
                const Text("Water",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),)
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(height*0.01),
            child: Container(
              height: height*0.10,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: AssetImage('images/water_graph.png'),
                      fit: BoxFit.cover
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget stepsView(){
    return Container(
      width: width*0.38,
      height: height*0.15,
      padding: EdgeInsets.only(top: height*0.01),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color(0xffFFE8C6),
      ),
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(left: width*0.015),
            child: Row(
              children: [
                IconWidget(image: "images/steps.png", color: const Color(0xffF8D39D)),
                SizedBox(width: width*0.015,),
                const Text("Steps",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),)
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(height*0.01),
            child: Column(
              children: [
                Text("999/2000",
                style: TextStyle(
                  color: Colors.black
                ),),
                Container(
                  width: width*0.3, // Set your desired width
                  // Set your desired height
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), // Set border radius
                    color: Colors.white, // Set background color
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child:  LinearProgressIndicator(
                      value: 0.4,
                      backgroundColor: Color(0xffFFEDD1), // Set background color of the progress bar
                      valueColor: const AlwaysStoppedAnimation<Color>(Color(0xffFCC46F)), // Set color of the progress bar
                    ),
                  ),
                ),
              ],
            )
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return  Scaffold(
        body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    topView(),
                    SizedBox(height: height*0.02,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(bottom: height*0.01),
                              child: caloriesView(),
                            ),
                            trainingTimeView()
                          ],
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: width*0.02),
                          child: cyclingView(),
                        )
                      ],
                    ),
                    SizedBox(height: height*0.01,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        heartRate(),
                        SizedBox(width: width*0.01,),
                        Column(
                          children: [
                            stepsView(),
                            SizedBox(height: height*0.02,),
                            Container(
                              height: height*0.09,
                              width: width*0.38,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  image: AssetImage('images/Banner.png'),
                                    fit: BoxFit.cover
                                )
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: height*0.01,),
                    Row(
                      children: [
                        sleepView(),
                        SizedBox(width: width*0.01,),
                        waterView()
                      ],
                    ),
                  ],
                ),
              ),
            )
        )
    );
  }
}
