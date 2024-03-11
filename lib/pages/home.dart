import 'dart:typed_data';

import 'package:QuickTapChat/pages/chatpage.dart';
import 'package:QuickTapChat/services/database.dart';
import 'package:QuickTapChat/services/shared_pref.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool search = false;
String ?myName, myProfilePic,myUserName,myEmail;


getthesharedpref()async{
   myName= await SharedPreferHelper().getuserDisplayName();
   myProfilePic=await SharedPreferHelper().getuserPic();
   myUserName=await SharedPreferHelper().getuserName();
   myEmail=await SharedPreferHelper().getuserEmail();
   setState(() {
     
   });

}

ontheload()async{
await getthesharedpref();
setState(() {
  
});


}


@override
void initState(){
  super.initState();
  ontheload();

}

  getChatRoomIdbyUsername(String a,String b ){
    if(a.substring(0,1).codeUnitAt(0)>b.substring(0,1).codeUnitAt(0)){
      return "$b\_$a";
    }else{
      return "$a\_$b";
    }
  }

  var queryResultSet = [];
  var tempSearchStore = [];

  initiateSearch(value) {
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }
    setState(() {
      search = true;
    });
    var capitalizedValue =
        value.substring(0, 1).toUpperCase() + value.substring(1);
    if (queryResultSet.isEmpty && value.length == 1) {
      DatabaseMethods().Search(value).then((QuerySnapshot docs) {
        for (int i = 0; i < docs.docs.length; i++) {
          queryResultSet.add(docs.docs[i].data());
        }
      });
    } else {
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if (element['username'].startsWith(capitalizedValue)) {
          setState(() {
            tempSearchStore.add(element);
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF553370),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, bottom: 20, top: 50),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      search
                          ? Expanded(
                              child: TextField(
                              onChanged: (value) {
                                initiateSearch(value.toUpperCase());
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Search User',
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ))
                          : Text(
                              "ChatUp",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Color(0xFFC199Cd),
                                  fontWeight: FontWeight.bold),
                            ),
                      GestureDetector(
                        onTap: () {
                          search = true;
                          setState(() {});
                        },
                        child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Color(0xFF3a2144),
                                borderRadius: BorderRadius.circular(20)),
                            child: search ?GestureDetector(
                              onTap: (){
                                search=false;
                                setState(() {
                                  
                                });
                              },
                              child: Icon(
                                Icons.close,
                                color: Color(0xFFC199Cd),
                              ),
                            ):Icon(
                              Icons.search,
                              color: Color(0xFFC199Cd),
                            )),
                      ),
                    ]),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                height: search
                    ? MediaQuery.of(context).size.height / 1.19
                    : MediaQuery.of(context).size.height / 1.17,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: Column(
                  children: [
                    search
                        ? ListView(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            primary: false,
                            shrinkWrap: true,
                            children: tempSearchStore.map((element) {
                              return buildResultCard(element);
                            }).toList(),
                          )
                        : Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                 
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(60),
                                      child: Image.asset("images/boy.jpg",
                                          width: 70,
                                          height: 70,
                                          fit: BoxFit.cover),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Amit Singh",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          "Hello ",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black45),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Text(
                                      "4:30PM",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black45),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
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
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Bot",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        "Hello  Amit !",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black45),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Text(
                                    "3:21PM",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black45),
                                  ),
                                ],
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildResultCard(data) {
    return GestureDetector(
      onTap: ()async{
        search=false;
        setState(() {
          
        });

        var ChatRoomId=getChatRoomIdbyUsername(myUserName!,data["username"]);

        Map<String,dynamic>chatRoomInfoMap={
           "users":[myUserName,data["username"]],

           

        };
          await DatabaseMethods().createChatRoom(ChatRoomId, chatRoomInfoMap);
           Navigator.push(context, MaterialPageRoute(builder: (context)=>Chatpage(name: data["Name"], profileurl: data["Photo"], username: data["username"])));
             },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.network(data["Photo"],height: 70,width: 70,fit: BoxFit.cover,)),
                  SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data["Name"],
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      data["username"],
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
