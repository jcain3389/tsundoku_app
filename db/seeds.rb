# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Book.create([
  {isbn: '1118531647', title: 'Javascript & JQuery: Interactive Front-End Web Development', img_url: 'http://ecx.images-amazon.com/images/I/41trpeAFOPL._BO2,204,203,200_PIsitb-sticker-arrow-click,TopRight,35,-76_AA300_SH20_OU01_.jpg'},
  {isbn: '1118008189', title: 'HTML & CSS: Design & Build Websites', img_url: 'http://ecx.images-amazon.com/images/I/41K27gRbYmL._BO2,204,203,200_PIsitb-sticker-arrow-click,TopRight,35,-76_AA300_SH20_OU01_.jpg'},
  {isbn: '193398869X', title: 'Secrets of the Javascript Ninja', img_url: 'http://ecx.images-amazon.com/images/I/51UYwOhvQPL._BO2,204,203,200_PIsitb-sticker-arrow-click,TopRight,35,-76_AA300_SH20_OU01_.jpg'}
])
