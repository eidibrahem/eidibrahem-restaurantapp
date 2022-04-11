import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'model.dart';
import 'dart:io';
import 'dart:convert' show utf8;

class FishScrean  extends StatefulWidget {
  const FishScrean ({Key? key}) : super(key: key);

  @override
  State<FishScrean> createState() => _ApiState();
}
class _ApiState extends State<FishScrean> {
  Future <List<Post>> getDataItem() async  {
    var httpClient = new HttpClient();
    String url ="https://drive.google.com/uc?export=download&id=1n-mw0pYM7379U7Nuv6lksvIpegxdumMC";
    var jsonData = await httpClient.getUrl(Uri.parse(url)) ;
    var response = await jsonData.close();
    if(response.statusCode == HttpStatus.OK) {
      var json = await response.transform(utf8.decoder).join();
      List jData = jsonDecode(json);
      List<Post> items =[];

      for(var u in jData){
        Post post=Post.formj(u);

        items.add(post);
      }
      return items ;

    }else{
      throw Exception('error');
    }

  }
  late Future<List<Post>> usrs ;
  void initState() {
    usrs=getDataItem();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


        body:FutureBuilder<List<Post>>(
          future:usrs ,
          builder:(context,snapShot) {
            if(snapShot.hasData){
              return ListView.builder(
                itemCount:snapShot.data!.length ,
                itemBuilder:(context,index) {
                  return Container(
                    width: double.infinity,
                    child:Card(
                      elevation: 5,
                      child: Row(
                        children: [
                              Container(
                                width: 130.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0,),
                                  image: DecorationImage(
                                    image: NetworkImage('${snapShot.data![index].image}'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                          ) ,
                          SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            child: Container(
                              height: 100.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children:
                                [
                                  Expanded(
                                    child: Text(
                                      '${snapShot.data![index].title}',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    '${snapShot.data![index].price}',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }return Center(child: CircularProgressIndicator());
          },

        )



    );

  }
}
