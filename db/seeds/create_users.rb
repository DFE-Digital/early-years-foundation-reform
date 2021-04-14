unless User.exists?(email: "dev@hfeyp.com")
  User.create! do |u|
    u.email = "dev@hfeyp.com"
    u.password = "Partyw0rd"
    u.role = "editor"
  end

  User.create! do |u|
    u.email = "guy@home.com"
    u.password = "guyguy"
    u.role = "editor"
  end
end
