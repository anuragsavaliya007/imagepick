import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({Key? key}) : super(key: key);

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  final ImagePicker _picker = ImagePicker();
  String imagepath = "";
  String videopath = "";
  List<XFile>? images1;
  bool status = false;
  bool vstatus = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Image Picker")),
      body: ListView(
        children: [


            status
                ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 500,
                width: 500,
                child: GridView.builder(
                  itemCount: images1!.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: Image.file(
                          File(images1![index].path),
                          fit: BoxFit.cover,
                        ));
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                ),
              ),
            )
                : Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Container(
                  child: imagepath.isEmpty
                      ? Image.asset("Images/images.png")
                      : Image.file(File(imagepath)),
                ),
              ),
            ),


          Center(
            child: OutlinedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return SimpleDialog(
                        title: Text("Select Picture"),
                        children: [
                          ListTile(
                            leading: Icon(Icons.camera_alt),
                            title: Text("Camera"),
                            onTap: () async {
                              status = false;
                              final XFile? photo = await _picker.pickImage(
                                  source: ImageSource.camera);
                              Navigator.pop(context);
                              if (photo != null) {
                                imagepath = photo.path;
                                setState(() {});
                              }
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.add_photo_alternate_outlined,
                            ),
                            title: Text("Gallery"),
                            onTap: () async {
                              status = false;
                              final XFile? image = await _picker.pickImage(
                                  source: ImageSource.gallery);
                              Navigator.pop(context);
                              if (image != null) {
                                imagepath = image.path;
                                setState(() {});
                              }
                            },
                          ),
                          ListTile(
                            title: Text("Multipal Image"),
                            leading: Icon(
                              Icons.collections_outlined,
                            ),
                            onTap: () async {
                              final List<XFile>? images =
                                  await _picker.pickMultiImage();

                              Navigator.pop(context);
                              if (images != null) {
                                images1 = images;

                                status = true;
                                setState(() {});
                              }
                            },
                          ),
                          ListTile(
                            title: Text("Video"),
                            leading: Icon(
                              Icons.video_library_outlined,
                            ),
                            onTap: () async {
                              final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
                              if(video != null){
                                videopath = video.path;
                                vstatus = true;
                                setState(() {});
                              }
                            },
                          )
                        ],
                      );
                    },
                  );
                },
                child: Text("Choose File")),
          ),
        ],
      ),
    );
  }
}
