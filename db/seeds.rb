# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

agencies = Agency.create(
  [
    { name: 'Acme',         description: 'Good Agency',    grade: 'padawan', tag_list: 'placement, recruiting' },
    { name: 'Good People',  description: 'Top One',        grade: 'jedi',    tag_list: 'placement, recruiting, contracting' },
    { name: 'Rock Results', description: 'We get it done', grade: 'master',  tag_list: 'contracting, hiring' }
  ]
)
