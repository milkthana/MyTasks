//import 'dart:html';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'My Tasks',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CalendarController _controller;
  TextStyle dayStyle(FontWeight fontWeight)
  {
    return TextStyle(color: Color(0xff2E4053), fontWeight: fontWeight);
  }
  Container taskList(String title, IconData iconImg, Color iconColor) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        children: <Widget>[
          Icon(
            //checklist icon
            //CupertinoIcons.checkmark_alt_circle_fill,
            iconImg,
            color: Color(0xffFFC300),
            size: 30,
          ),
          Container(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            width: MediaQuery
                .of(context)
                .size
                .width * 0.8,
            child: Column(
              children: <Widget>[
                //Text("Example Task 1",
                Text(title,
                  style: (
                  //TaskStyle
                    TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white
                    )
                ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }
  @override
  void dispose()
  {
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
          children: <Widget>[
            SizedBox(height: 30,),
            TableCalendar(
              startingDayOfWeek: StartingDayOfWeek.monday,
              calendarStyle: CalendarStyle(
                  weekdayStyle: dayStyle(FontWeight.normal),
                  weekendStyle: dayStyle(FontWeight.normal),
                  selectedColor: Color(0xff73DA55),
                  todayColor: Color(0xff3FC219)
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                //sun sat
                weekendStyle: TextStyle(
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
               // weekendStyle: TextStyle(
               //     color: Color(0xffAAF594),
               //     fontWeight: FontWeight.bold,
               //     fontSize: 16
               // ),
                //  dowTextBuilder: (date, locale){
                //    return DateFormat.E(locale).format(date).substring(0,1);
                //  }
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleTextStyle: TextStyle(
                  color: Color(0xff30384a),
                  fontSize: 20, fontWeight: FontWeight.bold,
                ),
                leftChevronIcon: Icon(
                  Icons.chevron_left,
                  color: Color(0xff3038c),
                ),
                rightChevronIcon: Icon(
                  Icons.chevron_right,
                  color: Color(0xff30384c),
                ),
              ),
              calendarController: _controller,
            ),
            SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.only(left: 30),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.55,
            decoration: BoxDecoration(
              //bottom box
              borderRadius: BorderRadius.only(topLeft: Radius.circular((50)), topRight: Radius.circular(50)),
              color: Color(0xff5D8950),
            ),
            child: Stack(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 50),
                    child: Text("Today", style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    ),
                    taskList("Task 1", CupertinoIcons.checkmark_alt_circle_fill, Colors.green),
                    taskList("Task 2", CupertinoIcons.checkmark_alt_circle, Colors.black45),
                    taskList("Task 3", CupertinoIcons.checkmark_alt_circle, Colors.black45),
                    taskList("Task 4", CupertinoIcons.checkmark_alt_circle, Colors.black45)
                  ],
                ),
                Positioned(
                  bottom: 0,
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                            Color(0xff30384c).withOpacity(0),
                            Color(0xff30384c),
                          ],
                          stops: [
                            0.0,
                            1.0
                          ]
                        ),
                      ),
                    ),
                ),
                Positioned(
                  bottom: 40,
                  right: 20,
                  child: Container(
                    padding: EdgeInsets.all((20)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.deepOrange,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 30
                        )
                      ]
                    ),
                    child: Text("+",style: TextStyle(color: Colors.white,fontSize: 40),)
                  ),
                )
              ],
            ),
          ),
          ],
        ),
      ),
    ),
    );
  }
}
