import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [



          Container(
            height: 300,
            child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext,index){
                  return Container(
                    width: 250,
                    height: 250,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: NetworkImage("https://cdn.pixabay.com/photo/2015/10/29/14/38/web-1012467__340.jpg"),
                          fit: BoxFit.cover,

                        )
                    ),
                  );
                }),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: 6,
              physics: ClampingScrollPhysics(),
              itemBuilder: (BuildContext,index){
                return Container(
                  height: 200,
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage("https://cdn.pixabay.com/photo/2015/10/29/14/38/web-1012467__340.jpg",),
                        fit: BoxFit.cover,
                      ),
                  ),
                );
              }),
          GridView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: 6,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
            crossAxisSpacing: 0.8,
              mainAxisSpacing: 0.8,
            ),
            itemBuilder: (BuildContext context, int index) {
             return Container(
                height: 200,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage("https://cdn.pixabay.com/photo/2015/10/29/14/38/web-1012467__340.jpg"),
                      fit: BoxFit.cover,

                    )
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
