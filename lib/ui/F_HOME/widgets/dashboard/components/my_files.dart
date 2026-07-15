import 'dart:ui';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:mekmotorclient/ui/F_HOME/view_model/my_files.dart';
import 'package:mekmotorclient/ui/F_HOME/widgets/dashboard/components/file_info_card.dart';
import 'package:mekmotorclient/utils/constants.dart';
import 'package:mekmotorclient/utils/responsive.dart';
import 'package:flutter/material.dart';

class MyFiles extends StatelessWidget {
  const MyFiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flex(
          direction: Axis.horizontal,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My Files",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                ElevatedButton.icon(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultPadding * 1.5,
                      vertical:
                          defaultPadding /
                          (Responsive.isMobile(context) ? 2 : 1),
                    ),
                  ),
                  onPressed: () {},
                  icon: Icon(Icons.add),
                  label: Text("Add New"),
                ),
              ],
            ),
            SizedBox(height: defaultPadding),
            //ileInfoCardGridView(),
          ],
        ),
      ],
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1, // Ensures only one item per column
        mainAxisSpacing:
            10.0, // Spacing between items in the main axis (horizontal)
        crossAxisSpacing:
            0.0, // Spacing between items in the cross axis (vertical - not relevant for 1 item)
        childAspectRatio: 1.0, // Aspect ratio of each item (adjust as needed)
      ),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Wrap(children: [Center(child: Text('Item $index'))]);
      },

      /** 
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: demoMyFiles.length,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 1.0,
        ),
        itemCount: demoMyFiles.length,
        itemBuilder: (context, index) {
          /**
          return Padding(
            padding: const EdgeInsets.all(7.0),
            child: FileInfoCard(info: demoMyFiles[index]),
          );
          */
          return Text("A"); //FileInfoCard(info: demoMyFiles[index]);
        },
      ),
      */
    );

    /** 
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: demoMyFiles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // Número de itens por linha
        mainAxisSpacing: 8.0, // Espaço entre linhas
        crossAxisSpacing: 8.0, // Espaço entre colunas
        //childAspectRatio: 2,
      ),
      itemBuilder: (context, index) => FileInfoCard(info: demoMyFiles[index]),
    );
    */
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}
