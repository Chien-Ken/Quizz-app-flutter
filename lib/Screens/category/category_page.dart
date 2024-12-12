import 'package:app_trac_nghiem/Provider/category_provider.dart';
import 'package:app_trac_nghiem/Widget/background_custom.dart';
import 'package:app_trac_nghiem/apps/routes/router_name.dart';
import 'package:app_trac_nghiem/apps/utils/constants.dart';
import 'package:app_trac_nghiem/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';


class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    super.initState();
    // Hide the status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  @override
  void dispose() {
    super.dispose();
    // Re-show the status bar when the widget is disposed of
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Category Page'),
            toolbarHeight: 70,
        ),
        body: Stack(
          children: [
            const BackgroundCustom(),
            SafeArea(
              child: FutureBuilder(
                future: context.read<CategoryProvider>().getListTopic(),
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData) {
                    List<Category> data = snapshot.data as List<Category>;
                    return GridView.builder(
                      padding: EdgeInsets.symmetric(
                          horizontal: paddingCustom(context)),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 2 / 1,
                      ),
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            context.goNamed(RoutersName.articleName, extra: {
                              'id': data[index].id,
                              "name": data[index].name
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.primaries[index],
                            ),
                            child: Align(
                              child: Text(data[index].name),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Container(
                      child: const Center(
                        child: Text('No Data'),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
