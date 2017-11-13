Pod::Spec.new do |s|

# pod trunk push AXTableKit.podspec

  s.name         = "AXTableKit"
  s.version      = "0.0.2"
  s.summary      = "快速生成TableView的工具，可用于测试功能，也可用于app中的设置列表。"
  s.homepage     = "http://xaoxuu.com"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "xaoxuu" => "xaoxuu@gmail.com" }
  s.platform     = :ios, "8.0"
  s.ios.deployment_target = '8.0'
  #  When using multiple platforms
  # s.ios.deployment_target = "5.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/xaoxuu/AXTableKit.git", :tag => "#{s.version}", :submodules => true}

  # s.source_files  = "AXTableKit/**/*.{h,m}"
  s.public_header_files = 'AXTableKit/**/*.{h}'
  s.source_files = 'AXTableKit/**/*.{h,m}'

  # s.exclude_files = "Classes/Exclude"
  # s.public_header_files = 'AXTableKit/**/*.{h}'

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"
  # s.resources = "AXTableKit/*.{bundle}"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"

  s.frameworks = "Foundation", "UIKit", 'QuartzCore', 'CoreGraphics'
  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
