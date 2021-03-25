import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  final Function(String) parentCallback;
  Search({this.parentCallback});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
          margin: EdgeInsets.only(left: 20, top: 40, right: 20, bottom: 50),
          padding: EdgeInsets.only(left: 20, top: 5, right: 5, bottom: 00),
          height: 50,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(3),
                topRight: Radius.circular(3),
                bottomLeft: Radius.circular(3),
                bottomRight: Radius.circular(3)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: TextField(
                        autofocus: true,
                        controller: cityController,
                        decoration:
                            InputDecoration.collapsed(hintText: "Enter City"),
                        onSubmitted: (String city) {
                          print("New city $city");
                          widget.parentCallback(city);
                          Navigator.pop(context);
                        })),
                IconButton(
                  icon: new Icon(Icons.check),
                  color: Colors.green,
                  onPressed: () {
                    print("New city ${cityController.text}");
                    widget.parentCallback(cityController.text);
                    Navigator.pop(context);
                  },
                )
              ])),
    );
  }
}
