import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:students_mitra_flutter/providers/SubjectConfig.dart';
import 'package:students_mitra_flutter/providers/UnitSubjectData.dart';

class SubContainer extends StatelessWidget {
  final UnitSubjectData subData;
  SubContainer({this.subData});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SubjectConfig(),
      child: myWidget(),
    );
  }

  Widget myWidget() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<SubjectConfig>(
          builder: (context, config, __) {
            return FlatButton(
              onPressed: () {
                config.toogleSelection();
              },
              color:
                  config.isSelected ? Colors.green : Colors.red.withAlpha(35),
              splashColor: Colors.lightGreenAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              padding: EdgeInsets.all(0),
              child: GridTile(
                child: Container(
                  decoration: BoxDecoration(
                    // color: widget.colour,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15.0),
                    ),
                  ),
                  margin: EdgeInsets.all(0.0),
                  padding: EdgeInsets.all(0.0),
                  // color: Colors.white,
                  // alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FractionalTranslation(
                              translation: Offset(-0.1, -0.1),
                              child: IconButton(
                                splashColor: Colors.grey,
                                icon:
                                    // widget.active_subject.contains(widget.album1[2])
                                    //     ? Icon(
                                    //         Icons.star,
                                    //         size: 20.0,
                                    //         color: Colors.red,
                                    //       )
                                    //     :
                                    Icon(
                                  Icons.star_border,
                                  size: 20.0,
                                  color: config.isSelected
                                      ? Colors.white
                                      : Colors.black,
                                  // color: widget.colour == Colors.white
                                  //     ? Colors.black
                                  //     : Colors.white,
                                ),
                                onPressed: () {
                                  // setState(() {
                                  //   if (widget.active_subject.contains(widget.album1[2])) {
                                  //     widget.active_subject.remove(widget.album1[2]);
                                  //   } else {
                                  //     widget.active_subject.add(widget.album1[2]);
                                  //   }
                                  //   print(widget.active_subject);
                                  //   FirebaseFirestore.instance
                                  //       .collection("usersData")
                                  //       .doc("$user")
                                  //       .update({"activeSubject": widget.active_subject});
                                  // });
                                },
                              )),
                          FractionalTranslation(
                            translation: Offset(0, -0.7),
                            child: Container(
                              height: 20.0,
                              width: 35.0,
                              child: Center(
                                child: Text(
                                  'New',
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.white),
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        subData.shortName,
                        style: TextStyle(
                          fontSize: 25.0,
                          color:
                              config.isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          subData.fullName,
                          maxLines: 2,
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15.0,
                            color:
                                config.isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}