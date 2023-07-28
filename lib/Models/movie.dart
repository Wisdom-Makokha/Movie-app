class Movie{
  final String director;
  final String title;
  int releaseYear;
  final String poster;

  Movie({
    required this.director,
    required this.title,
    required this.releaseYear,
    required this.poster
});
}

List<Movie> myMovies =[
  Movie(
      director: "Christopher Nolan",
      releaseYear: 2023,
      title: "Oppenheimer",
      poster:
      "https://movies.universalpictures.com/media/opr-tsr1sheet3-look2-rgb-3-1-1-64545c0d15f1e-1.jpg"),
  Movie(
      director: "Zack Snyder",
      releaseYear: 2013,
      title: "Man of Steel",
      poster:
      "http://2.bp.blogspot.com/-V4wozefHUw4/UYQSw_Nhc4I/AAAAAAAAAL8/eY5-aDts1eI/s1600/man-of-steel-+new+flying+poster.jpg"),
  Movie(
      director: 'Quentin Tarantino',
      title: 'Kill BIll Vol.1',
      releaseYear: 2003,
      poster:
      "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcT2n6mrijVjYMAFEQ1DUaKCp0P02YwVyzAO9Hf1ypNEPvsJk835"),
  Movie(
      director: "David Fincher",
      releaseYear: 1999,
      title: "fight club",
      poster:
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSw3__ptLTHyk_K5QoGfL7OCzXU05LncsZM1A&usqp=CAU"),
  Movie(
      director: "Josh Boone",
      releaseYear: 2014,
      title: "The Fault in Our Stars",
      poster:
      "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcR6N8kOvrQrjIEBjIFjcP4qXTSSETEoR1J2CeFl5gtlcufQ9PKP"),
  Movie(
      director: "Tim Johnson",
      releaseYear: 2015,
      title: "Home",
      poster:
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgBvtLbdotFhbnsspMrqg9spxq8Y_a9y1bIaXpgqBYLRTHtTvl"),
  Movie(
      director: "Guy Ritchie",
      releaseYear: 2023,
      title: "Operation Fortune",
      poster: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTnSuXyUtRNvTVgRqecf6adYdrkGHmFxe-_84RXazjtCvTLd1UI"),
  Movie(
      director: "David Leitch",
      releaseYear: 2018,
      title: "Deadpool 2",
      poster:
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEaMyt21dd-I0jmKj9YO98a6F02iDp30uuitOjyVoIIp342NI0"),
  Movie(
      director: "Sam Hargrave",
      releaseYear: 2020,
      title: "Extraction",
      poster:
      "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRELEr5bWH1Z9ZlYjofDbRoW0ToFJop6YlcJuVU8lAYt2peph_n"),
  Movie(
      director: "Rob Cohen",
      releaseYear: 2018,
      title: "hurricane heist",
      poster:
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJDPMwFDj7aoEnNvlWSphJIKz2aOLsg_tX_96DBGV2iXTdDhOF"),
];