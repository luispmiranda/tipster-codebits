Citygate::Engine.load_seed

unless Citygate::User.find_by_email('admin@tipster.com')
  user = Citygate::User.create first_name:   'Tipster',
                               last_name:    'Admin',
                               email:        'admin@tipster.com',
                               password:     'tipster',
                               confirmed_at: Time.now

  user.confirm!
  user.role = Citygate::Role.find_by_name('Admin')
  user.save
end

langs = File.open 'db/languages.txt'
langs.lines.each do |lang|
  Category.find_or_create_by_name lang
end
