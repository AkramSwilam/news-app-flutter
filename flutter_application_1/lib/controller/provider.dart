import 'package:flutter/cupertino.dart';

import '../models/CountryModel.dart';
import '../models/categoriesApi.dart';
import '../models/categoriess.dart';

class   HomeProvider extends ChangeNotifier {


  List<Categoriess> categories = [
    Categoriess('Business',"https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80"),
    Categoriess('Entertainment',"https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"),
    Categoriess('Health',"https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80"),
    Categoriess('Science',"https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80"),
    Categoriess('Sports',"https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80"),
    Categoriess('Technology',"https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"),
  ];

  List<Country> country = [
    Country('Argentina',"https://upload.wikimedia.org/wikipedia/commons/e/ed/Flag_of_Argentina_%282-3%29.png?20151028023623","ar"),
    Country('Australia',"https://mpng.subpng.com/20180219/gxq/kisspng-flag-of-australia-flag-of-the-united-kingdom-clip-australia-cliparts-5a8a89b49e4d74.8720594415190286606484.jpg","au"),
    Country('Belgium',"https://upload.wikimedia.org/wikipedia/commons/e/eb/Flag_of_Belgium.png?20080213180804","be"),
    Country('Brazil',"https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Flag_of_Brazil.svg/800px-Flag_of_Brazil.svg.png","br"),
    Country('Canada',"https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Flag_of_Canada.svg/2560px-Flag_of_Canada.svg.png","ca"),
    Country('China',"https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Flag_of_China.png/1024px-Flag_of_China.png","cn"),
    Country('Egypt',"https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Flag_of_Egypt_%28variant%29.png/1200px-Flag_of_Egypt_%28variant%29.png","eg"),
    Country('France',"https://upload.wikimedia.org/wikipedia/commons/6/62/Flag_of_France.png","fr"),
    Country('Germany',"https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Flag_of_Germany.svg/2560px-Flag_of_Germany.svg.png","de"),
    Country('Hungary',"https://upload.wikimedia.org/wikipedia/commons/0/00/Flag_of_Hungary.png","hu"),
    Country('India',"https://upload.wikimedia.org/wikipedia/commons/b/bc/Flag_of_India.png","in"),
    Country('Italy',"https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Flag_of_Italy.svg/1500px-Flag_of_Italy.svg.png","it"),
    Country('Japan',"https://upload.wikimedia.org/wikipedia/commons/a/af/Flag_of_Japan_bordered.png","jp"),
    Country('Mexico',"https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Flag_of_Mexico.png/1280px-Flag_of_Mexico.png","mx"),
    Country('Morocco',"https://upload.wikimedia.org/wikipedia/commons/f/f6/Flag_of_MoroccoFlag_of_Morocco.png","ma"),
    Country('Poland',"https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Flag_of_Poland.svg/2560px-Flag_of_Poland.svg.png","pl"),
    Country('Portugal',"https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Portugal.svg/600px-Flag_of_Portugal.svg.png?20210806190400","pt"),
    Country('Saudi Arabia',"https://upload.wikimedia.org/wikipedia/commons/f/f8/Saudi_arabia_flag_large.png","sa"),
    Country('Turkey',"https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Flag_of_Turkey.svg/800px-Flag_of_Turkey.svg.png","tr"),
    Country('UAE',"https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Flag_of_the_United_Arab_Emirates.svg/2560px-Flag_of_the_United_Arab_Emirates.svg.png","ae"),
    Country('United Kingdom',"https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Flag_of_the_United_Kingdom.png/1200px-Flag_of_the_United_Kingdom.png","gb"),
    Country('United States',"https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/2560px-Flag_of_the_United_States.svg.png","us"),

  ];

  List<CategoriessApi> categoriessApi = [
    CategoriessApi('https://newsapi.org/v2/top-headlines?country=eg&category=business&country=eg&pageSize=50&apiKey=82a9a9b35948450bb47ff9869382a8dd'),
    CategoriessApi('https://newsapi.org/v2/top-headlines?country=eg&category=entertainment&country=eg&pageSize=50&apiKey=82a9a9b35948450bb47ff9869382a8dd'),
    CategoriessApi('https://newsapi.org/v2/top-headlines?country=eg&category=health&country=eg&pageSize=50&apiKey=82a9a9b35948450bb47ff9869382a8dd'),
    CategoriessApi('https://newsapi.org/v2/top-headlines?country=eg&category=science&country=eg&pageSize=50&apiKey=82a9a9b35948450bb47ff9869382a8dd'),
    CategoriessApi('https://newsapi.org/v2/top-headlines?country=eg&category=sports&country=eg&pageSize=50&apiKey=82a9a9b35948450bb47ff9869382a8dd'),
    CategoriessApi('https://newsapi.org/v2/top-headlines?country=eg&category=technology&country=eg&pageSize=50&apiKey=82a9a9b35948450bb47ff9869382a8dd'),
  ];

  String GetApi(String Valu)
  {
    String Ap = "https://newsapi.org/v2/everything?q=$Valu&from=2022-06-26&language=ar&sortBy=popularity&apiKey=82a9a9b35948450bb47ff9869382a8dd";
    return Ap;
  }
}

