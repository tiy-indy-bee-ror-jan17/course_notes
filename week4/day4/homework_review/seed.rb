require './lorem'
if ARGV[0] == "test"
  require './test_connection'
else
  require './dev_connection'
end

Lorem.create!(
  title: "standard",
  body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
)

Lorem.create!(
  title: "hipster",
  body: "Fixie. Beard Oil. Smelly Cheese. Sour beer."
)

Lorem.create!(
  title: "custom",
  body: "dsg dr htr ghj fth ftdg jnhft ntf tg nftgg nrtf fg bgd nfgdhn. trjrthjrtt rdh drf hrdh ghndrtfhg."
)
