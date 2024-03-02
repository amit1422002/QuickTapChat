import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF553370),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 20, top: 50),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "ChatUp",
                      style: TextStyle(
                          fontSize: 22,
                          color: Color(0xFFC199Cd),
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Color(0xFF3a2144),
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(
                          Icons.search,
                          color: Color(0xFFC199Cd),
                        )),
                  ]),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              height: MediaQuery.of(context).size.height / 1.17,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset("images/boy.jpg",
                            width: 70, height: 70, fit: BoxFit.cover),
                      ),
                      SizedBox(
                        width: 20,
                         
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Text(
                            "Amit Singh",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                        
                      Text(
                        "Hello Aashi .Beba kiddhr ho!",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500,color: Colors.black45),
                      ),
                      ],
                      ),
                      Spacer(),
                      Text(
                        "4:30PM",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500,color: Colors.black45),
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                    Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset("images/girl.jpg",
                            width: 70, height: 70, fit: BoxFit.cover),
                      ),
                      SizedBox(
                        width: 20,
                         
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Text(
                            "Aashi Srivastava",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                         
                      Text(
                        "Hello  Amit !",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500,color: Colors.black45),
                      ),
                      ],
                      ),
                      Spacer(),
                      Text(
                        "3:21PM",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500,color: Colors.black45),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}