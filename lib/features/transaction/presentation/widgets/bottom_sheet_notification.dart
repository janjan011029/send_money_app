import 'package:flutter/material.dart';

import '../../../../../router/route_utils.dart';

class Notify {
  Future<void> showBottomSheet(
    BuildContext context,
    bool isSuccess,
    String errMessage,
  ) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                isSuccess
                    ? const Column(
                        children: [
                          Text('Money Successfully Sent.'),
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          )
                        ],
                      )
                    : Column(
                        children: [
                          Text(errMessage),
                          const Icon(
                            Icons.close_rounded,
                            color: Colors.red,
                          )
                        ],
                      ),
                const SizedBox(height: 10),
                ElevatedButton(
                  child: const Text('Okay'),
                  onPressed: () {
                    Navigator.popUntil(
                      context,
                      ModalRoute.withName(AppPage.home.path),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> notifyInsufficientAmount(
    BuildContext context,
  ) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Column(
                  children: [
                    Text('Insufficient amount.'),
                    Icon(
                      Icons.close_rounded,
                      color: Colors.red,
                    )
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  child: const Text('Okay'),
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> showLoading(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            height: 200,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
