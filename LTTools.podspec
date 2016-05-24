#
#  Be sure to run `pod spec lint LTTools.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "LTTools"
  s.version      = "0.0.5"
  s.summary      = "LTTools test"

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description  = <<-DESC
  This description is used to generate tags and improve search results
                   DESC

  s.homepage     = "https://github.com/yelon21/LTToolsDemo"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See http://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  # s.license      = "MIT (example)"
  s.license      = { :type => "MIT", :file => "LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  s.author             = { "yelon21" => "yelon21@gmail.com" }
  # Or just: s.author    = "yelon21"
  # s.authors            = { "yelon21" => "yelon21@gmail.com" }
  # s.social_media_url   = "http://twitter.com/yelon21"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  # s.platform     = :ios
  s.platform     = :ios, "6.0"

  #  When using multiple platforms
  # s.ios.deployment_target = "6.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  s.source       = { :git => "https://github.com/yelon21/LTToolsDemo.git", :tag => "v0.0.5" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  s.source_files  = "LTTools/**/*.{h,m}"
  # s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  s.resources = "LTTools/**/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  s.framework  = "WebKit"
  # s.frameworks = "UIKit", "WebKit"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  
  # GTMBase64
  s.subspec 'GTMBase64' do |lt|
    lt.source_files = 'LTTools/OtherLibs/GTMBase64/**/*.{h,m}'
  end
  
  # SSKeychain
  s.subspec 'SSKeychain' do |lt|
    lt.source_files = 'LTTools/OtherLibs/SSKeychain/**/*.{h,m}'
  end
  
  # LTNS
  s.subspec 'LTNS' do |lt|
    lt.source_files = 'LTTools/LTNS/**/*.{h,m}'
    lt.dependency 'LTTools/GTMBase64'
  end
  
  # LTNS
  s.subspec 'NSObject' do |lt|
    lt.source_files = 'LTTools/LTNS/NSObject/**/*.{h,m}'
    lt.dependency 'LTTools/GTMBase64'
  end
  
  # LTOther
  s.subspec 'LTContactsUtil' do |lt|
    lt.source_files = 'LTTools/LTOther/LTContactsUtil/**/*.{h,m}'
	lt.dependency 'LTTools/LTPickerView'
  end
  
  s.subspec 'LTInstallProcess' do |lt|
    lt.source_files = 'LTTools/LTOther/LTInstallProcess/**/*.{h,m}'
  end
  
  s.subspec 'LTLocation' do |lt|
    lt.source_files = 'LTTools/LTOther/LTLocation/**/*.{h,m}'
    lt.dependency 'LTTools/GTMBase64'
	lt.dependency 'LTTools/NSObject'
	lt.dependency 'LTTools/LTOpenSettings'
  end
  
  s.subspec 'LTNotification' do |lt|
    lt.source_files = 'LTTools/LTOther/LTNotification/**/*.{h,m}'
  end
  
  s.subspec 'LTOpenSettings' do |lt|
    lt.source_files = 'LTTools/LTOther/LTOpenSettings/**/*.{h,m}'
  end
  
  s.subspec 'LTPickerView' do |lt|
    lt.source_files = 'LTTools/LTOther/LTPickerView/**/*.{h,m}'
	lt.dependency 'LTTools/UIBarButtonItem'
	lt.dependency 'LTTools/UIView'
  end
  
  s.subspec 'LTPlistReader' do |lt|
    lt.source_files = 'LTTools/LTOther/LTPlistReader/**/*.{h,m}'
  end
  
  s.subspec 'LTRequest' do |lt|
    lt.source_files = 'LTTools/LTOther/LTRequest/**/*.{h,m}'
	lt.dependency 'LTTools/LTNS'
  end
  
  # LTUI
  s.subspec 'LTButton' do |lt|
    lt.source_files = 'LTTools/LTUI/LTButton/**/*.{h,m}'
  end
  
  s.subspec 'UIBarButtonItem' do |lt|
    lt.source_files = 'LTTools/LTUI/UIBarButtonItem/**/*.{h,m}'
  end
  
  s.subspec 'UIColor' do |lt|
    lt.source_files = 'LTTools/LTUI/UIColor/**/*.{h,m}'
  end
  
  s.subspec 'UIDevice' do |lt|
    lt.source_files = 'LTTools/LTUI/UIDevice/**/*.{h,m}'
	lt.dependency 'LTTools/SSKeychain'
	lt.dependency 'LTTools/LTNS'
  end
  
  s.subspec 'UIImage' do |lt|
    lt.source_files = 'LTTools/LTUI/UIImage/**/*.{h,m}'
  end
  
  s.subspec 'UIView' do |lt|
    lt.source_files = 'LTTools/LTUI/UIView/**/*.{h,m}'
  end
  
  s.subspec 'UIViewController' do |lt|
    lt.source_files = 'LTTools/LTUI/UIViewController/**/*.{h,m}'
	lt.dependency 'LTTools/UIBarButtonItem'
	lt.dependency 'LTTools/UIColor'
	lt.dependency 'LTTools/UIImage'
	lt.dependency 'LTTools/UIView'
  end
  
  #LTView
  s.subspec 'LTBadgeView' do |lt|
    lt.source_files = 'LTTools/LTUI/LTView/LTBadgeView/**/*.{h,m}'
  end
  
  s.subspec 'LTCipherText' do |lt|
    lt.source_files = 'LTTools/LTUI/LTView/LTCipherText/**/*.{h,m}'
  end
  
  s.subspec 'LTLoadingView' do |lt|
    lt.source_files = 'LTTools/LTUI/LTView/LTLoadingView/**/*.{h,m}'
  end
  
  s.subspec 'LTTitleActivityView' do |lt|
    lt.source_files = 'LTTools/LTUI/LTView/LTTitleActivityView/**/*.{h,m}'
  end
  
  s.subspec 'LTWebView' do |lt|
    lt.source_files = 'LTTools/LTUI/LTView/LTWebView/**/*.{h,m}'
	lt.dependency 'LTTools/UIBarButtonItem'
  end
end
