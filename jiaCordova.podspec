#
#  Be sure to run `pod spec lint jiaCore.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#
#

Pod::Spec.new do |s|

s.name         = "JiaCordova"
s.version      = "0.3.3"
s.summary      = "在Cordova及插件的基础上封装一些常用的功能"

s.homepage     = "https://github.com/wujunyang/JiaCordova"
s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
s.author             = { "wujunyang" => "wujunyang@126.com" }

s.platform     = :ios, "8.0"
s.source       = { :git => "https://github.com/wujunyang/JiaCordova.git", :tag => "#{s.version}" }
s.requires_arc = true


s.subspec 'JiaAFNetworking' do |ss|
ss.source_files = 'JiaCordova/JiaAFNetworking/**/*.{h,m}'
end

s.subspec 'JiaNetwork' do |ss|
ss.source_files = 'JiaCordova/JiaNetwork/**/*.{h,m}'
ss.dependency 'JiaCordova/JiaAFNetworking'
ss.framework = "CFNetwork"
end

s.subspec 'JiaMBProgressHUD' do |ss|
ss.source_files = 'JiaCordova/JiaMBProgressHUD/**/*.{h,m}'
ss.resources  = "JiaCordova/JiaMBProgressHUD/**/*.bundle"
end

s.subspec 'JiaCordovaConfig' do |ss|
ss.resources  = "JiaCordova/JiaCordovaConfig/*"
end

s.subspec 'JiaCordovaPlugin' do |ss|
ss.source_files = 'JiaCordova/JiaCordovaPlugin/**/*.{h,m}'
end

s.subspec 'JiaCordovaManager' do |ss|
ss.source_files = 'JiaCordova/JiaCordovaManager/**/*.{h,m}'
ss.dependency 'JiaCordova/JiaAFNetworking'
ss.dependency 'JiaCordova/JiaNetwork'
ss.dependency 'JiaCordova/JiaMBProgressHUD'
ss.dependency 'JiaCordova/JiaCordovaPlugin'
end


# 系统库依赖
s.frameworks = 'UIKit','MobileCoreServices', 'CoreGraphics', 'Security', 'SystemConfiguration'


s.dependency 'SSZipArchive'
# Cordova 依赖
s.dependency 'Cordova'
s.dependency 'CordovaPlugin-console'
s.dependency 'cordova-plugin-camera'
s.dependency 'cordova-plugin-contacts'
s.dependency 'cordova-plugin-device'
s.dependency 'cordova-plugin-device-orientation'
s.dependency 'cordova-plugin-device-motion'
s.dependency 'cordova-plugin-globalization'
s.dependency 'cordova-plugin-geolocation'
s.dependency 'cordova-plugin-file'
s.dependency 'cordova-plugin-media-capture'
s.dependency 'cordova-plugin-network-information'
s.dependency 'cordova-plugin-splashscreen'
s.dependency 'cordova-plugin-inappbrowser'
s.dependency 'cordova-plugin-file-transfer'
s.dependency 'cordova-plugin-statusbar'
s.dependency 'cordova-plugin-vibration'

# s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
end
