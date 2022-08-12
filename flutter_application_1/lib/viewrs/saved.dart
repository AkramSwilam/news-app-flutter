import 'package:contest/models/news_database.dart';
import 'package:contest/viewrs/article.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// class SavedNews extends StatefulWidget {
//   const SavedNews({ Key? key }) : super(key: key);

//   @override
//   State<SavedNews> createState() => _SavedNewsState();
// }

// class _SavedNewsState extends State<SavedNews> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       import 'package:flutter/material.dart';





class SavedNews extends StatefulWidget {
  const SavedNews({ Key? key }) : super(key: key);

  @override
  State<SavedNews> createState() => _SavedNewsState();
}

class _SavedNewsState extends State<SavedNews> {
  SqlBb? db;
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
    db=SqlBb(uid: signedUser.uid);
  }
  final auth=FirebaseAuth.instance;
  late User signedUser;
  void getCurrentUser(){
   try {
      User? user =auth.currentUser;
    if(user!=null){
      signedUser=user;
    }
   } catch (e) {
     
   }
  }
  
  
  

  Future <List<Map>> readNotes()async{
    List<Map> response = await db!.readData("SELECT * FROM news");
     return response;
    }
  deleteNotes()async{
    await db!.deleteData("DELETE * FROM news ");
  }
  updateNotes()async{
    db!.updateData("UPDATE 'news' SET 'body' = 'study hard' WHERE id = 4 ");
  }
 
 

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes Taker"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
           Navigator.pushNamed(context, "addNote");
        },
        child: const Icon(Icons.add),
        ), 
     body: FutureBuilder(future: readNotes(),
     builder: (context, AsyncSnapshot<List<Map>> snapshot){
      if (snapshot.hasData) {
        return ListView.builder(
          itemCount: snapshot.data!.length, 
          itemBuilder: (BuildContext context, int index) { 
           
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ArticleView(imageUrl: snapshot.data![index]["imageUrl"], desc: snapshot.data![index]["desc"], title: snapshot.data![index]["title"], url: snapshot.data![index]["url"])
            );
           },
          );
      }else{
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Center(child: Text("No Data added yet")),
          ],
        );
      }
     },
     )
           
    );
  }
}
                    

//     );
//   }
// }