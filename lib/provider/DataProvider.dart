import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SkillListProvider extends ChangeNotifier {
  List<QueryDocumentSnapshot<dynamic>> _skillList = [];

  List<QueryDocumentSnapshot<dynamic>> get getSkillList => _skillList;

  set setSkillList(List<QueryDocumentSnapshot<dynamic>> skill) {
    _skillList = skill;
    notifyListeners();
  }
}

class ExperinceListProvider extends ChangeNotifier {
  List<QueryDocumentSnapshot<dynamic>> _experienceList = [];

  List<QueryDocumentSnapshot<dynamic>> get getexperienceList => _experienceList;

  set setexperienceList(List<QueryDocumentSnapshot<dynamic>> experience) {
    _experienceList = experience;
    notifyListeners();
  }
}

class ProjectListProvider extends ChangeNotifier {
  List<QueryDocumentSnapshot<dynamic>> _projectList = [];

  List<QueryDocumentSnapshot<dynamic>> get getprojectList => _projectList;

  set setprojectList(List<QueryDocumentSnapshot<dynamic>> project) {
    _projectList = project;
    notifyListeners();
  }
}

class TestimonialListProvider extends ChangeNotifier {
  List<QueryDocumentSnapshot<dynamic>> _testimonial = [];

  List<QueryDocumentSnapshot<dynamic>> get gettestimonial => _testimonial;

  set settestimonial(List<QueryDocumentSnapshot<dynamic>> testimonial) {
    _testimonial = testimonial;
    notifyListeners();
  }
}
