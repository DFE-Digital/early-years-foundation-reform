unless User.exists?(email: "dev@hfeyp.com")
  User.create! do |u|
    u.email = "dev@hfeyp.com"
    u.password = "Partyw0rd"
    u.role = "admin"
  end

  User.create! do |u|
    u.email = "guy@home.com"
    u.password = "guy0guy2021"
    u.role = "editor"
  end
end
