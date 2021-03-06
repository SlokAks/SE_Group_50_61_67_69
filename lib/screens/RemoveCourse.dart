import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RemoveCourse extends StatefulWidget {
  @override
  _RemoveCourseState createState() => _RemoveCourseState();
}

class _RemoveCourseState extends State<RemoveCourse> {
  CollectionReference courseRef=FirebaseFirestore.instance.collection("Courses");
  remCourse(String id){
    setState(() async{
      CollectionReference users = FirebaseFirestore.instance.collection('Courses');
      await users.doc(id).update({
        "isdisabled":true,
      });
    });
  }
  @override
  void initState(){
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('REMOVE COURSE'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Color(0xFFAD70FA),
                    Color(0xFF8857DF)
                  ])),
        ),
      ),
      body:Container(
        color: Colors.grey[200],
        child: StreamBuilder(
            stream: courseRef.snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text("Something went wrong");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              return ListView(
                children: snapshot.data.docs.map(
                      (document) {

                    if(!document["isdisabled"])
                    {
                      return
                        Row(
                          children: [
                            Expanded(child: Container()),
                            Expanded(
                              flex: 4,
                              child: Container(
                                // padding: EdgeInsets.all(20),
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[700],
                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                                        ),
                                        child: Text(document["name"]+'( '+document.id+' )')),
                                    Container(
                                        padding: EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Text(document["description"])),
                                    // Container(
                                    //
                                    //     child: Text(document.id)),
                                    Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          remCourse(document.id);
                                        },
                                        child: Center(child: Text('DISABLE',
                                        style: TextStyle(
                                          color: Colors.blue,
                                        ),
                                        )),

                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(child: Container()),
                          ],
                        );
                    }
                    else{
                      return Container();
                    }
                  },
                ).toList(),
              );
            }),
      ),
    );
  }
}
