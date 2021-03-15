# frozen_string_literal:true

def user_access(user)
  env = if user.downcase == "cms"
          CMS_ENV
        else
          APP_ENV
        end
  open_app(env)
end

def proceed_to(page_name)
  page_name = page_name.downcase.gsub!(" ", "")
  case page_name
  # temp for CMS PoC
  when "writing1"
    link_clk("Edit", WRITING1_LINK3POS)
  # temp for CMS PoC
  when "writing2"
    link_clk("Edit", WRITING2_LINK4POS)
  else
    puts "Case statement required: #{page}"
  end
end

def process_event(obj, event) end

def open_app(env)
  visit(env)
  # temp for cms poc
  if expect(page).to have_text("Log in")
    enter("user_email", CMS_USER)
    enter("user_password", CMS_P)
    click_on "commit"
  else
    puts "Signed In"
  end
end

def enter(fld, val)
  fill_in(fld, with: val)
end

def link_clk(name, pos)
  page.all(:link, name)[pos].click
end
