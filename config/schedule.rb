set :output. "#{path}/log/cron.log"

# Runs rake task after midnight to delete any tasks that are older than 7 days
every 1.day, :at => '00:01 am' do
  rake "delete_items:task"
end