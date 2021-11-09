// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobfinder/logic/model/jobs_model.dart';
import 'package:jobfinder/presentation/widget/cutom_image.dart';
import 'package:jobfinder/presentation/widget/icon_widget.dart';
import 'package:jobfinder/presentation/widget/wsizedb.dart';
import 'package:http/http.dart' as http;
import 'custom_text.dart';

class VCardList extends StatelessWidget {
  const VCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width * 0.9,
      child: FutureBuilder(
        future: allJobs(),
        builder:
            (BuildContext context, AsyncSnapshot<List<JobsModel>> snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return index == 0
                      ? Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.13,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                                color: const Color.fromARGB(255, 69, 71, 192),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        CustomImageWidget(
                                          height: 0.04,
                                          imgpath: 'assets/images/google.png',
                                          width: 0.1,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextWidget(
                                              text: snapshot.data![index].jobTitle,
                                              color: Colors.white,
                                              size: 10,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            TextWidget(
                                              text: snapshot.data![index].jobCompany,
                                              color: Colors.grey,
                                              size: 10,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ],
                                        ),
                                        WSizedBox(
                                          wval: .32,
                                          hval: 0,
                                        ),
                                        IconWidget(
                                          icon: Icons.favorite_border,
                                          size: 18,
                                          iconColor: Colors.white,
                                        ),
                                      ],
                                    ),
                                    WSizedBox(
                                      wval: 0,
                                      hval: 0.01,
                                    ),
                                    Row(
                                      children: [
                                        WSizedBox(
                                          wval: 0.02,
                                          hval: 0,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.13,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.028,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.white),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(2),
                                            ),
                                          ),
                                          child: Center(
                                            child: TextWidget(
                                              text: snapshot.data![index].jobTime,
                                              color: Colors.white,
                                              size: 8,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        WSizedBox(
                                          wval: 0.04,
                                          hval: 0,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.13,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.028,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.white),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(2),
                                            ),
                                          ),
                                          child: Center(
                                            child: TextWidget(
                                              text: snapshot.data![index].jobType,
                                              color: Colors.white,
                                              size: 8,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        WSizedBox(
                                          wval: 0.31,
                                          hval: 0,
                                        ),
                                        TextWidget(
                                          text: snapshot.data![index].jobHourlyRate,
                                          color: Colors.white,
                                          size: 9,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            WSizedBox(
                              wval: 0,
                              hval: 0.02,
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.13,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                                color: const Color.fromARGB(255, 239, 239, 252),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        CustomImageWidget(
                                          height: 0.04,
                                          imgpath: 'assets/images/logo.png',
                                          width: 0.1,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextWidget(
                                              text: snapshot.data![index].jobTitle,
                                              color: Color.fromARGB(
                                                  255, 58, 50, 113),
                                              size: 10,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            TextWidget(
                                              text: snapshot.data![index].jobCompany,
                                              color: Colors.grey,
                                              size: 10,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ],
                                        ),
                                        WSizedBox(
                                          wval: .32,
                                          hval: 0,
                                        ),
                                        IconWidget(
                                          icon: Icons.favorite_border,
                                          size: 18,
                                          iconColor:
                                              Color.fromARGB(255, 58, 50, 113),
                                        ),
                                      ],
                                    ),
                                    WSizedBox(
                                      wval: 0,
                                      hval: 0.01,
                                    ),
                                    Row(
                                      children: [
                                        WSizedBox(
                                          wval: 0.02,
                                          hval: 0,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.13,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.028,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(2),
                                            ),
                                          ),
                                          child: Center(
                                            child: TextWidget(
                                              text: snapshot.data![index].jobTime,
                                              color: Color.fromARGB(
                                                  255, 58, 50, 113),
                                              size: 8,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        WSizedBox(
                                          wval: 0.04,
                                          hval: 0,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.13,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.028,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(2),
                                            ),
                                          ),
                                          child: Center(
                                            child: TextWidget(
                                              text:  snapshot.data![index].jobType,
                                              color: Color.fromARGB(
                                                  255, 58, 50, 113),
                                              size: 8,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        WSizedBox(
                                          wval: 0.31,
                                          hval: 0,
                                        ),
                                        TextWidget(
                                          text: snapshot.data![index].jobHourlyRate,
                                          color:
                                              Color.fromARGB(255, 58, 50, 113),
                                          size: 9,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            WSizedBox(
                              wval: 0,
                              hval: 0.02,
                            ),
                          ],
                        );
                });
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Text('error!!!!');
          }
        },
      ),
    );
  }

  Future<List<JobsModel>> allJobs() async {
    var response = await http.get(Uri.parse('http://192.168.1.3:80/api/jobs'));
    Iterable l = json.decode(response.body);
    List<JobsModel> posts =
        List<JobsModel>.from(l.map((model) => JobsModel.fromJson(model)))
            .toList();
    List<JobsModel> finalList = [];
    posts.forEach((element) {
      if (element.jobIsRec == 'true') {
        finalList.add(element);
      }
    });
    return finalList;
  }
}
