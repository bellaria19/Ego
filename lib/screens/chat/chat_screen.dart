import 'package:ego/utils/constants.dart';
import 'package:ego/widget/chat_field.dart';
import 'package:ego/widget/message_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final GenerativeModel _model;
  late final ScrollController _scrollController;
  late final TextEditingController _textController;
  late final FocusNode _focusNode;
  late ChatSession _chatSession;
  late bool _isLoading;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _textController = TextEditingController();
    _focusNode = FocusNode();
    _isLoading = false;

    // Set up the model
    _model = GenerativeModel(model: geminiModel, apiKey: apiKey);

    // Start a chat session
    _chatSession = _model.startChat();
  }

  void _setLoading(bool isLoading) {
    setState(() {
      _isLoading = isLoading;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: _chatSession.history.length,
                  itemBuilder: (context, index) {
                    Content content = _chatSession.history.toList()[index];
                    final message = _getMessageFromContent(content);

                    return MessageWidget(
                      message: message,
                      isFromUser: content.role == 'user',
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Flexible(
                    flex: 3,
                    child: Form(
                      key: _formKey,
                      child: ChatField(
                        focusNode: _focusNode,
                        controller: _textController,
                        isReadOnly: _isLoading,
                        onFieldsubmitted: (value) {
                          if (value != null && value.isNotEmpty) {
                            _textController.clear();
                            _scrollController.animateTo(
                              0.0,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeOut,
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  formSpacer,
                  if (!_isLoading) ...[
                    ElevatedButton(
                      onPressed: () {
                        _sendChatMessage(_textController.text);
                      },
                      child: const Text('Send'),
                      // icon: const Icon(FontAwesomeIcons.solidPaperPlane),
                    ),
                  ] else ...[
                    const CircularProgressIndicator.adaptive(),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getMessageFromContent(Content content) {
    return content.parts.whereType<TextPart>().map((e) => e.text).join('');
  }

  Future<void> _sendChatMessage(String message) async {
    final isValid = _formKey.currentState?.validate() ?? false;
    print(isValid);
    if (!isValid) {
      return;
    }
    _setLoading(true);

    try {
      final response = await _chatSession.sendMessage(
        Content.text(message),
      );
      final text = response.text;
      if (text == null) {
        _showError('No response ');
        _setLoading(false);
      }
      _setLoading(false);
    } catch (e) {
      _showError(e.toString());
      _setLoading(false);
    } finally {
      _textController.clear();
      _focusNode.requestFocus();
      _setLoading(false);
    }
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: SingleChildScrollView(
            child: Text('An error occurred: $message'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
