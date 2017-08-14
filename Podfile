# platform :ios, '9.0'
use_frameworks!

def install_pods
  pod 'FMDB', '2.6.2'
end

 target 'ScheduleApp' do
  # Pods for ScheduleApp
  install_pods

  target 'ScheduleAppTests' do
    inherit! :search_paths
    # Pods for testing
        install_pods
  end

  target 'ScheduleAppUITests' do
    inherit! :search_paths
    # Pods for testing
      install_pods
  end

end
