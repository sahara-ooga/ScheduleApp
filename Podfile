# platform :ios, '9.0'
use_frameworks!

# ignore all warnings from all pods
inhibit_all_warnings!

def install_pods
  pod 'FMDB', '2.6.2'
  pod 'Eureka',:inhibit_warnings => true
end

def testing_pods
    pod 'Quick',:inhibit_warnings => true
    pod 'Nimble',:inhibit_warnings => true
end

  target 'ScheduleApp' do
    # Pods for ScheduleApp
        install_pods

  target 'ScheduleAppTests' do
    inherit! :search_paths
    # Pods for testing
        install_pods
        testing_pods
  end

  target 'ScheduleAppUITests' do
    inherit! :search_paths
    # Pods for testing
        install_pods
        testing_pods
  end

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |configuration|
            configuration.build_settings['SWIFT_VERSION'] = "3.0"
        end
    end
end
