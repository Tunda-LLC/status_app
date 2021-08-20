import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();
final dbRef = FirebaseDatabase.instance.reference();
DateTime now = DateTime.now();

void onRead() {
  dbRef.once().then((DataSnapshot snapshot) {
    print('Data : ${snapshot.value}');
  });
}

onSent() {
  dbRef
      .child("flutterDevsTeam7")
      .set({'name': 'Navy', 'description': 'Associate Software Engineer'});
}

void updateData() {
  dbRef.child('flutterDevsTeam1').update({'description': 'CEO'});
  dbRef.child('flutterDevsTeam2').update({'description': 'Team Lead'});
  dbRef
      .child('flutterDevsTeam3')
      .update({'description': 'Senior Software Engineer'});
}

void deleteData() {
  final databaseReference = FirebaseDatabase.instance.reference();
  databaseReference.child('flutterDevsTeam1').remove();
  databaseReference.child('flutterDevsTeam2').remove();
  databaseReference.child('flutterDevsTeam3').remove();
}

projectCreate(
    {required String title,
    required String phone,
    required String views,
    required String price,
    required String caption,
    required String url}) {
  User user = FirebaseAuth.instance.currentUser!;
  // PROJECT ID
  var id = uuid.v4();
  dbRef.child("projects").child(id).set({
    'title': title,
    'caption': caption,
    'media': url,
    'client_id': user.uid,
    'is_done': false,
    'paid_verified': false,
    'views': views,
    'phone': phone,
    'price': price,
    'created_at': now,
    'updated_at': now
  });
}

/// CREATE
/// ALL TABLES

// created on acceptance by admin
influencaSignUp(
    {required String audience, required String phone, bool validity = false}) {
  User user = FirebaseAuth.instance.currentUser!;
  dbRef.child("influencas").child(user.uid).set({
    'audience': audience,
    'valid': validity,
    'phone': phone,
    'created_at': now,
    'updated_at': now
  });
}

// get id from app and verify
influencaVerify({required String influencaIdProjectId, required String url}) {
  dbRef
      .child("screenshots")
      .child(influencaIdProjectId)
      .set({'media': url, 'created_at': now, 'updated_at': now});
}

// called when an influenca sets up a project
// save the id in the app
influencaProject({
  required String projectId,
  required String influencaId,
  required String audienceAdded,
}) {
  var id = uuid.v4();
  dbRef.child("influenca_project").child(id).set({
    'audience_added': audienceAdded,
    'project_id': projectId,
    'influenca_id': influencaId,
    'created_at': now,
    'updated_at': now
  });
}

// called when project created
startedProject(
    {required String projectId,
    required String viewsNeeded,
    required String viewsCovered}) {
  dbRef.child("started_projects").child(projectId).set({
    'views_needed': viewsNeeded,
    'influencas_used': '1',
    'views_covered': viewsCovered,
    'created_at': now,
    'updated_at': now
  });
}


// get project to client
// get featured to client - done
// get project screenshots to clients
// one function to upload a project
// function to verify payment by admin
// function to receive unverified payments admin 
