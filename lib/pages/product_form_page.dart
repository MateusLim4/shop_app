import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product/product_list.dart';

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

  bool isValidImageUrl(String url) {
    bool isValidUrl = Uri.tryParse(url)?.hasAbsolutePath ?? false;
    // bool endsWithFile = url.toLowerCase().endsWith(".png") ||
    //     url.toLowerCase().endsWith(".jpg") ||
    //     url.toLowerCase().endsWith(".jpeg");
    // return isValidUrl && endsWithFile;
    return isValidUrl;
  }

  void submitForm() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (isValid) {
      _formKey.currentState?.save();
      Provider.of<ProductList>(context, listen: false)
          .addProductFromData(_formData);
      Navigator.of(context).pop();
    }
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
                validator: (name) {
                  final localName = name ?? "";

                  if (localName.trim().isEmpty) {
                    return "Nome é obrigatório";
                  }

                  if (localName.trim().length < 3) {
                    return "O nome precisa no mínimo de 3 letras";
                  }

                  return null;
                },
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
                validator: (price) {
                  final priceString = price ?? "-1";
                  final localPrice = double.tryParse(priceString) ?? -1;

                  if (localPrice <= 0) {
                    return "Informe um preço válido";
                  }

                  return null;
                },
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
                validator: (description) {
                  final localDescription = description ?? "";

                  if (localDescription.trim().isEmpty) {
                    return "Nome é obrigatório";
                  }

                  if (localDescription.trim().length < 3) {
                    return "O nome precisa no mínimo de 3 letras";
                  }

                  return null;
                },
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
                      validator: (imageUrl) {
                        final imageUrlLocal = imageUrl ?? "";
                        if (!isValidImageUrl(imageUrlLocal)) {
                          return "Informe uma URL válida";
                        }
                        return null;
                      },
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
          ),
        ),
      ),
    );
  }
}
