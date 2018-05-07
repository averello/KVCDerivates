#
# Be sure to run `pod lib lint KVCDerivates.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KVCDerivates'
  s.version          = '2.1'
  s.summary          = 'Declares classes that can be represented by Key-Value pairs.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/averello/KVCDerivates'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'Apache 2.0', :file => 'LICENSE' }
  s.author           = { 'Georges Boumis' => 'develope.george.boumis@gmail.com' }
  s.source           = { :git => 'https://github.com/averello/KVCDerivates.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'KVCDerivates/Classes/**/*'

  s.xcconfig = { 
	  "SWIFT_VERSION" => '4.0',
  }
  
  # s.resource_bundles = {
  #   'KVCDerivates' => ['KVCDerivates/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'LKVCKit'
  s.dependency 'RepresentationKit'
end
