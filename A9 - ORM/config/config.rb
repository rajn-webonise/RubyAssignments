require 'byebug'
require 'yaml'
require 'active_record'

$APP_ROOT = File.dirname(__FILE__).chomp "config"

db_config = YAML::load(File.open($APP_ROOT +'config/database.yml'))
db_config["database"] = $APP_ROOT + db_config["database"]
#$DB_CONFIG = db_config
ActiveRecord::Base.establish_connection(db_config)
