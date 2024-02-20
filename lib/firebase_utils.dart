import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/model/task.dart';

class FirebaseUtils {
  static CollectionReference<Task> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection(Task.collectionName)
        .withConverter<Task>(
          fromFirestore: ((snapshot, options) =>
              Task.fromFireStore(snapshot.data()!)),
          toFirestore: (task, options) => task.toFireStore(),
        );
  }

  static Future<void> addTaskToFireStore(Task task) {
    DocumentReference<Task> taskCollRef = getTasksCollection().doc();
    task.id = taskCollRef.id;

    /// auto id generated
    return taskCollRef.set(task);

    // var taskCollectionRef = getTasksCollection();     /// add collection
    // DocumentReference<Task> taskCollRef = taskCollectionRef.doc() ;    /// add document
    // task.id = taskCollRef.id ;    /// auto id generated
    // return taskCollRef.set(task) ;
  }

// Future <void> getCollRef = FirebaseFirestore.instance.collection(Task.collectionName).
// withConverter(fromFirestore: ((snapshot, options) => Task.fromFireStore(snapshot.data()!)),
//     toFirestore: (task, options) => task.toFireStore()).doc().set(Task as Task);
}
