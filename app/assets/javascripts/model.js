var Book = Backbone.Model.extend({
  defaults: {
    isbn: '',
    title: '',
    img_url: '',
    user_id: 0,
    prices: [
      {site: 'chegg', url: '', price: 0},
      {site: 'bookbyte', url: '', price: 0},
      {site: 'textbookmaniac', url: '', price: 0},
      {site: 'cash4books', url: '', price: 0}
    ]
  }
});

var BookCollection = Backbone.Collection.extend({
  url: '/users/'+ $('input[name="user_id"]').val() + '/books',
  model: Book
});
