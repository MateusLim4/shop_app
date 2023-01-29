import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shop_app/models/product/product.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({Key? key}) : super(key: key);

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _priceFocus = FocusNode();
  final _descriptionFocus = FocusNode();
  final _imageUrlFocus = FocusNode();
  final _imageURLController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _formData = <String, dynamic>{};

  @override
  void initState() {
    super.initState();
    _imageUrlFocus.addListener(updateImage);
  }

  @override
  void dispose() {
    super.dispose();
    _priceFocus.dispose();
    _descriptionFocus.dispose();
    _imageURLController.removeListener(updateImage);
    _imageUrlFocus.dispose();
  }

  void updateImage() {
    setState(() {});
  }

  void submitForm() {
    _formKey.currentState?.save();
    final newProduct = Product(
        id: Random().nextDouble().toString(),
        title: _formData['name'],
        description: _formData['description'],
        price: _formData['price'],
        imageUrl: _formData['imageUrl']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulário de produto"),
        actions: [
          IconButton(onPressed: submitForm, icon: const Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: "Nome"),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_priceFocus);
                  },
                  onSaved: (name) => _formData["name"] = name ?? "",
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Preço"),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_descriptionFocus);
                  },
                  focusNode: _priceFocus,
                  keyboardType: TextInputType.number,
                  onSaved: (price) => _formData["price"] = double.parse(
                    (price) ?? "0",
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Descrição"),
                  focusNode: _descriptionFocus,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_imageUrlFocus);
                  },
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  onSaved: (description) =>
                      _formData["description"] = description ?? "",
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration:
                            const InputDecoration(labelText: "URL da imagem"),
                        focusNode: _imageUrlFocus,
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                        controller: _imageURLController,
                        onFieldSubmitted: (_) => submitForm(),
                        onSaved: (imageUrl) =>
                            _formData["imageUrl"] = imageUrl ?? "",
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      margin: const EdgeInsets.only(
                        top: 10,
                        left: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      alignment: Alignment.center,
                      child: _imageURLController.text.isEmpty
                          ? const Text(
                              "Informe a URL",
                              textAlign: TextAlign.center,
                            )
                          : FittedBox(
                              fit: BoxFit.cover,
                              child: Image.network(_imageURLController.text),
                            ),
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
