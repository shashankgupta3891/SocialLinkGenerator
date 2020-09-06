import 'package:flutter/material.dart';
import 'package:whatsappshare/constant.dart';

import '../validation.dart';

class MultiEmailCard extends StatefulWidget {
  final List<String> carbonCopyList;
  final String title;

  MultiEmailCard({
    this.carbonCopyList,
    this.title,
  });

  @override
  _MultiEmailCardState createState() => _MultiEmailCardState();
}

class _MultiEmailCardState extends State<MultiEmailCard> {
  final _ccAnimatedList = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      elevation: 7,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 15),
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
            AnimatedList(
              physics: NeverScrollableScrollPhysics(),
              key: _ccAnimatedList,
              shrinkWrap: true,
              itemBuilder: (context, index, animation) {
                return _buildWidget(animation, index);
              },
              initialItemCount: widget.carbonCopyList.length,
            ),
            Row(
              children: [
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      Text(
                        'Add',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  onPressed: () {
                    _ccAnimatedList.currentState
                        .insertItem(widget.carbonCopyList.length);
                    widget.carbonCopyList.add('');
                    setState(() {});
                  },
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                      Text(
                        'Remove',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  onPressed: widget.carbonCopyList.isNotEmpty
                      ? () {
                          var removed = widget.carbonCopyList
                              .removeAt(widget.carbonCopyList.length - 1);

                          _ccAnimatedList.currentState.removeItem(
                              widget.carbonCopyList.length,
                              (context, animation) => _buildWidget(
                                  animation, widget.carbonCopyList.length));

                          print(widget.carbonCopyList);

                          print(removed);
                          setState(() {});
                        }
                      : null,
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
          ],
        ),
      ),
    );
  }

  ScaleTransition _buildWidget(Animation<double> animation, int index) {
    return ScaleTransition(
      scale: animation,
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: TextFormField(
          validator: (value) {
            if (value.isEmpty) return 'Please Fill';
            if (!isEmailId(value)) return 'Email is not valid';
            return null;
          },
          decoration: kGreyInputDecoration.copyWith(hintText: 'Enter Email Id'),
          keyboardType: TextInputType.emailAddress,
          onChanged: (pageNameInput) {
            widget.carbonCopyList[index] = pageNameInput;
            // print(widget.carbonCopyList);
          },
        ),
      ),
    );
  }
}
