import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localizacao_com_flutter/src/utils/i18n.dart';

import '../controllers/location_controller.dart';

class HomePage extends StatelessWidget {

  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
        init: LocationController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Get Current Location'.i18n),
            ),
            body: Center(
              child: controller.isLoading.value
                  ? const CircularProgressIndicator()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            controller.currentLocation == null
                                ? 'No Address Found'.i18n
                                : controller.currentLocation!,
                            style: const TextStyle(fontSize: 23),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () async {
                            await controller.getCurrentLocation();
                          },
                          child: Text('Get Current Location'.i18n),
                        ),
                      ],
                    ),
            ),
          );
        });
  }
}