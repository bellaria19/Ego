import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ego/models/emotion.dart';
import 'package:ego/models/quest.dart';
import 'package:ego/models/user_model.dart';

class FirestoreService {
  // get collection
  final CollectionReference collRef =
      FirebaseFirestore.instance.collection('Users');
  final CollectionReference quests =
      FirebaseFirestore.instance.collection('quests');
  final CollectionReference emotions =
      FirebaseFirestore.instance.collection('emotions');

  // CREATE
  Future<void> addUser(UserModel user) {
    return collRef.add(user.toJson());
  }

  Future<void> addQuest(Quest quest) {
    return quests.add(quest.toJson());
  }

  Future<void> addEmotion(Emotion emotion) {
    return emotions.add(emotion.toJson());
  }

  // READ
  Stream<QuerySnapshot> getQuestsStream() {
    final questStream = quests.orderBy('date', descending: true).snapshots();
    return questStream;
  }

  Stream<QuerySnapshot> getEmotionsStream() {
    final emotionStream =
        emotions.orderBy('date', descending: true).snapshots();
    return emotionStream;
  }

  // UPDATE
  Future<void> updateUser(String docId, UserModel user) {
    return collRef.doc(docId).update(user.toJson());
  }

  Future<void> updateQuest(String docId, Quest quest) {
    return quests.doc(docId).update(quest.toJson());
  }

  Future<void> updateEmotion(String docId, Emotion emotion) {
    return emotions.doc(docId).update(emotion.toJson());
  }

  // DELETE
}
