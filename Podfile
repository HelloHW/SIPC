platform:ios ,'8.0'
inhibit_all_warnings!
use_frameworks!
source 'https://github.com/CocoaPods/Specs.git'
target 'SIPC' do
# 菊花HUD
pod 'MBProgressHUD', '~> 0.8'
# 短信验证
pod 'mob_smssdk'
# Net
pod 'AFNetworking', '~> 3.0'
#导航SDK
pod 'AMapNavi'
#下拉刷新
pod 'MJRefresh'
# toast
pod 'Toast', '~> 3.1.0'
# conversion model
pod 'MJExtension'
# 侧滑
pod 'CWLateralSlide', '~> 1.5.6'
end
#避免更新库时出现链接错误(Apple-match-link error)
post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ENABLE_BITCODE'] = 'NO'
        end
    end
end

