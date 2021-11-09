import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:jobfinder/logic/model/jobs_model.dart';

// u can use this repos to fetch data or use future builder 
// as i did now


class JobsRepositery {
  List<JobsModel> posts = [];
  List<JobsModel> isrecJobs = [];
  List<JobsModel> otherJobs = [];
  Future allJobs() async {
    try {
      var response =
          await http.get(Uri.parse('http://192.168.1.3:80/api/jobs'));
      Iterable l = json.decode(response.body);
      posts = List<JobsModel>.from(l.map((model) => JobsModel.fromJson(model))).toList();
      posts.forEach((element) {
        print(element);
        if (element.jobIsRec == 'true') {
          isrecJobs.add(element);
        } else {
          otherJobs.add(element);
        }
      } );
      print(posts[0].jobCompany);
      log(isrecJobs.length.toString());
      log(otherJobs.length.toString());
    } on Exception catch (error) {
      log(error.toString());
    }
  }
}
