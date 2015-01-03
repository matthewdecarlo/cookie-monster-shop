require_relative 'cookies_and_ovens'

def display_main_menu
"
- - - - - - - M A I N   M E N U - - - - - - - -
1. Prepare and Start to Bake Batch of Cookies
2. Check the Status of Cookie Batch
3. Remove and Display Batch of Cookies
4. Feed the Cookie Monster
0. Exit
- - - - - - - - - - - - - - - - - - - - - - - -

"
end

def display_prompt
  "Enter selection: "
end

def clear_screen
  system('clear')
  print "Welcome to:
#{Logo}
"
end

clear_screen
print display_main_menu
print display_prompt

cookie_monster_shop = Bakery.new
cookie_monster_shop.get_recipes('cookies.csv')

user_input = nil

while user_input != 0
  user_input = gets.chomp

  case user_input.to_i
  when 1
    clear_screen
    print cookie_monster_shop.display_menu
    print display_prompt

    user_input = gets.chomp
    a_batch = cookie_monster_shop.prep_batch(user_input)

    clear_screen
  print display_main_menu

    puts "Preparing cookie batch to bake."
  cookie_monster_shop.bake(a_batch)
    puts "Baking cookies in the oven.\n\n"
    print display_prompt
  when 2
    clear_screen
    print display_main_menu
    puts "The cookies are #{cookie_monster_shop.get_batch_status(a_batch)}!\n\n"
    print display_prompt
  when 3
    clear_screen
    print display_main_menu
  cookie_monster_shop.remove_cookies!(a_batch)
    puts "Removing the #{a_batch.name} batch from the oven.\n\n"
    print display_prompt
  when 4
    clear_screen
    print display_main_menu
    puts "'C' is for COOKIE, NOM-NOM-NOM-NOM!\n\n"
    print display_prompt
  when 0
    clear_screen
    puts "Congrats your batch of #{a_batch.name} cookies are #{cookie_monster_shop.get_batch_status(a_batch)}!"
    if cookie_monster_shop.get_batch_status(a_batch) == "done"
      print "You are a Cookie Ninja!"
    else
      print "The Cookie Force is not with you..."
    end
  break
  end
end

puts "Exiting application"

