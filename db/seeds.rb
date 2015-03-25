# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create([{
  name: 'Teilhabe',
  slug: 'teilhabe',
  slogan: 'Teilhabe leben',
  introtext: '',
  color_top: '#ffbf50',
  color_bottom: '#dc8c00',
  sort_order: 1
}, {
  name: 'Heimatschutz',
  slug: 'kultur',
  slogan: 'Kultur schützen',
  introtext: '',
  color_top: '#699be3',
  color_bottom: '#0c4695',
  sort_order: 2
}, {
  name: 'Vielfalt',
  slug: 'vielfalt',
  slogan: 'Vielfalt teilen',
  introtext: '',
  color_top: '#0c4695',
  color_bottom: '#8c0d65',
  sort_order: 3
}, {
  name: 'ÖKO',
  slug: 'oeko',
  slogan: 'Ökologie bewahren',
  introtext: '',
  color_top: '#aadc4e',
  color_bottom: '#61900a',
  sort_order: 4
}])

User.create({
  email: 'info@oneboxmedia.de',
  password: '12345678',
  password_confirmation: '12345678',
})