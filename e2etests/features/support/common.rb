def user_access(user)
  env = if user.downcase.index("cms")
          ENV["CMS_URL"]
        else
          ENV["SERVICE_URL"]
        end
  open_app(env)
end

def proceed_to(page, func)
  link = page
  page_name = if func == ""
                page.downcase
              else
                func.downcase
              end
  case page_name
  when "landing", "help for early years providers", "7 areas of learning blocks"
    list_items(page_name)
  when "communication and language", "physical development", "personal, social and emotional development", "literacy", "mathematics", "understanding the world", "expressive arts and design"
    click_on link
    list_items("learning areas")
  when "left-menu sub-areas"
    click_on link
    list_items("sub-areas")
  when "mobile menu learning areas", "mobile menu"
    mobile_menu(link, page_name)
  when "add user", "add user details and cancel", "add user, edit and delete", "add user with invalid passwords", "edit user with invalid passwords"
    add_cms_user(page_name)
  else
    raise("Case statement required: #{page_name}")
  end
end

def open_app(env)
  visit(env)
  if page.text.match("Log in")
    enter("user_email", ENV["USER_ADMIN"])
    enter("user_password", ENV["USER_ADMNP"])
    click_on "commit"
  end
end

def enter(fld, val)
  fill_in(fld, with: val)
end

def link_clk(name, pos)
  page.all(:link, name)[pos].click
end

def check_page_heading(type, header)
  begin
    attempts ||= 1
    expect(page).to have_selector(type, text: header)
  rescue StandardError
    retry if (attempts += 1) < ATTEMPTS
  end
  if attempts == ATTEMPTS
    raise("check_page_heading #{type}:#{header} Not Found after #{attempts} attempts")
  end
end

def list_items(page_name)
  case page_name
  when "help for early years providers", "7 areas of learning blocks"
    search(HELP_FOR_EARLY_YEARS_PROVIDERS, LI_VALUES)
  when "learning areas"
    search(LEFT_PANE_MENU, LP_LEARNING_AREAS)
  when "sub-areas"
    search(LEFT_PANE_MENU, LI_VALUES)
  when "mobile menu learning areas"
    search(MOBILE_MENU, LP_LEARNING_AREAS)
  when "mobile menu"
    search(MOBILE_MENU, UL_VALUES)
  else
    @ul = ""
  end
  if @ul != ""
    @menu = @ul.collect(&:text)
  end
end

def check_page_obj(type, tbl)
  case type.downcase
  when "links"
    expect_links(tbl)
  else
    raise ArgumentError, "Argument not known: '#{type}'"
  end
end

# rubocop:disable all
# I can't tell what the type of tbl is, so can't
# convert the 'for' to an 'each'.
def expect_links(tbl)
  for i in 0..tbl.raw.count - 1 do
    tbl.raw[i].each {|lnk|
      lnk_string(lnk)
      expect(page).to have_link(@lnk, visible: true, count: @lnk_count)
    }
  end
end
# rubocop:enable all

def clk(obj)
  case obj.downcase
  when "btn"
    click_button obj
  else
    first(:link, obj, visible: true).click
  end
end

def search(parameter, values)
  @ul = find(parameter).all(values)
rescue StandardError => e
  puts "Fail: #{e}"
end

def process_func(func, table)
  tbl = table.raw
  case func
  when "displayed"
    tbl.each do |text|
      display_check(text[0])
    end
  else
    raise ArgumentError, "Argument not known.  Expected: 'displayed' Actual: '#{func}'"
  end
end

def display_check(text)
  expect(page).to have_text text
end

def lnk_string(lnk)
  @lnk = lnk
  @lnk_count = 1
  if lnk.index("[")
    @lnk_count = lnk[lnk.index("[")..lnk.index("]")].gsub("[", "").gsub(" times]", "")
    @lnk = lnk[0..lnk.index("[") - 1]
  end
end

def tab_click(obj, tab_cnt)
  key_send = []
  tab_cnt.to_i.times do
    key_send << :tab
  end
  key_send << :enter
  find(:link, obj, visible: true).send_keys(key_send)
end

def check_value(actual, expected)
  if actual != expected
    puts "FAIL Expected: '#{actual}'  Actual: '#{expected}'"
    @excep = "e"
  end
end

def check_value_proc(obj, value)
  @excep = ""
  actual = find(Object.const_get(obj.upcase.gsub!(" ", "_"))).text
  check_value(value, actual)
  exception_call("'#{obj}' #{__method__}")
end

def check_item(pos, desc)
  if @menu[pos - 1] != desc
    puts "FAIL Expected: '#{desc}' at position '#{pos}' Actual: '#{@menu[pos - 1]}'"
    @excep = "e"
  end
end

def check_one_item(list, pos, desc)
  @excep = ""
  check_item(pos.to_i, desc)
  exception_call("#{list.downcase} #{__method__}")
end

def exception_call(called_by)
  if @excep != ""
    raise("#{called_by} not as Expected. See 'FAIL(s)'")
  end
end

def click_value_proc(obj, value)
  find(Object.const_get(obj.upcase.gsub!(" ", "_"))).click
  check_page_heading("h1", value)
end

def resize_display(width, height)
  page.driver.browser.manage.window.resize_to(width, height)
end

def click_btn(btn)
  click_on btn
end

def add_user_details
  date_time
  @user = "A0User#{@time}--"
  @user_p = "0-Ab0-Ba"
  enter_fields({ "user-first-name-field": "Admin",
                 "user-last-name-field": @user,
                 "user-email-field": "#{@user}@education.gov.uk",
                 "user-password-field": @user_p,
                 "user-password-confirmation-field": @user_p })
  radio_btn("user-role-admin-field", "false")
end

def date_time
  @time = Time.now.zone.to_i
end

def enter_fields(obj)
  obj.each do |f, d|
    fill_in(f, with: d)
  end
end

def mobile_menu(link, page_name)
  click_on link
  resize_display(500, 700)
  click_on MENU
  list_items(page_name)
end

def add_cms_user(page_name)
  click_on "Admin"
  click_on "Add user"
  return unless page_name != "add user"

  case page_name
  when "add user details and cancel"
    add_user_details
    click_on "Cancel"
  when "add user, edit and delete"
    add_user_details
    click_on "Save"
    edit_user
    delete_user
  when "add user with invalid passwords"
    add_user_details
  when "edit user with invalid passwords"
    edit_user_invalid_password
  else
    raise("Case statement required: #{page_name}")
  end
end

def radio_btn(obj, opt)
  choose(obj, visible: opt)
end

def expect_not_displayed(text)
  expect(page).to have_no_text(text)
end

def check_fields(obj)
  obj.each do |f, d|
    expect(find_field(f).value).to eq(d)
  end
end

def edit_user
  find(:id, "add-user").send_keys(:tab, :enter)
  check_page_heading("h1", "Edit user")
  check_fields({ "First name": "Admin",
                 "Last name": @user })
end

def delete_user
  click_on "Delete"
  # TODO: refactor sleep
  sleep 2
  alert = page.driver.browser.switch_to.alert
  alert.accept
  display_check("User Admin #{@user} deleted")
end

def edit_user_invalid_password
  click_on "Cancel"
  find(:id, "add-user").send_keys(:tab, :enter)
  enter("user-password-field", ENV["USER_ADMNP"])
  click_on "Save"
end
