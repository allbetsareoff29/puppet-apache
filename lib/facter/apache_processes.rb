# Facter.add(:web, :type => :aggregate) do
	# chunk(:server) do
		# web = {:server => 'Nginx'}
		# web
	# end
	# chunk(:version) do
		# if Facter::Core::Execution.which('nginx') != nil
			# version = Facter::Core::Execution.execute('nginx -v | 2>&1 | grep -Po [0-9]+\.[0-9]+\.[0-9]+')
			# web = {:version => version}
		# end
		# web
	# end
	# chunk(:processes) do
		# processes = Facter::Core::Execution.execute('pgrep nginx | wc -l')
		# web = {:processes => processes}
		# web
	# end
# end

Facter.add(:apache_processes) do
	confine :kernel => "Linux"
	setcode do
		osfamily = Facter.value(:osfamily)
		case osfamily
		when 'Debian'
			Facter::Core::Execution.execute('pgrep apache2 | wc -l')
		when 'RedHat'
			Facter::Core::Execution.execute('pgrep httpd | wc -l')
		end
	end
end
