# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

operator_list = [
  [ "Maxis", "local" ],
  [ "Celcom", "local" ],
  [ "uMobile", "local" ],
  [ "XoX", "local" ],
  [ "Digi", "local" ],
  [ "Tune", "local" ],
  [ "INDOMARI", "international" ]
]

operator_list.each do |operator_name, local_international|
  Operator.create(
    operator_name: operator_name, local_international: local_international
  )
end

maxis_amount = 
[ 5,10,20,30,50,60,100]

maxis_amount.each do |amount|
  Operator.find_by(operator_name: "Maxis")
          .operator_stores.create(amount: maxis_amount)
end

digi_amount = 
[
  5, 10, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75,
  80, 85, 90, 95, 100, 150, 200, 250, 300
]

digi_amount.each do |amount|
  Operator.find_by(operator_name: "Digi")
          .operator_stores.create(amount: digi_amount)
end

celcom_amount =
[  5, 6, 7, 8, 9, 10, 15, 20, 25, 30, 35, 40, 45,
   50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100,
   150, 200
]

celcom_amount.each do |amount|
  Operator.find_by(operator_name: "Celcom")
          .operator_stores.create(amount: celcom_amount)
end

celcom_amount.each do |amount|
  Operator.find_by(operator_name: "uMobile")
          .operator_stores.create(amount: celcom_amount)
end

tune_amount = 
[ 5, 10, 15, 20, 30, 50, 55, 60, 70, 100, 120, 200, 300, 400, 500 ]

tune_amount.each do |amount|
  Operator.find_by(operator_name: "Tune")
          .operator_stores.create(amount: tune_amount)
end

xox_amount =
[3,4,5,6,7,8,9,10,15,20,25,30,40,50,60,70,80,90,100]

xox_amount.each do |amount|
  Operator.find_by(operator_name: "XoX")
          .operator_stores.create(amount: xox_amount)
end
