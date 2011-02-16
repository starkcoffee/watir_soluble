module Pids
  def self.persist path, pid=Process.pid
    File.open(path, 'w') {|f| f.puts pid}
  end

  def self.kill path
    system "kill #{File.read(path)}"
    FileUtils.rm path , :force => true
  end

  def self.create_tasks params
    name = params[:name]
    command = params[:full_command]
    command ||= "LOG_PATH=tmp/#{name}.log #{params[:command]} > tmp/#{name}.out 2>&1 &"
    pid = params[:pid] || "tmp/#{name}.pid"

    directory 'tmp'

    namespace name do
      desc "start #{name}"
      task :start => 'tmp' do
        if File.exist? pid
          puts "#{name} is already running"
        else
          puts "launching #{name}"
          sh command
        end
      end

      desc "stop #{name}"
      task :stop do
        if File.exist? pid
          puts "stopping #{name}"
          Pids.kill pid
        else
          puts "#{name} was not started"
        end
      end
    end

    task :stop => ["#{name}:stop"]
    task :start => ["#{name}:start"]
  end
  
  def self.check_started app_name, check_function
    50.times do |i|
      raise "#{app_name} not started " if i == 29
      begin
        break if check_function.call()
      rescue 
      end
      puts "waiting #{i} for #{app_name}"
      sleep 2
    end
  end
end