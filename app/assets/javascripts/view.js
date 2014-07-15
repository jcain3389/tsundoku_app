var BookView = Backbone.View.extend({
  tagName: 'li',
  className: 'book',
  template: _.template($('#book-html').html()),

  initialize: function() {
    this.listenTo(this.model, 'change', this.render);
    this.listenTo(this.model, 'destroy', this.remove);
    this.render()
  },

  events: {
    'click span' : 'onRemove'
  },

  onRemove: function() {
    this.model.destroy();
  },

  render: function() {
    var rendered = this.template({book: this.model});
    this.$el.html(rendered);
  }

});

var BookListView = Backbone.View.extend({
  tagName: 'ul',

  initialize: function() {
    this.listenTo(this.collection, 'add remove', this.render);
    this.render();
  },

  render: function() {
    this.$el.empty();
    this.collection.each(function(book) {
      var view = new BookView({model: book});
      this.$el.append(view.el);
    }, this);
  }
});

var FormView = Backbone.View.extend({
  el: '#quote',

  events: {
    'submit' : 'createBook'
  },

  createBook: function(evt) {
    evt.preventDefault();
    var isbn_num = this.$('[name="isbn"]').val();
    this.el.reset();

    this.collection.create({
      isbn: isbn_num
    });
  }
});

var BookDetailView = Backbone.View.extend({
  tagName: 'div',
  template: _.template($('#book-detail').html()),
  initialize: function(){
    this.listenTo(this.model, 'change sync', this.render);
    this.render();
  },

  render: function() {
    var html = this.template(this.model.toJSON());
    return this.$el.html(html);
  }
});
