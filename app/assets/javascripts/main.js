var books = new BookCollection();
var formView = new FormView({collection: books});
var router = new Router();

//$(function() {
  // var booksView = new BookListView({collection: books});
  books.fetch().then(function(){
    Backbone.history.start();
  });
//});
