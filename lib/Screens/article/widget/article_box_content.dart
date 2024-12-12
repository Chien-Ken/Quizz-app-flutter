import 'package:app_trac_nghiem/Provider/question_provider.dart';
import 'package:app_trac_nghiem/Screens/article/widget/article_modal.dart';
import 'package:app_trac_nghiem/Widget/button_custom.dart';
import 'package:app_trac_nghiem/apps/utils/constants.dart';
import 'package:app_trac_nghiem/apps/utils/parse_html.dart';
import 'package:app_trac_nghiem/models/question_model.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlighting/flutter_highlighting.dart';
import 'package:provider/provider.dart';
import 'package:flutter_highlighting/themes/github.dart';
import 'package:highlighting/languages/dart.dart';

class ArticleBoxContent extends StatefulWidget {
  final int idTopic;
  ArticleBoxContent({super.key, required this.idTopic});

  @override
  State<ArticleBoxContent> createState() => _ArticleBoxContentState();
}

class _ArticleBoxContentState extends State<ArticleBoxContent> {
  final PageController pageController = PageController();
  String valueInput = '';
  List<Question>? questions;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchQuestions();
  }

  Future<void> _fetchQuestions() async {
    List<Question> data = await context.read<QuestionProvider>().getQuestionList(widget.idTopic);
    setState(() {
      questions = data;
      isLoading = false;
    });
  }

  void handleSubmit(Question data) async {
    if (valueInput.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter an answer.'),
        ),
      );
      return;
    }
    await showModal(context, valueInput, data);
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    if (questions == null || questions!.isEmpty) {
      return Center(
        child: Text('No Data'),
      );
    }

    return ExpandablePageView.builder(
      onPageChanged: (value) {
        context.read<QuestionProvider>().setCurrentData(value);
      },
      controller: pageController,
      itemCount: questions!.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 40.0,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
          ),
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Text(
                questions![index].title.toString(),
                style: const TextStyle(
                  color: Colors.greenAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: getHeight(context) * 0.02),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                  color: Color(0xff333333),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      10,
                    ),
                  ),
                ),
                width: getWidth(context),
                child: HighlightView(
                  parseHtmlString(questions![index].question),
                  theme: githubTheme,
                  languageId: dart.id,
                  padding: const EdgeInsets.all(12),
                  // Specify text style
                  textStyle: const TextStyle(
                    fontFamily: 'My awesome monospace font',
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: getHeight(context) * 0.02),
              const Text(
                'Đáp án của bạn :',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: getHeight(context) * 0.02),
              TextFormField(
                onChanged: (value) => valueInput = value,
                textInputAction: TextInputAction.done,
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintText: 'Nhập đáp án của bạn tại đây',
                ),
              ),
              SizedBox(height: getHeight(context) * 0.04),
              ButtonCustom(
                onTap: () => handleSubmit(questions![index]),
                title: 'Xem kết quả',
              ),
            ],
          ),
        );
      },
    );
  }
}
