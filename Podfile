# Uncomment the next line to define a global platform for your project
source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '12.0'

install! 'cocoapods', :deterministic_uuids => false

def nicetable_location
  { :git => 'git@github.com:frizeiro/nice-table.git', :branch => 'main' }
#  { :path => '../nice-table' }
end

def product_pods
  pod 'NiceTable', nicetable_location
  pod "PromiseKit", "~> 8"
  pod 'SDWebImage', "~> 5.0", :modular_headers => true
end

target 'RnMUniverse' do
  product_pods
end

target 'RnMUniverseTests' do
  # Pods for testing
end
