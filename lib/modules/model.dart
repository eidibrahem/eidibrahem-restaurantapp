class Post  {
  final  image;
  final String price;
  final  String title ;

  Post({required this.image,required this.title,required this.price,}) ;
  factory Post.formj(Map <String,dynamic>parsedjson ){
    return(
        Post(image:parsedjson["image"],
          title:parsedjson["title"],
          price: parsedjson["price"],

        ));
  }

}