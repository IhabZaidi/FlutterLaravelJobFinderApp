// ignore_for_file: unnecessary_this

class JobsModel {
  late int id;
  late String jobTitle;
  late String jobCompany;
  late String jobTime;
  late String jobType;
  late String jobHourlyRate;
  late String jobIsRec;

  JobsModel(
      {required this.id,
      required this.jobTitle,
      required this.jobCompany,
      required this.jobTime,
      required this.jobType,
      required this.jobHourlyRate,
      required this.jobIsRec,});

  JobsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobTitle = json['job_title'];
    jobCompany = json['job_company'];
    jobTime = json['job_time'];
    jobType = json['job_type'];
    jobHourlyRate = json['job_hourly_rate'];
    jobIsRec = json['job_is_rec'];
  }

}