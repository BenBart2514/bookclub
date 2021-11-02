# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Author.destroy_all

jkr = Author.create(first_name: 'JK', last_name: 'Rowling')
clarke = Author.create(first_name: 'Arthur C.', last_name: 'Clarke')

Book.create(title: 'Harry Potter', author: jkr, publisher: 'Penguin', genre: 'Fantasy')
Book.create(title: 'Fantastic Beasts and Where to Find Them', author: jkr, genre: 'Fantasy')
Book.create(title: '2001: A Space Oddyssey', author: clarke, genre: 'Sci-Fi')
Book.create(title: 'A Fall of Moondust', author: clarke, genre: 'Sci-Fi')
