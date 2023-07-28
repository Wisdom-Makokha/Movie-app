import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mile_2/Models/movie.dart';

class MovieScreen extends StatefulWidget{
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState()=> MovieScreenState();
}

class MovieScreenState extends State<MovieScreen>{
  final List<Movie> movieList = [];

  final TextEditingController titleController = TextEditingController();
  final TextEditingController directorController = TextEditingController();
  final TextEditingController releaseYearController = TextEditingController();
  final TextEditingController posterController = TextEditingController();

  Widget myTextField(BuildContext context, TextEditingController fieldController,
      String hintText, String labelText){
    return Container(
      margin: const EdgeInsets.only(bottom: 3.0),
      height: 65.0,
      child: TextField(
        controller: fieldController,
        decoration: InputDecoration(
            hintText: hintText,
            labelText: labelText,
            border: const UnderlineInputBorder()
        ),
      ),
    );
  }

  void showMovieDetails(BuildContext context, Movie movie) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(movie.title),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.network(
                  movie.poster,
                  height: 250,
                  width: 200,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Director: ${movie.director}"),
                const SizedBox(
                  height: 10,
                ),
                Text("Release year: ${movie.releaseYear}"),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Close',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ))
            ],
          );
        });
  }

  void addMovieToList(){
    if(titleController.text.isEmpty){
      Fluttertoast.showToast(msg: 'Title field empty');
    } else if(directorController.text.isEmpty){
      Fluttertoast.showToast(msg: 'Director field is empty');
    } else if(releaseYearController.text.isEmpty){
      Fluttertoast.showToast(msg: 'Release Year field empty');
    } else if(posterController.text.isEmpty){
      Fluttertoast.showToast(msg: 'Poster field empty');
    }else{
      final newMovie = Movie(
          director: directorController.text,
          title: titleController.text,
          releaseYear: int.parse(releaseYearController.text),
          poster: posterController.text
      );

      setState((){
        movieList.add(newMovie);
      });

    }
  }

  void addMovieDialog(BuildContext context){
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: const Text('Add a movie'),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              myTextField(context, titleController,
                  'Enter movie title', 'Title'),
              myTextField(context, directorController,
                  'Enter movie\'s director name', 'Director\'s name'),
              myTextField(context, releaseYearController,
                  'Enter the movie\'s release year', 'Release year'),
              myTextField(context, posterController,
                  'Enter the URL for the poster', 'Poster URL'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: addMovieToList,
              child: const Text('Add'),
            )
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xFFD1C4E9),
            blurRadius: 5,
            blurStyle: BlurStyle.inner,
            offset: Offset(2, 4),
          )
        ],
        gradient: LinearGradient(
          colors: [Colors.black, Colors.deepPurple],
          begin: Alignment.topCenter,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent.withOpacity(0),
        appBar: AppBar(
          title: const Text('My favorite movies'),
          shadowColor: Colors.deepPurple,
        ),
        //Gridview.builder is the is what i used to make the grid
        body: GridView.builder(
          //The grid delegate is where you specify the separation between the various items in your grid
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              //cross axis spacing is the amount of space between items vertically
              crossAxisSpacing: 9.0,
              //ratio of width to height of children
              childAspectRatio: 0.5,
              //main axis spacing is the amount of space between items horizontally
              mainAxisSpacing: 9.0,
              //my understanding of this one is that it determines the number of columns
              //so i set this one to make one column take half the screen
              maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.5),
          itemBuilder: (BuildContext context, index) {
            //extra variable to make life easier
            final movie = movieList[index];

            //the modifier is unnecessary, but if you use the index to make it
            //change for each item in the list, the tiles have different colors
            //that loop on the third tile
            int modifier = 100 * (index % 3);
            //the container makes the area that surrounds each tile
            //without it there is only an image and some text
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              padding: const EdgeInsets.all(6),
              //decoration for the container
              decoration: BoxDecoration(
                  //the color i used here is RGB Opacity. To reduce the opacity of the
                  //container and take the background color slightly
                  color: Color.fromRGBO(220, 238 * modifier, 227, 0.3),
                  borderRadius: BorderRadius.circular(10)),
              //The list tile is inflexible and does not allow you to change the
              //size of the image
              //I used a grid tile instead
              //the grid tile takes 3 properties each taking a widget
              //header
              //footer
              //child
              child: GridTile(
                header: Text(
                  movie.title,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
                //The grid tile can not notice when someone taps on it
                // so we use the gesture detector to notice instead
                //the gesture detector wraps the image so that when you tap
                //on the image, a dialog box appears
                child: GestureDetector(
                  onTap: () {
                    showMovieDetails(context, movie);
                  },
                  child: Image.network(
                    movie.poster,
                    height: 200,
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                  ),
                ),
              ),
            );
          },
          itemCount: movieList.length,
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
            addMovieDialog(context);
          },
          label: const Text('Add new movie'),
          icon: const Icon(Icons.add_card),
        )
      ),
    );
  }
}
