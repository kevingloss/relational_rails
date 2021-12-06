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
@book_8 = @author_4.books.create!(name: 'Peace Talks', rating: 4.2, read: false)
@book_9 = @author.books.create!(name: 'The Dragon Reborn', rating: 4.7, read: true)


@pediatrician = Pediatrician.create!(name: 'Bob Barker', office: '123 Fake Street', years_practicing: 15, accepting_patients: true)
@pediatrician_2 = Pediatrician.create!(name: 'Roberto Guauguau', office: '123 Seaseme Street', years_practicing: 10, accepting_patients: false)
@pediatrician_3 = Pediatrician.create!(name: 'Jeff Lebowksi', office: 'Lucky Strike Bowling Alley', years_practicing: 13, accepting_patients: false)

@baby = @pediatrician.patients.create!(name: 'Elora Mielke', age_in_months: 2, full_term_birth: true)
@baby_2 = @pediatrician.patients.create!(name: 'Ezra Bridger', age_in_months: 8, full_term_birth: false)
@baby_3 = @pediatrician_2.patients.create!(name: 'Kanan Jarrus', age_in_months: 11, full_term_birth: false)
@baby_4 = @pediatrician_2.patients.create!(name: 'Anakin Skywalker', age_in_months: 7, full_term_birth: true)
@baby_5 = @pediatrician_3.patients.create!(name: 'Obi-Wan Kenobi', age_in_months: 13, full_term_birth: true)
@baby_6 = @pediatrician_3.patients.create!(name: 'Ahsoka Tano', age_in_months: 3, full_term_birth: false)
