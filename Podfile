# Uncomment the next line to define a global platform for your project
workspace 'Clean Architecture.xcworkspace'
platform :ios, '12.0'

use_frameworks!
#use_modular_headers!
inhibit_all_warnings!

def core_pods
  pod 'RxSwift'
end

def tool_pods
  pod 'R.swift'
  pod 'AlamofireNetworkActivityLogger'
end

def network_pods
  pod 'Moya/RxSwift'
end

def layout_pods
  pod 'Texture'
  pod 'RxCocoa'
  pod 'SnapKit'
  pod 'Hero'              
end

target 'Application' do
  project 'Application/Application.xcodeproj'
  core_pods
  tool_pods
  network_pods
  layout_pods
end

target 'Platform' do
  project 'Platform/Platform.xcodeproj'
  core_pods
  network_pods
end

target 'Domain' do
  project 'Domain/Domain.xcodeproj'
  core_pods
end

