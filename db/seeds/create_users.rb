unless User.exists?(email: "dev@hfeyp.com")
  User.create! do |u|
    u.email = "dev@hfeyp.com"
    u.password = "Partyw0rd"
  end
  User.create! do |u|
    u.email = "guy@home.com"
    u.password = "guyguy"
  end
end
