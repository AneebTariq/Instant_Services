import 'package:flutter/material.dart';

class Viewall extends StatelessWidget {
  const Viewall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//appbar
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('maintanence'),
        actions: const [
          Icon(Icons.all_inbox_outlined),
          SizedBox(
            width: 20,
          ),
        ],
      ),
// screen body
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
          ),
          itemCount: 11,
          itemBuilder: (BuildContext ctx, index) {
            return GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 15,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Center(
                      child: Column(
                        children: const <Widget>[
                          Icon(Icons.person),
                          Text('Aneeb')
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}