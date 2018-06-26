platform :ios, '9.0'

# ignore all warnings from all pods
inhibit_all_warnings!

use_frameworks!

def simplecounter_pods
	pod 'Bond', '~> 6.6.1'
	pod 'R.swift', '~> 4.0.0'
	pod 'SwiftLint', '~> 0.25.0'
    # pod 'PKHUD', '~> 5.0'
    # pod 'Alamofire', '~> 4.6'
end

target 'SimpleCounter' do
    simplecounter_pods
end  

target 'SimpleCounterTests' do
  simplecounter_pods
end
