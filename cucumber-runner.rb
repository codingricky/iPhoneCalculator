require 'fileutils'

TARGETS = []
TARGETS << 'iPad 2 (8.0 Simulator)'
TARGETS << 'iPhone 6 (8.0 Simulator)'
TARGETS << 'iPhone 4s (8.0 Simulator)'

TARGETS.each do |target|
	ENV['DEVICE_TARGET'] = target
	screenshot_path = File.join("screenshots", target.gsub('(8.0 Simulator)', '').gsub(' ', ''), "")
	ENV['SCREENSHOT_PATH'] = screenshot_path
	FileUtils.mkdir_p(screenshot_path)

	puts "Running using #{target} storing screenshots #{screenshot_path}"
	system('cucumber')
end
