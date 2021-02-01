# frozen_string_literal:true

def useraccess(user)
  case user.downcase
    when "cms"
      env = $cms
    # else
    #   env = $env
  end
  visit(env)
  # temp for cms poc
  if expect(page).to have_text('Log in')
    enter('user_email',$cmsuser)
    enter('user_password',$cmsp)
    click_on 'commit'
  else
    puts "Signed In"
  end
end

def proceedto(pagename)
  pagename = pagename.downcase.gsub!(' ', '')
  case pagename
    # temp for CMS PoC
    when "writing1"
      linkclk('Edit', @@writing1link3pos)
    # temp for CMS PoC
    when "writing2"
      linkclk('Edit', @@writing2link4pos)
    else
      puts "Case statement required: #{page}"
  end
end

def processevent(obj, event)

end

def enter(fld,val)
  fill_in(fld, with: val)
end

def linkclk(name, pos)
  page.all(:link, name)[pos].click
end
