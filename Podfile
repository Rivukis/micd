source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '7.0'

inhibit_all_warnings!

xcodeproj 'micd'

pod 'OBShapedButton'
pod "SCWaveformView"

post_install do |installer|
    installer.project.targets.each do |target|
        puts target.name
    end
end