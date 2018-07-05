
import Foundation
import Firebase

class FirebaseService {
    var reference: CollectionReference
    
    init(database: Firestore){
        self.reference = database.collection("count")
    }
    
    func writeTest() {
        print("Write test is called")
        reference.document("jpanzer").setData(["arbitrary": "value"]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added")
            }
        }
    }
}
