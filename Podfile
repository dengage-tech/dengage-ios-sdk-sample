
platform :ios, '10.0'

target 'ExampleApp' do

  use_frameworks!
 # pod 'Dengage.Framework'
  pod 'Dengage.Framework', :path => '../Dengage.Framework'
  #pod 'Dengage.Framework', :git => 'https://github.com/whitehorse-technology/Dengage.Framework.git', :branch => 'develop'
  pod 'Dengage.Framework.Extensions','1.0.10'
  
  target 'DengageNotificationServiceExtension' do
      inherit! :search_paths
  end
  
  # Pods for ExampleApp
  #pod 'Dengage.Framework'
  target 'ExampleAppTests' do
    inherit! :search_paths
    # Pods for testing
  end
end
