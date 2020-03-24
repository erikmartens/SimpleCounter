platform :ios, '12.0'

# ignore all warnings from all pods
inhibit_all_warnings!

use_frameworks!

def simplecounter_pods
	pod 'RxSwift', '~> 5.1.0'
	pod 'RxCocoa', '~> 5.1.0'

	pod 'RxFlow', '~> 2.7.0'

	pod 'R.swift', '~> 4.0.0'
	pod 'SwiftLint', '~> 0.25.0'
end

target 'SimpleCounter' do
    simplecounter_pods
end  

target 'SimpleCounterTests' do
  simplecounter_pods
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      next if config.name.downcase.include? 'debug'
      config.build_settings['ENABLE_BITCODE'] = 'YES'
      cflags = config.build_settings['OTHER_CFLAGS'] || ['$(inherited)']
      cflags << '-fembed-bitcode'
      config.build_settings['OTHER_CFLAGS'] = cflags
    end
  end
end
