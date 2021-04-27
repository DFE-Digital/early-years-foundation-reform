# frozen_string_literal:true

def user_access(user)
  env = if user.downcase == "cms"
          CMS_ENV
        else
          APP_ENV
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
  else
    raise("Case statement required: #{page_name}")
  end
end

def open_app(env)
  visit(env)
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
  rescue
    retry if (attempts += 1) < ATTEMPTS
  end
  if attempts == ATTEMPTS
<<<<<<< HEAD
    raise("check_page_heading #{type}:#{header} Not Found after #{attempts} attempts")
=======
    fail("check_page_heading #{type}:#{header} Not Found after #{attempts} attempts")
>>>>>>> 9b929cd68083161b662c3df224349135280029e5
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
  else
<<<<<<< HEAD
    @ul = ""
=======
    ul = ""
>>>>>>> 9b929cd68083161b662c3df224349135280029e5
  end
  if @ul != ""
    @menu = @ul.collect(&:text)
  end
end

<<<<<<< HEAD
def check_page_obj(type, tbl)
=======
def check_page_obj(type, tbl, unused)
>>>>>>> 9b929cd68083161b662c3df224349135280029e5
  case type.downcase
  when "links"
    expect_links(tbl)
  else
<<<<<<< HEAD
    raise ArgumentError, "Argument not known: '#{type}'"
=======
    fail!(raise(ArgumentError.new("Argument not known '#{type}'")))
>>>>>>> 9b929cd68083161b662c3df224349135280029e5
  end
end

def expect_links(tbl)
<<<<<<< HEAD
  for i in 0..tbl.raw.count - 1 do
    tbl.raw[i].each { |lnk|
=======
  for i in 0..tbl.raw.count-1 do
    tbl.raw[i].each {|lnk|
>>>>>>> 9b929cd68083161b662c3df224349135280029e5
      lnk_string(lnk)
      expect(page).to have_link(@lnk, visible: true, count: @lnk_count)
    }
  end
end

def clk(obj)
  case obj.downcase
  when "btn"
    click_button obj
  else
    first(:link, obj, visible: true).click
  end
end

def search(parameter, values)
  begin
    @ul = find(parameter).all(values)
  rescue StandardError => e
    puts "Fail: #{e}"
  end
end

def process_func(func, table)
  tbl = table.raw
  case func
  when "displayed"
    tbl.each do |text|
      display_check(text[0])
    end
  else
<<<<<<< HEAD
    raise ArgumentError, "Argument not known.  Expected: 'displayed' Actual: '#{func}'"
=======
    fail!(raise(ArgumentError.new("Argument not known.  Expected: 'displayed' Actual: '#{func}'")))
>>>>>>> 9b929cd68083161b662c3df224349135280029e5
  end
end

def display_check(text)
  expect(page).to have_text text
end

def lnk_string(lnk)
  @lnk = lnk
  @lnk_count = 1
<<<<<<< HEAD
  if lnk.index("[") != nil
    @lnk_count = lnk[lnk.index("[")..lnk.index("]")].gsub("[", "").gsub(" times]", "")
    @lnk = lnk[0..lnk.index("[") - 1]
=======
  if lnk.index('[') != nil
    @lnk_count = lnk[lnk.index('[')..lnk.index(']')].gsub("[","").gsub(" times]","")
    @lnk = lnk[0..lnk.index("[")-1]
>>>>>>> 9b929cd68083161b662c3df224349135280029e5
  end
end

def tab_click(obj, tab_cnt)
  key_send = Array.new
  tab_cnt.to_i.times do
    key_send << :tab
  end
  key_send << :enter
  find(:link, obj, visible: true).send_keys(key_send)
end

def check_value(actual, expected)
  if actual != expected
    puts "FAIL Expected: '#{actual}'  Actual: '#{expected}'"
<<<<<<< HEAD
    @excep = "e"
=======
    @e = "e"
>>>>>>> 9b929cd68083161b662c3df224349135280029e5
  end
end

def check_value_proc(obj, value)
<<<<<<< HEAD
  @excep = ""
=======
  @e = ""
>>>>>>> 9b929cd68083161b662c3df224349135280029e5
  actual = find(Object.const_get(obj.upcase.gsub!(" ","_"))).text
  check_value(value, actual)
  exception_call("'" + obj + "'" + " " + __method__.to_s)
end

def check_item(pos, desc)
<<<<<<< HEAD
  if @menu[pos - 1] != desc
    puts "FAIL Expected: '#{desc}' at position '#{pos}' Actual: '#{@menu[pos - 1]}'"
    @excep = "e"
=======
  if @menu[pos-1] != desc
    puts "FAIL Expected: '#{desc}' at position '#{pos}' Actual: '#{@menu[pos-1]}'"
    @e = "e"
>>>>>>> 9b929cd68083161b662c3df224349135280029e5
  end
end

def check_one_item(list, pos, desc)
<<<<<<< HEAD
  @excep = ""
=======
  @e = ""
>>>>>>> 9b929cd68083161b662c3df224349135280029e5
  check_item(pos.to_i, desc)
  exception_call(list.downcase + " " + __method__.to_s)
end

def exception_call(called_by)
<<<<<<< HEAD
  if @excep != ""
=======
  if @e != ""
>>>>>>> 9b929cd68083161b662c3df224349135280029e5
    raise("#{called_by} not as Expected. See 'FAIL(s)'")
  end
end
