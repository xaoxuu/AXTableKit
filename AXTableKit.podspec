Pod::Spec.new do |s|

# pod trunk push AXTableKit.podspec

  s.name         = "AXTableKit"
  s.version = "0.0.3"
  s.summary      = "快速生成TableView的工具，可用于测试功能，也可用于app中的设置列表。"
  s.homepage     = "http://xaoxuu.com"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "xaoxuu" => "xaoxuu@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/xaoxuu/AXTableKit.git", :tag => "#{s.version}", :submodules => true}

  s.source_files = 'AXTableKit/AXTableKit/*.{h,m,mm}'
  s.requires_arc = true

end
