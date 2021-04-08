import 'package:device_info/extension/context_extension.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final IconData iconData;
  final String type;
  final String content;

  const InfoCard({Key key, this.iconData, this.type, this.content})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          child: Container(
              width: context.width * 0.98,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ]),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            iconData,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            type,
                            style: context.textTheme.button
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        content,
                        maxLines: 1,
                        style: context.textTheme.subtitle2,
                      ),
                    ),
                  ),
                ],
              ))),
    );
  }
}
