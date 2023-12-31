import 'package:finalproject/screens/new%20inbox/new_inbox_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../controllers/tag_controller.dart';
import '../../models/tag_model.dart';
import '../../providers/tag_provider.dart';
import '../widgets/app_bar.dart';

class TagView extends StatelessWidget {
  // final _formKey = GlobalKey<FormState>();

  late TextEditingController addTagController;

  _addTag(BuildContext context, String text) {
    final body = {'name': text};
    addNewTag(context, body).then((checkData) {
      print(checkData);
      if (checkData == true) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Added successfully'),
          backgroundColor: Colors.black,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(12),
        ));
      }
    }).catchError((err) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(err.toString()),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(12),
      ));
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final tagModel = Provider.of<TagStateNotifier>(context);

    addTagController = TextEditingController();
    final tagStateNotifier = context.watch<TagStateNotifier>();
    Future<List<TagElement>> tags = getAllTags(context);

    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: CustomAppBar(
              title: 'Tags',
              doneFunction: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewInboxView(
                          // selectedTags: tagModel.selectedTagsToShow,
                          ),
                    ));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              width: 378,
              // height: MediaQuery.of(context).size.height * 0.13,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FutureBuilder<List<TagElement>>(
                  future: tags, // Fetch tags asynchronously
                  builder: (BuildContext context,
                      AsyncSnapshot<List<TagElement>> snapshot) {
                    // if (snapshot.connectionState == ConnectionState.waiting) {
                    //   return CircularProgressIndicator();
                    // }
                    // if (snapshot.connectionState == ConnectionState.waiting) {
                    //   return CircularProgressIndicator();
                    // }
                    if (snapshot.hasError) {
                      print(snapshot.error);
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Text('No tags available');
                    } else {
                      // final List<TagElement> tagsList = snapshot.data!;

                      return Wrap(
                        //كيف اخلي طول ال container على حسب ما يوسع عدد التاجز؟؟
                        runSpacing: 16,
                        spacing: 16,
                        children: snapshot.data!.asMap().entries.map((entry) {
                          final index = entry.key;
                          final item = entry.value;
                          return InkWell(
                              child: Container(
                                height: 35,
                                width: MediaQuery.of(context).size.width * 0.23,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: index <
                                              tagStateNotifier
                                                  .selectedTags.length &&
                                          tagStateNotifier.selectedTags[index]
                                      ? kinProgressStatus
                                      : kcloseBackground,
                                ),
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    '#${item.name ?? ""}',
                                    // Use null check for 'name'
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: index <
                                                  tagStateNotifier
                                                      .selectedTags.length &&
                                              tagStateNotifier
                                                  .selectedTags[index]
                                          ? Colors.white
                                          : ktagColor,
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                tagStateNotifier.toggleTag(index);
                                for (int i = 0;
                                    i < snapshot.data!.length;
                                    i++) {
                                  if (tagStateNotifier.selectedTags[i]) {
                                    if (!tagStateNotifier.selectedTagsToShow
                                        .contains(snapshot.data![i])) {
                                      tagStateNotifier.selectedTagsToShow
                                          .add(snapshot.data![i]);

                                      print(tagStateNotifier.selectedTagsToShow
                                          .toString());
                                    }
                                  } else {
                                    if (tagStateNotifier.selectedTagsToShow
                                        .contains(snapshot.data![i])) {
                                      tagStateNotifier.selectedTagsToShow
                                          .remove(snapshot.data![i]);
                                    }
                                  }
                                }
                              });
                        }).toList(),
                      );
                    }
                  },
                ),
              ),
            ),
          ),
          FutureBuilder<List<TagElement>>(
            future: tags,
            builder: (context, snapshot) {
              if (!snapshot.hasData || snapshot.data == null) {
                return SizedBox.shrink();
              }
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  width: 378,
                  height: 44,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: TextField(
                      controller: addTagController,
                      onSubmitted: (text) {
                        _addTag(context, text);
                        final tagStateNotifier =
                            context.read<TagStateNotifier>();
                        tagStateNotifier.toggleTag(snapshot.data!.length - 1);
                      },
                      // Use a function reference
                      decoration: InputDecoration(
                        hintText: 'Add New Tag ...',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: tagStateNotifier.selectedTags.length >
                                      snapshot.data!.length &&
                                  tagStateNotifier
                                      .selectedTags[snapshot.data!.length]
                              ? Colors.white
                              : ksecondaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
