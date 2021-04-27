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
    tbl.raw[i].each do |lnk|
      lnk_string(lnk)
      expect(page).to have_link(@lnk, visible: true, count: @lnk_count)
    end
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
  exception_call("'" + obj + "'" + " " + __method__.to_s)
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
  exception_call(list.downcase + " " + __method__.to_s)
end

def exception_call(called_by)
  if @excep != ""
    raise("#{called_by} not as Expected. See 'FAIL(s)'")
  end
end
