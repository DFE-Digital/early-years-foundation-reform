unless User.exists?(email: "dev@hfeyp.com")
  User.create! do |u|
    u.email = "dev@hfeyp.com"
    u.password = "11abXY!@"
    u.role = "admin"
  end

  User.create! do |u|
    u.email = "guy@home.com"
    u.password = "11abXY!@"
    u.role = "editor"
  end
end
