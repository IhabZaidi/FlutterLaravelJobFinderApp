// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jobfinder/logic/model/jobs_model.dart';
import 'package:jobfinder/presentation/widget/wsizedb.dart';
import 'package:http/http.dart' as http;
import 'custom_text.dart';
import 'cutom_image.dart';
import 'icon_widget.dart';

class HcardList extends StatelessWidget {
  const HcardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.16,
      width: MediaQuery.of(context).size.width * 0.95,
      child: FutureBuilder(
          future: allJobs(),
          builder:
              (BuildContext context, AsyncSnapshot<List<JobsModel>> snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: MediaQuery.of(context).size.height * 0.15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: const Color.fromARGB(255, 230, 234, 254),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CustomImageWidget(
                                    height: 0.04,
                                    imgpath: index == 0 ?'assets/images/google.png' : 'assets/images/facebook.png',
                                    width: 0.1,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        text: snapshot.data![index].jobTitle,
                                        color: const Color.fromARGB(
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
                                    wval: .007,
                                    hval: 0,
                                  ),
                                  IconWidget(
                                    icon: Icons.favorite_border,
                                    size: 18,
                                    iconColor: Colors.redAccent,
                                  ),
                                ],
                              ),
                              WSizedBox(
                                wval: 0,
                                hval: 0.01,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.13,
                                    height: MediaQuery.of(context).size.height *
                                        0.028,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(2),
                                      ),
                                      color: const Color.fromARGB(
                                          255, 208, 216, 252),
                                    ),
                                    child: Center(
                                      child: TextWidget(
                                        text: snapshot.data![index].jobTime,
                                        color: const Color.fromARGB(
                                            255, 58, 50, 113),
                                        size: 8,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.13,
                                    height: MediaQuery.of(context).size.height *
                                        0.028,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(2),
                                      ),
                                      color: const Color.fromARGB(
                                          255, 208, 216, 252),
                                    ),
                                    child: Center(
                                      child: TextWidget(
                                        text: snapshot.data![index].jobType,
                                        color: const Color.fromARGB(
                                            255, 58, 50, 113),
                                        size: 8,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              WSizedBox(
                                wval: 0,
                                hval: 0.01,
                              ),
                              TextWidget(
                                text: snapshot.data![index].jobHourlyRate,
                                color: Colors.grey,
                                size: 9,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                        WSizedBox(
                          wval: 0.05,
                          hval: 0,
                        ),
                      ],
                    );
                  });
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Text('error');
          }),
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
      if (element.jobIsRec != 'true') {
        finalList.add(element);
      }
    });
    return finalList;
  }
}
