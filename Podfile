# platform :ios, '9.0'
use_frameworks!

def install_pods
  pod 'FMDB', '2.6.2'
end

def testing_pods
    pod 'Quick'
    pod 'Nimble'
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
