import 'dart:convert';

import '/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class CompanyCreateItemForm extends StatefulWidget {
  const CompanyCreateItemForm({Key? key}) : super(key: key);

  @override
  CompanyCreateItemFormState createState() {
    return CompanyCreateItemFormState();
  }
}

class CompanyCreateItemFormState extends State<CompanyCreateItemForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productTypeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  XFile? _image;
  Widget _previewImage = const Icon(
    Icons.image,
    size: 160,
  );

  static const TextStyle titleTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 28.0,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle formFieldTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 18.0,
  );
  static TextStyle formFieldHintTextStyle = TextStyle(
    color: Colors.grey[400],
    fontSize: 18.0,
  );
  static const TextStyle formFieldLabelTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 18.0,
  );

  @override
  void dispose() {
    super.dispose();
    _productNameController.dispose();
    _productTypeController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
  }

  TextFormField _productNameFormField() {
    return TextFormField(
      controller: _productNameController,
      decoration: InputDecoration(
        icon: const Icon(Icons.text_fields, color: Colors.white),
        hintStyle: formFieldHintTextStyle,
        labelStyle: formFieldLabelTextStyle,
        hintText: 'Enter the product name',
        labelText: 'Product Name *',
      ),
      style: formFieldTextStyle,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }

  TextFormField _productTypeFormField() {
    return TextFormField(
      controller: _productTypeController,
      decoration: InputDecoration(
        icon: const Icon(Icons.text_fields, color: Colors.white),
        hintStyle: formFieldHintTextStyle,
        labelStyle: formFieldLabelTextStyle,
        hintText: 'Enter the product type',
        labelText: 'Product Type *',
      ),
      style: formFieldTextStyle,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }

  TextFormField _priceFormField() {
    return TextFormField(
      controller: _priceController,
      decoration: InputDecoration(
        icon: const Icon(Icons.attach_money_outlined, color: Colors.white),
        hintStyle: formFieldHintTextStyle,
        labelStyle: formFieldLabelTextStyle,
        hintText: 'Enter the product price',
        labelText: 'Product Price (\$) *',
      ),
      style: formFieldTextStyle,
      validator: (value) {
        if (value == null || value.isEmpty || double.tryParse(value) == null) {
          return 'Please enter a decimal number';
        }
        return null;
      },
    );
  }

  TextFormField _descriptionFormField() {
    return TextFormField(
      controller: _descriptionController,
      decoration: InputDecoration(
        icon: const Icon(Icons.text_fields, color: Colors.white),
        hintStyle: formFieldHintTextStyle,
        labelStyle: formFieldLabelTextStyle,
        hintText: 'Enter the product description',
        labelText: 'Product Description *',
      ),
      style: formFieldTextStyle,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }

  ElevatedButton _imagePickButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(56),
        primary: Colors.white,
        onPrimary: Colors.black,
        textStyle: formFieldTextStyle,
      ),
      child: Row(
        children: const [
          Icon(Icons.image, size: 28),
          SizedBox(width: 16),
          Text('Pick Gallery *')
        ],
      ),
      onPressed: _pickImage,
    );
  }

  ElevatedButton _submitButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          if (_image == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Please choose an image'),
              ),
            );
            return;
          }

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Processing Data')),
          );
          try {
            _sendRequest();
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(e.toString())),
            );
          }
        }
      },
      child: const Text('Create product'),
    );
  }

  Future _pickImage() async {
    try {
      XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) {
        return;
      }

      MediaQueryData queryData = MediaQuery.of(context);

      _previewImage = Padding(
        padding: EdgeInsets.symmetric(
          horizontal: queryData.size.width * 0.05,
          vertical: queryData.size.height * 0.03,
        ),
        child: Image.memory(
          await image.readAsBytes(),
          width: 140,
          height: 140,
          fit: BoxFit.cover,
        ),
      );

      setState(() {
        _image = image;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  Future _sendRequest() async {
    String companyUsername = "testUsername"; // need get username from session
    String productName = _productNameController.text;
    String productType = _productTypeController.text;
    String description = _descriptionController.text;
    String price = _priceController.text;

    var uri = Uri.parse('http://localhost:8000/api/company/createProduct');

    var request = http.MultipartRequest('POST', uri)
      ..fields['company_username'] = companyUsername
      ..fields['product_name'] = productName
      ..fields['product_type'] = productType
      ..fields['description'] = description
      ..fields['price'] = price
      ..files.add(http.MultipartFile.fromBytes(
          'image_source', await _image!.readAsBytes()));

    var response = await request.send();

    if (response.statusCode == 201) {
      Navigator.pop(context, "Successfully created product: " + productName);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text(jsonDecode(await response.stream.bytesToString())['status']),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              navblue,
              appAccent,
            ],
          ),
        ),
        height: queryData.size.height,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: queryData.size.width * 0.05,
                vertical: queryData.size.height * 0.03,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Create Product',
                    style: titleTextStyle,
                  ),
                  _productNameFormField(),
                  _productTypeFormField(),
                  _descriptionFormField(),
                  _priceFormField(),
                  const SizedBox(height: 20),
                  _imagePickButton(),
                  _previewImage,
                  const SizedBox(height: 20),
                  _submitButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
