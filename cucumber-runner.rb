require 'fileutils'
require 'rubygems'
require 'mini_magick'

TARGETS = []
#TARGETS << 'iPad 2 (7.1 Simulator)'
TARGETS << 'iPhone 5s (7.1 Simulator)'
#TARGETS << 'iPhone 4s (7.1 Simulator)'

def add_filename_to_image(file_name)
end

TARGETS.each do |target|
	ENV['DEVICE_TARGET'] = target
	screenshot_path = File.join("screenshots", target.gsub('(7.1 Simulator)', '').gsub(' ', ''), "")
	ENV['SCREENSHOT_PATH'] = screenshot_path
	FileUtils.mkdir_p(screenshot_path)

	puts "Running using #{target} storing screenshots #{screenshot_path}"

	system('cucumber')
end

