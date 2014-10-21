require 'fileutils'
require 'rubygems'

TARGETS = []
TARGETS << 'iPad 2 (8.0 Simulator)'
TARGETS << 'iPhone 6 (8.0 Simulator)'
TARGETS << 'iPhone 4s (8.0 Simulator)'

version = ">= 0"

if ARGV.first
  str = ARGV.first
  str = str.dup.force_encoding("BINARY") if str.respond_to? :force_encoding
  if str =~ /\A_(.*)_\z/
    version = $1
    ARGV.shift
  end
end

TARGETS.each do |target|
	ENV['DEVICE_TARGET'] = target
	screenshot_path = File.join("screenshots", target.gsub('(8.0 Simulator)', '').gsub(' ', ''), "")
	ENV['SCREENSHOT_PATH'] = screenshot_path
	FileUtils.mkdir_p(screenshot_path)

	puts "Running using #{target} storing screenshots #{screenshot_path}"

	gem 'cucumber', version
	load Gem.bin_path('cucumber', 'cucumber', version)
end
