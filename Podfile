
platform :ios, '10.0'

target 'ExampleApp' do

  use_frameworks!

  pod 'Dengage.Framework', :git => 'https://github.com/whitehorse-technology/Dengage.Framework.git', :branch => 'master'

  target 'DengageNotificationServiceExtension' do
    pod 'Dengage.Framework', :git => 'https://github.com/whitehorse-technology/Dengage.Framework.git', :branch => 'master'
  end
  
  target 'DengageContentExtension' do
    use_frameworks!
    pod 'Dengage.Framework', :git => 'https://github.com/whitehorse-technology/Dengage.Framework.git', :branch => 'master'
  end
  
  target 'ExampleAppTests' do
    inherit! :search_paths
    # Pods for testing
  end
  
  post_install do |installer|
      installer.pods_project.targets.each do |target|
          if target.name == 'Dengage.Framework'
              target.build_configurations.each do |config|
                  config.build_settings['APPLICATION_EXTENSION_API_ONLY'] = 'No'
              end
          end
      end
  end
end
