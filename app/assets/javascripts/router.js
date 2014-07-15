var Router = Backbone.Router.extend({
  routes: {
    'home' : 'listBooks',
    ':id' : 'bookDetail',
    '*default': 'listBooks'
  },

  clearView: function() {
    if (this.view){
      this.view.remove();
      this.view = null;
    }
  },

  listBooks: function() {
    this.clearView();
    this.view = new BookListView({collection: books});
    this.view.$el.appendTo("#books-container");
  },

  bookDetail: function(id) {
    this.clearView();
    var book = books.find(function(book) {
      return book.get('id') === parseInt(id);
    });
    this.view = new BookDetailView({model: book});
    this.view.$el.appendTo("#books-container");
    book.fetch();
  }
});
