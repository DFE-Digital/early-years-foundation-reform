unless User.exists?(email: "dev@hfeyp.com")
  User.create! do |u|
    u.email = "developer@dev.com"
    u.password = "devdev"
    u.role = "editor"
  end

  User.create! do |u|
    u.email = "reader@dev.com"
    u.password = "readerreader"
    u.role = "reader"
  end
end
