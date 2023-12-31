import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../providers/mail_filter_provider.dart';

class CategoriewContainer extends StatelessWidget {
  const CategoriewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusDirectional.circular(30)),
        child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Provider.of<MailFilterProvider>(context, listen: false)
                      .toggleCategory(index);
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Provider.of<MailFilterProvider>(context)
                            .categories[index]
                            .title,
                        style: TextStyle(color: ktitleBlack, fontSize: 16),
                      ),
                      Provider.of<MailFilterProvider>(context)
                              .categories[index]
                              .isSelected
                          ? SvgPicture.asset(
                              'assets/icons/selected.svg',
                              width: 20,
                              height: 20,
                            )
                          : const SizedBox()
                    ]),
              );
            },
            separatorBuilder: (context, index) => Divider(
                  color: kdividerColor,
                ),
            itemCount:
                Provider.of<MailFilterProvider>(context).categories.length));
  }
}
