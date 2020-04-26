#
# Be sure to run `pod lib lint ScreenCaptureDetector.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ScreenCaptureDetector'
  s.version          = '0.1.1'
  s.summary          = 'helper tool intervene if App being captured via mirror screen or recorded in addition to screenshot alert'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!


   s.description     = <<-DESC
   ScreenCaptureDetector is heler tool that can detect if the application is being capture via mirror screen or recorded in addition to screenshot alert by running task in background check every 1 sec check
   * adds an overlay to your app when it is capture or mirrored
                         DESC
                         
  # s.description      = <<-DESC
  # TODO: Add long description of the pod here.
                      # DESC

  s.homepage         = 'https://github.com/amrangry/ScreenCaptureDetector'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'amrangry' => 'amr.elghadban@gmail.com' }
  s.source           = { :git => 'https://github.com/amrangry/ScreenCaptureDetector.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/amr_elghadban'
  s.ios.deployment_target = '12.0'
  #s.source_files = 'ScreenCaptureDetector/Classes/**/*'
  s.source_files = 'Source/**/*.swift'
  s.swift_version = '5.0'
  s.platforms = {
      "ios": "12.0"
  }
  # s.resource_bundles = {
  #   'ScreenCaptureDetector' => ['ScreenCaptureDetector/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
