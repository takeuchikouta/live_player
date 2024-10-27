# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admins = [
  {email: 'admin1@example.com', password: 'passw@rd'}
]

admins.each do |admin|
  Admin.find_or_create_by(email: admin[:email]) do |o|
    o.password = admin[:password]
  end
end

organizers = [
  {email: 'o1@example.com', password: 'passw@rd', name: 'organizer1', introduction: "organizer1です。\nよろしく！"},
  {email: 'o2@example.com', password: 'passw@rd', name: 'organizer2', introduction: "organizer2です。\nよろしく！"},
  {email: 'o3@example.com', password: 'passw@rd', name: 'organizer3', introduction: "organizer3です。\nよろしく！"},
  {email: 'o4@example.com', password: 'passw@rd', name: 'organizer4', introduction: "organizer4です。\nよろしく！"},
  {email: 'o5@example.com', password: 'passw@rd', name: 'organizer5', introduction: "organizer5です。\nよろしく！"},
]

organizers.each do |organizer|
  Organizer.find_or_create_by(email: organizer[:email]) do |o|
    o.password = organizer[:password]
    o.name = organizer[:name]
    o.introduction = organizer[:introduction]
  end
end

applicants = [
  {email: 'a1@example.com', password: 'passw@rd', name: 'applicant1', introduction: "applicant1です。\nよろしく！"},
  {email: 'a2@example.com', password: 'passw@rd', name: 'applicant2', introduction: "applicant2です。\nよろしく！"},
  {email: 'a3@example.com', password: 'passw@rd', name: 'applicant3', introduction: "applicant3です。\nよろしく！"},
  {email: 'a4@example.com', password: 'passw@rd', name: 'applicant4', introduction: "applicant4です。\nよろしく！"},
  {email: 'a5@example.com', password: 'passw@rd', name: 'applicant5', introduction: "applicant5です。\nよろしく！"},
]

applicants.each do |applicant|
  Applicant.find_or_create_by(email: applicant[:email]) do |a|
    a.password = applicant[:password]
    a.name = applicant[:name]
    a.introduction = applicant[:introduction]
  end
end

events = [
  {name: 'イベント1', description: "最高のイベント1しかみえない未来！", organizer: 'o1@example.com' },
  {name: 'イベント2', description: "最高のイベント2しかみえない未来！", organizer: 'o2@example.com' },
  {name: 'イベント3', description: "最高のイベント3しかみえない未来！", organizer: 'o3@example.com' },
  {name: 'イベント4', description: "最高のイベント4しかみえない未来！", organizer: 'o4@example.com' },
  {name: 'イベント5', description: "最高のイベント5しかみえない未来！", organizer: 'o5@example.com' },
]

events.each do |event|
  o = Organizer.find_by(email: event[:organizer])
  Event.find_or_create_by(name: event[:name], organizer_id: o.id) do |e|
    e.description = event[:description]
  end
end