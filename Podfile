# Uncomment the next line to define a global platform for your project
source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '12.0'

install! 'cocoapods', :deterministic_uuids => false

def product_pods
  pod 'NiceTable', :git => 'git@github.com:frizeiro/nice-table.git', :branch => 'main'
  pod "PromiseKit", "~> 8"
end

target 'RnMUniverse' do
  product_pods
end

target 'RnMUniverseTests' do
  # Pods for testing
end