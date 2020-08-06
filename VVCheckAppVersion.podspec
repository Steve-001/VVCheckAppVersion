
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

 spec.name         = "VVCheckAppVersion"
 spec.version      = "1.0.0"
 spec.summary      = "A tool of check app version"
 spec.description  = <<-DESC
 A tool of check app version,this tool can help you check app version
                  DESC

 spec.homepage     = "https://github.com/Steve-001/VVCheckAppVersion.git"

 spec.license      = "MIT"

 spec.author             = { "steve-001" => "VVCheckAppVersion" }
 spec.source       = { :git => "https://github.com/Steve-001/VVCheckAppVersion.git", :tag => "#{spec.version}" }

 spec.source_files  = "VVCheckAppVersion/*.{h,m}"
 spec.ios.deployment_target     = '10.0'

end
