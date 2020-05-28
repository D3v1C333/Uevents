import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:uevents/data/data.dart';
import 'package:uevents/domain/user.dart';
import 'package:uevents/services/database.dart';
/*
Нужно будет сделать ограничение на количество символов в кратком содержании, ибо иначе всё отображение
к хуям ломается (ну, в лучшем случае, кнопка съезжает на пару пикселей)
*/

class EventCard {

  User user;
  DatabaseService db = DatabaseService();
  var showsEvents = List<Data>();
  
  loadData() async{
    var stream = db.getEvents();

    stream.listen((List<Data> data) {
        showsEvents = data;
     });
  }

  static Widget createCard(Data eventData) {
    double w = 386;
    return Column(children: <Widget>[
      Container(
//main container
          margin: EdgeInsets.symmetric(vertical: 20),
          width: w,
          height: 278,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color.fromRGBO(225, 225, 225, 1),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    blurRadius: 10,
                    offset: Offset(0, 4))
              ]),
          child: Column(
            children: <Widget>[
              Container(
                //card_header
                padding: EdgeInsets.fromLTRB(15, 2, 0, 2),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        //location
                        Icon(Icons.location_on,
                            color: Colors.pinkAccent, size: 30),
                        Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              eventData.address,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.normal),
                            )),
                      ],
                    )
                  ],
                ),
                alignment: Alignment.centerLeft,
              ),
              Container(
                  //card body
                  width: w,
                  height: 240,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(240, 240, 240, 1),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          eventData.title,
                          style: TextStyle(fontSize: 20),
                        ),
                        padding: EdgeInsets.fromLTRB(14, 9, 0, 0),
                        alignment: Alignment.centerLeft,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
                        child: Row(children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(22, 0, 45, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.white),
                              height: 110,
                              width: 110,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: Image.network(
                                    eventData.picture,
                                    fit: BoxFit.contain),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                                child: Text(
                              eventData.shortDescription,
                              textAlign: TextAlign.left,
                            )),
                          )
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 14),
                                  child: Icon(Icons.access_time,
                                      color: Colors.black),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 14),
                                  child: Text('14:00 - 16:00'),
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 17),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(55))),
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: BorderSide(color: Colors.red)),
                                color: Colors.pinkAccent,
                                textColor: Colors.white,
                                child: Container(
                                  width: 160,
                                  height: 30,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'ПОДРОБНЕЕ',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            ],
          ))
    ]);
  }
}
