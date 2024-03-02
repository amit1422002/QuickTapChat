import 'package:flutter/material.dart';

class Chatpage extends StatefulWidget {
  const Chatpage({super.key});

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF553370),
        body: Container(
          margin: EdgeInsets.only(
            top: 35,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xFFC199Cd),
                    ),
                    SizedBox(
                      width: 90,
                    ),
                    Text(
                      "Aashi Srivastava",
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFFC199Cd),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 40),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.12,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 2),
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 192, 234, 190),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10))),
                    child: Text(
                      "Hello Beba kaisi ho jaanu",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width / 3),
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 176, 210, 229),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: Text(
                      "Reyanshh jaanu mai mst hun",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Spacer(),
                  Material(
                    borderRadius: BorderRadius.circular(20),
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.all( 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        children: [
                          Expanded(
                              child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Type a message",
                                hintStyle: TextStyle(color: Colors.black45)),
                          )),
                          Container(
                             padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Color(0xFFf3f3f3),
                            borderRadius: BorderRadius.circular(20)),
                            child: Center(child: Icon(Icons.send,color: Color.fromARGB(255, 138, 137, 137),)))
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ));
  }
}
