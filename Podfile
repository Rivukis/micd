source 'https://github.com/CocoaPods/Specs.git'

platform :ios

inhibit_all_warnings!

xcodeproj 'micd'

pod 'OBShapedButton'

post_install do |installer|
    installer.project.targets.each do |target|
        puts target.name
    end
end