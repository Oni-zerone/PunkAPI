#
# Be sure to run `pod lib lint PunkAPI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PunkAPI'
  s.version          = '0.1.0'
  s.summary          = 'A little swift wrapper for PunkAPI by @samjbmason'
  s.swift_version    = '4.2'
  
  s.description      = <<-DESC
  "Have you ever wanted to search through Brewdog's expansive back catalogue of beer in a programmatic way? Maybe build a tool that pairs beer with food, or search beers with an abv of more than 4%? Well now your prayers have been answered!"
                       DESC

  s.homepage         = 'https://github.com/Oni-zerone/PunkAPI'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Andrea Altea' => 'oni.zerone@gmail.com' }
  s.source           = { :git => 'https://github.com/Oni-zerone/PunkAPI.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/Oni_zerone'

  s.ios.deployment_target = '10.0'

  s.default_subspec = 'API'
  s.subspec 'API' do |sp|
      sp.source_files = 'PunkAPI/Classes/**/*'
  end

  s.subspec 'PromiseKit' do |sp|
      sp.source_files = 'PunkAPI/PromiseKit/Classes/**/*'
  end
  
  # s.resource_bundles = {
  #   'PunkAPI' => ['PunkAPI/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
