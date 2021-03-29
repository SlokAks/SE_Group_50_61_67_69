import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EnrolledCoursesTile extends StatelessWidget {
  String courseName, courseInstructor, courseDescription;

  EnrolledCoursesTile(
      this.courseName, this.courseInstructor, this.courseDescription);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 20,
      child: Stack(
        children: [
          Container(
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      child: Image.asset(
                        'images/thumbnail/thumbnail.png',
                        fit: BoxFit.fill,
                      ),
                    )),
                Expanded(
                  flex: 1,
                  child: Column(children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            courseName,
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            courseInstructor,
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            courseDescription,
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Expanded(flex: 3, child: Container()),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: Icon(
                        Icons.person,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(flex: 1, child: Container())
            ],
          )
        ],
      ),
      //   Column(children: <Widget>[
      //     Text(courseName),
      //     Text(courseInstructor),
      //     Text(courseDescription),
      //   ]),
    );
  }
}