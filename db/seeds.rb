# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
##省略
Tag.create([
    { name: '人' },
    { name: '自然' },
    { name: '名所'},
    { name: 'スポーツ'},
    { name: '趣味'},
    { name: 'その他'},
    ])