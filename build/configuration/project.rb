config = 
{
  :project => "nothinbutdotnetprep",
  :target => "Debug",
  :source_dir => "source",
  :artifacts_dir => "artifacts",
  :config_dir => "source/config",
  :app_dir => "source/nothinbutdotnetstore",
  :log_file_name => "nbdn_prep_log".txt,
  :log_level => "DEBUG"
}
configatron.configure_from_hash config
