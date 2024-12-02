import 'package:aviralportfolio/provider/DataProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  fetchSkillData(BuildContext context) async {
    if (Provider.of<SkillListProvider>(context, listen: false)
        .getSkillList
        .isEmpty) {
      List<QueryDocumentSnapshot<dynamic>> skillData = [];
      QuerySnapshot<Map<String, dynamic>> skills =
          await _firestore.collection('Technologies').get();
      skillData = skills.docs;
      Provider.of<SkillListProvider>(context, listen: false).setSkillList =
          skillData;
    }
  }

  fetchExperinceData(BuildContext context) async {
    if (Provider.of<ExperinceListProvider>(context, listen: false)
        .getexperienceList
        .isEmpty) {
      List<QueryDocumentSnapshot<dynamic>> experienceData = [];
      QuerySnapshot<Map<String, dynamic>> experience = await _firestore
          .collection('experience')
          .orderBy("rank", descending: true)
          .get();
      experienceData = experience.docs;

      Provider.of<ExperinceListProvider>(context, listen: false)
          .setexperienceList = experienceData;
    }
  }

  fetchProjectData(BuildContext context) async {
    if (Provider.of<ProjectListProvider>(context, listen: false)
        .getprojectList
        .isEmpty) {
      List<QueryDocumentSnapshot<dynamic>> projectData = [];
      QuerySnapshot<Map<String, dynamic>> project = await _firestore
          .collection('project')
          .orderBy("rank", descending: false)
          .get();
      projectData = project.docs;

      Provider.of<ProjectListProvider>(context, listen: false).setprojectList =
          projectData;
    }
  }

  fetchTestimonialData(BuildContext context) async {
    if (Provider.of<TestimonialListProvider>(context, listen: false)
        .gettestimonial
        .isEmpty) {
      List<QueryDocumentSnapshot<dynamic>> testimonialData = [];
      QuerySnapshot<Map<String, dynamic>> testimonial = await _firestore
          .collection('testimonial')
          .orderBy("rank", descending: false)
          .get();
      testimonialData = testimonial.docs;
      print(testimonialData);
      Provider.of<TestimonialListProvider>(context, listen: false)
          .settestimonial = testimonialData;
    }
  }
}
