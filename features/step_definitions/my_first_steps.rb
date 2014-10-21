Given /^I am on the Welcome Screen$/ do
  element_exists("view")
  sleep(STEP_PAUSE)
end


Then(/^I rotate the device so the home button is on the (right|left|bottom|top)$/) do |home_position|
  rotate_so_home_is_on home_position
end

    def rotate_so_home_is_on (home_position)
      home_position = 'down' if home_position.eql?('bottom')
      home_position = 'up' if home_position.eql?('top')
      rotate_home_button_to home_position
      wait_for_none_animating
    end