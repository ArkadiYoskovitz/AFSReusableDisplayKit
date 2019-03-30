#
# Be sure to run `pod lib lint AFSReusableDisplayKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
    # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
    #
    #  These will help people to find your library, and whilst it
    #  can feel like a chore to fill in it's definitely to your advantage. The
    #  summary should be tweet-length, and the description more in depth.
    #
    
    s.name             = 'AFSReusableDisplayKit'
    s.version          = '1.0.1'
    s.summary          = 'AFSReusableDisplayKit allow the user to control the behavior of a reusable display elements, by encapludating it via block based builders'
    
    # This description is used to generate tags and improve search results.
    #   * Think: What does it do? Why did you write it? What is the focus?
    #   * Try to keep it short, snappy and to the point.
    #   * Write the description between the DESC delimiters below.
    #   * Finally, don't worry about the indent, CocoaPods strips it!
    
    s.description      = <<-DESC
    AFSReusableDisplayKit allow the user to control the behavior of a reusable display elements, by encapludating it via block based builders.
    AFSReusableDisplayKit contains Scrollview, CollectionView, TableView, TextView, TextField, PickerView
    DESC
    
    s.homepage         = 'https://github.com/ArkadiYoskovitz/AFSReusableDisplayKit'
    # s.screenshots    = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    
    # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
    #
    #  Licensing your code is important. See http://choosealicense.com for more info.
    #  CocoaPods will detect a license file if there is a named LICENSE*
    #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
    #
    
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    
    # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
    #
    #  Specify the authors of the library, with email addresses. Email addresses
    #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
    #  accepts just a name if you'd rather not provide an email address.
    #
    #  Specify a social_media_url where others can refer to, for example a twitter
    #  profile URL.
    #
    
    s.author           = { 'Arkadi Yoskovitz' => 'arkadi.yoskovitz@gmail.com' }
    
    # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
    #
    #  If this Pod runs only on iOS or OS X, then specify the platform and
    #  the deployment target. You can optionally include the target after the platform.
    #
    
    s.platform     = :ios , '9.0'
    
    # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
    #
    #  Specify the location from where the source should be retrieved.
    #  Supports git, hg, bzr, svn and HTTP.
    #
    s.source       = { :git => 'https://github.com/ArkadiYoskovitz/AFSReusableDisplayKit.git', :tag => s.version.to_s }
    
    # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
    #
    #  CocoaPods is smart about how it includes source code. For source files
    #  giving a folder will include any swift, h, m, mm, c & cpp files.
    #  For header files it will include any header in the folder.
    #  Not including the public_header_files will make all headers public.
    #
    
    s.source_files = 'AFSReusableDisplayKit/Code/**/*'
    # s.public_header_files = "Classes/**/*.h"
    
    # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
    #
    #  A list of resources included with the Pod. These are copied into the
    #  target bundle with a build phase script. Anything else will be cleaned.
    #  You can preserve files from being cleaned, please don't preserve
    #  non-essential files like tests, examples and documentation.
    #
    # s.resource_bundles = {
    #   'AFSReusableDisplayKit' => ['AFSReusableDisplayKit/Assets/*.png']
    # }
    
    # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
    #
    #  Link your library with frameworks, or libraries. Libraries do not include
    #  the lib prefix of their name.
    #
    
    # s.framework = "SomeFramework"
    s.frameworks = 'UIKit' , 'Foundation'
    
    # s.library   = "iconv"
    # s.libraries = "iconv", "xml2"
    
    # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
    #
    #  If your library depends on compiler flags you can set them in the xcconfig hash
    #  where they will only apply to your library.
    
    # s.requires_arc = true
    
    # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
    
    # ――― Project Swift Settings ―――――――――――――――――――――――――――――――――――――――――――――――――― #
    #
    #  If your library uses swift, use this element to set the swift version the pod uses
    
    s.swift_version = '5.0'
    
    # ――― Project Dependencies ―――――――――――――――――――――――――――――――――――――――――――――――――――― #
    #
    #  If you depend on other Podspecs you can include multiple dependencies to
    #  ensure it works.
    
    # s.dependency 'Alamofire', '~> 5.0.0-beta.3'
    
    # ――― Default Subspec ――――――――――-―――――――――――――――――――――――――――――――――――――――――――――― #
    #
    # Define the default sub spec to use in the pod
    #
    
    # s.default_subspec = 'SubPod_Common'
    
    # ――― Subspec Metadata Common ――――――――――-―――――――――――――――――――――――――――――――――――――― #
    # s.subspec 'SubPod_Common' do |spec|
    #     spec.source_files = 'AFSReusableDisplayKit/SubPod_Common/Code/**/*'
    # end
    
end
