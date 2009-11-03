begin
	require "metric_fu"
	require(File.join(RAILS_ROOT, 'vendor', 'gems', 'jscruggs-metric_fu-1.1.4', 'lib', 'metric_fu'))
	MetricFu::Configuration.run do |config|
	config.rcov[:rcov_opts] << "-Itest"
	#config.graphs = []
	end
	
rescue LoadError
end