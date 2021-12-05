# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@author = Author.create!(name: 'Robert Jordan', alive: false, age: 58)
@author_2 = Author.create!(name: 'Brandon Sanderson', alive: true, age: 45)
@author_3 = Author.create!(name: 'Brent Weeks', alive: true, age: 44)
@author_4 = Author.create!(name: 'Jim Butcher', alive: true, age: 50)

@book = @author.books.create!(name: 'The Eye of The World', rating: 4.5, read: true)
@book_2 = @author.books.create!(name: 'The Great Hunt', rating: 4.3, read: true)
@book_3 = @author_2.books.create!(name: 'The Way of Kings', rating: 4.2, read: true)
@book_4 = @author_3.books.create!(name: 'Black Prism', rating: 3.5, read: true)
@book_5 = @author_3.books.create!(name: 'Night Angel', rating: 3.8, read: true)
@book_6 = @author.books.create!(name: 'Dawnshard', rating: 4.7, read: false)
@book_7 = @author_4.books.create!(name: 'Battle Ground', rating: 4.1, read: false)
@book_8 = @author_4.books.create!(name: 'Peach Talks', rating: 4.2, read: false)
