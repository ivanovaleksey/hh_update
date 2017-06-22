# TODO: should it be here?
require 'dotenv'
Dotenv.load

job_type :script, 'cd :path && :task :output'

set :path, Whenever.path
set :output, File.join(path, 'log/cron.log')
set :frequency, ENV['FREQUENCY'].to_i

every frequency.hours do
  script 'rbenv exec bundle exec ./bin/script'
end
