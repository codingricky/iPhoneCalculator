require 'fileutils'
require 'rubygems'
require 'mini_magick'

TARGETS = []
TARGETS << 'iPad 2 (7.1 Simulator)'
TARGETS << 'iPhone 5s (7.1 Simulator)'
TARGETS << 'iPhone 4s (7.1 Simulator)'

def add_filename_to_image(file_name)
	img =  MiniMagick::Image.open(file_name)
	img.combine_options do |c|
		c.gravity "northwest"
		c.fill "red"
		c.pointsize 30
		c.draw "text 30, 30 '#{file_name}'"
	end
	img.write(file_name)
end

def append_images_together(files)
	 result =  MiniMagick::Tool::Convert.new do |convert|
	 	files.each do |f|
	 		convert << f
	 	end
	 	convert << "-append"
	 	convert << "screenshot.png"
	 end
end


outputted_screenshots = []

TARGETS.each do |target|
	ENV['DEVICE_TARGET'] = target
	screenshot_path = File.join("screenshots", target.gsub('(7.1 Simulator)', '').gsub(' ', ''), "")
	ENV['SCREENSHOT_PATH'] = screenshot_path
	FileUtils.mkdir_p(screenshot_path)

	puts "Running using #{target} storing screenshots #{screenshot_path}"
	system('cucumber')

	files = Dir.glob(File.join(screenshot_path, "*.png"))
	files.each do |file|
		add_filename_to_image(file)
		outputted_screenshots << file
	end
end

append_images_together(outputted_screenshots)

