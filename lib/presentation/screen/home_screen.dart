// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, no_logic_in_create_state, unnecessary_this

import 'package:flutter/material.dart';

import 'package:jobfinder/logic/model/jobs_model.dart';
import 'package:jobfinder/logic/repository/get_jobs.dart';
import 'package:jobfinder/presentation/widget/custom_text.dart';
import 'package:jobfinder/presentation/widget/custom_textfield.dart';
import 'package:jobfinder/presentation/widget/cutom_image.dart';
import 'package:jobfinder/presentation/widget/hcard_list.dart';
import 'package:jobfinder/presentation/widget/icon_widget.dart';
import 'package:jobfinder/presentation/widget/vcard_list.dart';
import 'package:jobfinder/presentation/widget/wsizedb.dart';

class HomeScreen extends StatefulWidget {
  List<JobsModel> recommendedJobs = [];
  List<JobsModel> otherJobs = [];
  HomeScreen({
    Key? key,
    required this.recommendedJobs,
    required this.otherJobs,
  }) : super(key: key);

  @override
  _HomeScreenState createState() =>
      _HomeScreenState(this.recommendedJobs, this.otherJobs);
}

class _HomeScreenState extends State<HomeScreen> {
  List<JobsModel> recommendedJobs = [];
  List<JobsModel> otherJobs = [];
  _HomeScreenState(recommendedJobs, otherJobs);
  TextEditingController searchText = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WSizedBox(
            wval: 0,
            hval: 0.025,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.97,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconWidget(
                    icon: Icons.dashboard,
                    size: 20,
                    iconColor: Colors.black,
                  ),
                  IconWidget(
                    icon: Icons.notifications_on,
                    size: 20,
                    iconColor: Colors.red,
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              WSizedBox(
                wval: 0.05,
                hval: 0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: "Let's find your job",
                    color: const Color.fromARGB(255, 58, 50, 113),
                    size: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  WSizedBox(
                    wval: 0,
                    hval: 0.02,
                  ),
                  Row(
                    children: [
                      CustomTextField(
                        bordercolor: const Color.fromARGB(255, 230, 234, 254),
                        borderradius: 10,
                        fontsize: 12,
                        height: 0.06,
                        hintColor: const Color.fromARGB(255, 58, 50, 113),
                        hinttext: 'Search jobs here',
                        icon: Icons.search,
                        iconColor: const Color.fromARGB(255, 58, 50, 113),
                        widh: 0.7,
                        obscureText: false,
                        controller: searchText,
                      ),
                      WSizedBox(
                        wval: .04,
                        hval: 0,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.16,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: Color.fromARGB(255, 230, 234, 254),
                        ),
                        child: IconWidget(
                          icon: Icons.dashboard,
                          size: 20,
                          iconColor: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  WSizedBox(
                    wval: 0,
                    hval: 0.02,
                  ),
                  Row(
                    children: [
                      TextWidget(
                        text: "Featured job",
                        color: const Color.fromARGB(255, 58, 50, 113),
                        size: 17,
                        fontWeight: FontWeight.bold,
                      ),
                      IconWidget(
                        icon: Icons.new_releases,
                        size: 20,
                        iconColor: Colors.red,
                      ),
                      WSizedBox(
                        wval: 0.34,
                        hval: 0,
                      ),
                      TextWidget(
                        text: "Ses all",
                        color: const Color.fromARGB(255, 164, 128, 236),
                        size: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  WSizedBox(
                    wval: 0,
                    hval: 0.02,
                  ),
                  HcardList(),
                  WSizedBox(
                    wval: 0,
                    hval: 0.02,
                  ),
                  TextWidget(
                    text: "Recommended",
                    color: const Color.fromARGB(255, 58, 50, 113),
                    size: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  WSizedBox(
                    wval: 0,
                    hval: 0.02,
                  ),
                 VCardList(),
                 
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
