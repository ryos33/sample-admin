# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Sequence.create({sequence_name: 'admin_no', sequence_value: 1 })

admin1 = Admin.create({ admin_no: 1, email: 'smp@entra.co.jp', password: '12345678', last_name: '山田', first_name: '太郎', last_kana: 'ヤマダ', first_kana: 'タロウ', nickname: 'たろ'})

