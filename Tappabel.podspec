#
# Be sure to run `pod lib lint Tappabel.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Tappabel'
  s.version          = '0.9.0'
  s.swift_version    = '4.0'
  s.summary          = 'A tappable UILabel written in Swift.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'A subclass of UILabel that adds tap functionality.'

  s.homepage         = 'https://github.com/ahmdx/Tappabel'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ahmed Mohamed' => 'dev@ahmd.pro' }
  s.source           = { :git => 'https://github.com/ahmdx/Tappabel.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.3'

  s.source_files = 'Tappabel/Classes/**/*'
end
